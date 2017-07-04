package com.lemarket.service.account;

import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.model.Token;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.TokenString;
import com.lemarket.service.utils.TokenFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

@Service
public class TokenSetter {

    private final TokenMapper tokenMapper;

    private final UserDataFactory userDataFactory;

    @Autowired
    public TokenSetter(TokenMapper tokenMapper, UserDataFactory userDataFactory) {
        this.tokenMapper = tokenMapper;
        this.userDataFactory = userDataFactory;
    }

    //根据username生成token
    private TokenString createToken(String username){
        String token = TokenFactory.create(username, 14*24*3600*1000);
        return new TokenString(token);
    }

    //根据用户id检查用户Token是否存在,若存在返回，若不存在，返回null
    private Token getToken(int id){
        return tokenMapper.selectById(id);
    }

    //根据用户名获取token,若存在，直接返回，不存在或过期，创建新Token
    public TokenString newOrGetTokenByUsername(String username){
        Users users = userDataFactory.getUserByUsername(username);
        //查找token是否存在
        Token token = getToken(users.getId());
        //若不存在，直接新建
        if(token == null) {
            return addTokenToTable(username);
        }

        boolean isExpire=checkTokenIsExpire(token);
        if(isExpire){
            return addTokenToTable(username);
        }
        return addTokenToTable(username);
    }

    //根据邮箱获取token,若存在，直接返回，不存在或过期，创建新Token
    public TokenString newOrGetTokenByEmail(String email){
        Users users = userDataFactory.getUserByEmail(email);
        String username = users.getUsername();
        return newOrGetTokenByUsername(username);
    }

    public boolean checkTokenIsValid(String token)
    {
        Token tokenProperty=tokenMapper.selectByToken(token);
        if(tokenProperty==null) return false;
        boolean isExpire=checkTokenIsExpire(tokenProperty);
        if(isExpire) return  false;
        return true;
    }

    //生成新的Token放入数据库,无视条件
    private TokenString addTokenToTable(String username){
        //删除旧的Token
        int id = userDataFactory.getUserByUsername(username).getId();
        tokenMapper.deleteById(id);

        //生成新token插入表
        TokenString tokenString = createToken(username);
        Date date = new Date();
        int validity = 14;
        Token token = new Token();
        token.setToken(tokenString.getToken());
        token.setId(id);
        token.setDateCreate(date);
        token.setValidity(validity);
        tokenMapper.insert(token);
        return tokenString;
    }

    private boolean checkTokenIsExpire(Token token)
    {
        Date date = token.getDateCreate();
        int day = token.getValidity();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR, day*24);
        long val = System.currentTimeMillis() - calendar.getTimeInMillis();
        return val>0;
    }
}
