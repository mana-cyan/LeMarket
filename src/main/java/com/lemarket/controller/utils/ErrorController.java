package com.lemarket.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
    @RequestMapping(value = "error")
    public String errorPage(){
        return "error";
    }
}
