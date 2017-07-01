package com.lemarket.service.account;

import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Token;
import com.lemarket.data.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserEditService {
    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private TokenMapper tokenMapper;

    public Users getAddressByToken(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return usersMapper.selectById(token.getId());
    }

    public String setUserInfo(Users users, String tokenString){
        try{
            Token token = tokenMapper.selectByToken(tokenString);
            if(users.getUsername() != null)
                usersMapper.updateNameById(users.getUsername(), token.getId());
            if(users.getGender() != null)
                usersMapper.updateGenderById(users.getGender(), token.getId());
            if(users.getBirthday() != null)
                usersMapper.updateBirthdayById(users.getBirthday(), token.getId());
            if(users.getAddress() != null)
                usersMapper.updateAddressById(users.getAddress(), token.getId());
            if(users.getPhonenumber() != null)
                usersMapper.updatePhoneById(users.getPhonenumber(), token.getId());
            if(users.getEmail() != null)
                usersMapper.updateEmailById(users.getEmail(), token.getId());
            return "SUCCESS";
        }catch (Exception e){
            e.printStackTrace();
            return "ERROR";
        }
    }
}
