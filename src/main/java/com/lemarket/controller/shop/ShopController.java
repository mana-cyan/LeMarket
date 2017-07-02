package com.lemarket.controller.shop;

import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Shop;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.market.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ShopController {
    private final ShopService shopService;

    @Autowired
    public ShopController(ShopService shopService) {
        this.shopService = shopService;
    }


    @RequestMapping(value = "addShop", method = RequestMethod.POST)
    @ResponseBody
    public Status addShop(String name, String description, HttpServletRequest request){
        int answer = shopService.addShop(name, description, request.getHeader("Token"));
        if(answer == 1)
            return new Status("SUCCESS");
        else
            return new Status("ERROR");
    }

    @RequestMapping(value = "shop", method = RequestMethod.GET)
    @ResponseBody
    public Shop getShop(int id){
        return shopService.getShopById(id);
    }

    @RequestMapping(value = "shopCommodity", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> getShopCommodity(int id, int page){
        return shopService.getCommodityByShopId(id, (page-1)*5 + 1, 5);
    }

    @RequestMapping(value = "setshop", method = RequestMethod.GET)
    @ResponseBody
    public Status setShop(String name, String description, String phone, HttpServletRequest request){
        Shop shop = new Shop();
        shop.setName(name);
        shop.setDescription(description);
        shop.setPhonenumber(phone);
        String resp = shopService.updateShopInformation(shop, request.getHeader("Token"));
        return new Status(resp);
    }
}
