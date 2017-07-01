package com.lemarket.service.account;

import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Token;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.TokenString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Register {

    private final UsersMapper usersMapper;

    private final TokenSetter tokenSetter;

    @Autowired
    public Register(UsersMapper usersMapper, TokenSetter tokenSetter) {
        this.usersMapper = usersMapper;
        this.tokenSetter = tokenSetter;
    }

    /**
     * 注册
     * @param email 邮箱
     * @param username 用户名
     * @param password 密码
     * @return Token
     */
    public TokenString register(String email, String username, String password, String salt){
        //用户信息插入数据库
        Users users = new Users();
        users.setEmail(email);
        users.setUsername(username);
        //bcrypt取32位作为密码
        users.setPassword(password.substring(0,32));
        users.setSalt(salt);
        users.setRole(1);
        usersMapper.insert(users);
        return tokenSetter.newOrGetTokenByUsername(username);
    }
}
