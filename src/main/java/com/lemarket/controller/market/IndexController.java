package com.lemarket.controller.market;

import com.lemarket.service.account.TokenSetter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    private final TokenSetter tokenSetter;

    @Autowired
    public IndexController(TokenSetter tokenSetter) {
        this.tokenSetter = tokenSetter;
    }

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

    @RequestMapping(value = "/redirectIndex")
    public String redirectIndex(String token)
    {
        boolean isValid= tokenSetter.checkTokenIsValid(token);
        if(isValid)
        return "redirect:index";
        else return "redirect:user/login";
    }

    @RequestMapping(value = "/getToolBar")
    public String getToolBar()
    {
        return "shop/toolBar";
    }
}

