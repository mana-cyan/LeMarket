package com.lemarket.service.account;

import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import java.util.Base64;

/**
 * Created by gxw on 2017/7/5.
 */
@Service
public class CookieChecker {
    public CookieChecker()
    {
    }

    public String getToken(Cookie[] cookies)
    {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token"))
                return new String(Base64.getDecoder().decode(cookie.getValue()));
        }
        return null;
    }
}
