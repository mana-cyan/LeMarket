package com.lemarket.controller.account;

import com.lemarket.data.reponseObject.TokenString;
import com.lemarket.service.account.Register;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RegisterController {

    private final Register register;

    @Autowired
    public RegisterController(Register register) {
        this.register = register;
    }

    @RequestMapping(value = "/register")
    public String register() {
        return "user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public TokenString register(String email,
                                String username,
                                String password,
                                HttpServletRequest request){

        //String salt = (String) request.getSession().getAttribute("salt");
        String salt = "test";
        request.getSession().removeAttribute("salt");
        return register.register(email,username,password,salt);
    }


}
