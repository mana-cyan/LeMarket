package com.lemarket.controller.market;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("title", "乐鲜生活");
        return "index";
    }

    @RequestMapping(value = "/index")
    public String string(Model model) {
        model.addAttribute("title", "乐鲜生活");
        return "index";
    }

}

