package com.lemarket.controller.shop;

import com.lemarket.data.dao.*;
import com.lemarket.data.model.*;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.utils.CommoditySearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

@Controller
public class BuyController {

    private final UsersMapper usersMapper;

    private final CommoditySearch commoditySearch;

    private final TokenMapper tokenMapper;

    private final OrderinfoMapper orderinfoMapper;

    private final OrderdetailsMapper orderdetailsMapper;

    private final ReceiveinfoMapper receiveinfoMapper;
    private final CommoditytypeMapper commoditytypeMapper;

    @Autowired
    public BuyController(UsersMapper usersMapper, CommoditySearch commoditySearch,
                         TokenMapper tokenMapper, OrderinfoMapper orderinfoMapper,
                         OrderdetailsMapper orderdetailsMapper, ReceiveinfoMapper receiveinfoMapper, CommoditytypeMapper commoditytypeMapper) {
        this.usersMapper = usersMapper;
        this.commoditySearch = commoditySearch;
        this.tokenMapper = tokenMapper;
        this.orderinfoMapper = orderinfoMapper;
        this.orderdetailsMapper = orderdetailsMapper;
        this.receiveinfoMapper = receiveinfoMapper;
        this.commoditytypeMapper = commoditytypeMapper;
    }

    @RequestMapping(value = "pay")
    public String pay(int id, int type, int count, Model model) {
        CommodityWithShop commodityWithShop = commoditySearch.commodityWithShopById(id);
        model.addAttribute("commodity", commodityWithShop);
        model.addAttribute("type",commoditytypeMapper.selectById(type));
        model.addAttribute("count",count);
        return "user/pay";
    }

    @RequestMapping(value = "pay", method = RequestMethod.POST)
    public Status saveOrder(@RequestHeader("token") String tokenString, String name, String address,
                            String phoneNumber,
                            int id, int type, int count) {
        Token token = tokenMapper.selectByToken(tokenString);
        Orderdetails details = new Orderdetails();
        Orderinfo info = new Orderinfo();
        Receiveinfo receive = new Receiveinfo();
        Commodity commodity = commoditySearch.commoditySearchById(id);
        int userId = token.getId();
        Date time = new Date();

        info.setUser(userId);
        info.setPrice(commodity.getPrice());
        info.setTime(time);
        info.setStatus("待收货");
        int insertInfo = orderinfoMapper.insert(info);
        info.setId(orderinfoMapper.selectLast());

        receive.setUser(userId);
        receive.setName(name);
        receive.setAddress(address);
        receive.setPhonenumber(phoneNumber);
        receive.setPostcode("000000");
        int insertReceive = receiveinfoMapper.insert(receive);
        receive.setId(receiveinfoMapper.selectLatest());

        details.setOrderinfo(info.getId());
        details.setCommodity(commodity.getId());
        details.setReceive(receive.getId());
        details.setCommodityType(type);
        details.setCount(count);
        details.setTime(time);
        int insertDetails = orderdetailsMapper.insert(details);

        if(insertInfo == 1 && insertDetails == 1 && insertReceive == 1) {
            return new Status("SUCCESS");
        }
        return new Status("ERROR");
    }

}
