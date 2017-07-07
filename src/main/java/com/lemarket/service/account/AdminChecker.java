package com.lemarket.service.account;

import com.lemarket.data.dao.AdminMapper;
import com.lemarket.data.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class AdminChecker {
    private final AdminMapper adminMapper;

    @Autowired
    public AdminChecker(AdminMapper mapper) {
        this.adminMapper = mapper;
    }

    public boolean check(String username,String password)
    {
        Admin admin= adminMapper.selectByUsername(username);
        if(admin==null) return false;
        return password.equals(admin.getPassword());
    }

    public boolean checkIsLogin(HttpServletRequest request)
    {
         String value= (String) request.getSession().getAttribute("login");
         return value.equals("SUCCESS");
    }
}
