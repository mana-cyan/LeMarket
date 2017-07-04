package com.lemarket.controller.account;

import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.TokenString;
import com.lemarket.service.account.PasswordChecker;
import com.lemarket.service.account.TokenSetter;
import com.lemarket.service.account.UserDataFactory;
import com.lemarket.service.account.ValidateCodeChecker;
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

    private final PasswordChecker passwordChecker;

    private final ValidateCodeChecker validateCodeChecker;

    @Autowired
    public LoginController(UserDataFactory userDataFactory, TokenSetter tokenSetter, PasswordChecker passwordChecker, ValidateCodeChecker validateCodeChecker) {
        this.userDataFactory = userDataFactory;
        this.tokenSetter = tokenSetter;
        this.passwordChecker=passwordChecker;
        this.validateCodeChecker = validateCodeChecker;
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public TokenString login(String username, String email, String password, String validateCode, HttpServletRequest request){
        String trueValidateCode = (String) request.getSession().getAttribute("code");
        if(!validateCodeChecker.checkValidate(validateCode, trueValidateCode))
            return new TokenString();
        if(email == null){
            Users users = userDataFactory.getUserByUsername(username);
            System.out.println("ValidUserAccess");
            if(users != null && users.getPassword().equals(passwordChecker.getSavePasswordPart(password))){
                System.out.println("ValidPassword");
                return tokenSetter.newOrGetTokenByUsername(username);
            }
        }
        else if(username == null){
            Users users = userDataFactory.getUserByEmail(email);
            if(users != null && users.getPassword().equals(passwordChecker.getSavePasswordPart(password))){
                return tokenSetter.newOrGetTokenByEmail(email);
            }
        }
        return new TokenString();
    }

    @RequestMapping(value = "/checkIsLogin")
    @ResponseBody
    public String checkIsLogin(String token)
    {
        boolean isValid=tokenSetter.checkTokenIsValid(token);
        if(isValid) return "SUCCESS";
        else return "ERROR";
    }
}
