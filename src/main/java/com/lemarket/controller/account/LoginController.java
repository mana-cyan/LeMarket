package com.lemarket.controller.account;

import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.TokenString;
import com.lemarket.service.account.TokenSetter;
import com.lemarket.service.account.UserDataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    private final UserDataFactory userDataFactory;

    private final TokenSetter tokenSetter;

    @Autowired
    public LoginController(UserDataFactory userDataFactory, TokenSetter tokenSetter) {
        this.userDataFactory = userDataFactory;
        this.tokenSetter = tokenSetter;
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public TokenString login(String username, String email, String password, String validateCode, HttpServletRequest request){
        String validate = (String) request.getSession().getAttribute("code");
        if(!validate.equals(validateCode))
            return new TokenString();
        if(email == null){
            Users users = userDataFactory.getUserByUsername(username);
            if(users != null && users.getPassword().equals(password)){
                return tokenSetter.newOrGetTokenByUsername(username);
            }
        }
        else if(username == null){
            Users users = userDataFactory.getUserByEmail(email);
            if(users != null && users.getPassword().equals(password)){
                return tokenSetter.newOrGetTokenByEmail(email);
            }
        }
        return new TokenString();
    }

}
