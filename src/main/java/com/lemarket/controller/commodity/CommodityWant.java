package com.lemarket.controller.commodity;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.OrderdetailsMapper;
import com.lemarket.data.dao.OrderinfoMapper;
import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Orderdetails;
import com.lemarket.data.model.Orderinfo;
import com.lemarket.data.model.Token;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.utils.CommoditySearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
public class CommodityWant {

    private final CommoditySearch commoditySearch;

    private final TokenMapper tokenMapper;

    private final OrderinfoMapper orderinfoMapper;

    private final OrderdetailsMapper orderdetailsMapper;

    @Autowired
    public CommodityWant(CommoditySearch commoditySearch,
                               TokenMapper tokenMapper, OrderinfoMapper orderinfoMapper, OrderdetailsMapper orderdetailsMapper) {
        this.commoditySearch = commoditySearch;
        this.tokenMapper = tokenMapper;
        this.orderinfoMapper = orderinfoMapper;
        this.orderdetailsMapper = orderdetailsMapper;

    }

    @RequestMapping(value = "want", method = RequestMethod.GET)
    @ResponseBody
    public Status want(Integer id, Integer type, Integer count, Token token) {
        Orderdetails details = new Orderdetails();
        Orderinfo info = new Orderinfo();
        Commodity commodity = commoditySearch.commoditySearchById(id);
        int userId = tokenMapper.selectUserById(token.getId());
        Date time = new Date();

        info.setUser(userId);
        info.setPrice(commodity.getPrice());
        info.setTime(time);
        info.setStatus("待付款");
        int insertInfo = orderinfoMapper.insert(info);
        info.setId(orderinfoMapper.selectLast());

        details.setOrderinfo(info.getId());
        details.setCommodity(commodity.getId());
        details.setCommodityType(type);
        details.setCount(count);
        details.setTime(time);
        int insertDetails = orderdetailsMapper.insert(details);

        if(insertInfo == 1 && insertDetails == 1) {
            return new Status("SUCCESS");
        }
        return new Status("ERROR");
    }
}
