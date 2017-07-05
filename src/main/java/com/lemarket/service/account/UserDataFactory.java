package com.lemarket.service.account;

import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Token;
import com.lemarket.data.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDataFactory {

    private final UsersMapper usersMapper;
    private final TokenMapper tokenMapper;

    @Autowired
    public UserDataFactory(UsersMapper usersMapper, TokenMapper tokenMapper) {
        this.usersMapper = usersMapper;
        this.tokenMapper = tokenMapper;
    }

    //根据username获取用户信息
    public Users getUserByUsername(String username){
        return usersMapper.selectByUsername(username);
    }

    //根据email获取用户信息
    public Users getUserByEmail(String email){
        return usersMapper.selectByEmail(email);
    }

    //检查用户信息是否完整
    public String checkUserInformation(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        Users users = usersMapper.selectById(token.getId());
        if(users.getPhonenumber() == null)
            return "ERROR";
        if(users.getIdentitynumber() == null)
            return "ERROR";
        if(users.getAddress() == null)
            return "ERROR";
        return "SUCCESS";
    }
}
