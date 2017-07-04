package com.lemarket.service.account;

import org.springframework.stereotype.Service;

@Service
public class PasswordChecker {
    /**
     * hash后的密码是存一部分到数据库中的，该函数能够从hash后的密码中取得该部分密码
     * @param password
     * @return
     */
    public String getSavePasswordPart(String password)
    {
        return password.substring(0,32);
    }
}
