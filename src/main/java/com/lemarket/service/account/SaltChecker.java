package com.lemarket.service.account;

import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Users;
import com.lemarket.service.utils.SaltFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaltChecker {
    private final UsersMapper usersMapper;

    @Autowired
    public SaltChecker(UsersMapper usersMapper) {
        this.usersMapper = usersMapper;
    }

    /**
     * 能够智能的根据key的类型，获取或创建用户的salt，目前能够识别的类型有
     * username和email
     * @param key 能识别user的关键字
     * @return salt
     */
    public String createOrGetSalt(String key)
    {
        if(key.contains("@")) return  createOrGetSaltByEmail(key);
        else return  createOrGetSaltByUsername(key);
    }

    public String createOrGetSaltByUsername(String username)
    {
        Users user= usersMapper.selectByUsername(username);

        boolean isNullOrEmpty=(user.getSalt()==null||user.getSalt().equals(""));
        if(isNullOrEmpty) user.setSalt(SaltFactory.genSalt());
        return  user.getSalt();
    }

    public String createOrGetSaltByEmail(String email)
    {
        Users user= usersMapper.selectByEmail(email);

        boolean isNullOrEmpty=(user.getSalt()==null||user.getSalt().equals(""));
        if(isNullOrEmpty) user.setSalt(SaltFactory.genSalt());
        return  user.getSalt();
    }

}
