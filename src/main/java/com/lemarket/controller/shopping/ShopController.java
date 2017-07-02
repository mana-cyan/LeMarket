package com.lemarket.controller.shopping;

import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.market.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ShopController {

    @Autowired
    private ShopService shopService;

    @RequestMapping(value = "addShop", method = RequestMethod.POST)
    @ResponseBody
    public Status addShop(String name, String description, HttpServletRequest request){
        int answer = shopService.addShop(name, description, request.getHeader("Token"));
        if(answer == 1)
            return new Status("SUCCESS");
        else
            return new Status("ERROR");
    }
}
