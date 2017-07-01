package com.lemarket.controller.market;

import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Shop;
import com.lemarket.service.market.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ShopController {

    private final ShopService shopService;

    @Autowired
    public ShopController(ShopService shopService) {
        this.shopService = shopService;
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
}
