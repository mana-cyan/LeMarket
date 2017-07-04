package com.lemarket.service.account;

import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDataFactory {

    private final UsersMapper usersMapper;

    @Autowired
    public UserDataFactory(UsersMapper usersMapper) {
        this.usersMapper = usersMapper;
    }

    //根据username获取用户信息
    public Users getUserByUsername(String username){
        return usersMapper.selectByUsername(username);
    }

    //根据email获取用户信息
    public Users getUserByEmail(String email){
        return usersMapper.selectByEmail(email);
    }
}
