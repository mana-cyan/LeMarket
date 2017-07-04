package com.lemarket.service.account;

import org.springframework.stereotype.Service;

@Service
public class ValidateCodeChecker {
    public  boolean checkValidate(String userInput,String trueCode)
    {
        userInput=userInput.toLowerCase();
        trueCode=trueCode.toLowerCase();
        return  userInput.equals(trueCode);
    }
}
