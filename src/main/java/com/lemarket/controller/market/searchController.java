package com.lemarket.controller.market;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class searchController {
    @RequestMapping(value = "/search")
    public String search(){
        return "shop/search";
    }
}
