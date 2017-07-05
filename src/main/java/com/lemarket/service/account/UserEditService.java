package com.lemarket.service.account;

import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Token;
import com.lemarket.data.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserEditService {
    private final UsersMapper usersMapper;

    private final TokenMapper tokenMapper;

    @Autowired
    public UserEditService(UsersMapper usersMapper, TokenMapper tokenMapper) {
        this.usersMapper = usersMapper;
        this.tokenMapper = tokenMapper;
    }

    public Users getAddressByToken(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return usersMapper.selectById(token.getId());
    }

    public String setUserInfo(Users users, String tokenString){
        try{
            Token token = tokenMapper.selectByToken(tokenString);
            int id = token.getId();
            if(users.getUsername() != null)
                usersMapper.updateNameById(users.getUsername(), id);
            if(users.getGender() != null)
                usersMapper.updateGenderById(users.getGender(), id);
            if(users.getBirthday() != null)
                usersMapper.updateBirthdayById(users.getBirthday(), id);
            if(users.getAddress() != null)
                usersMapper.updateAddressById(users.getAddress(), id);
            if(users.getPhonenumber() != null)
                usersMapper.updatePhoneById(users.getPhonenumber(), id);
            if(users.getEmail() != null)
                usersMapper.updateEmailById(users.getEmail(), id);
            if(users.getIdentitynumber() != null)
                usersMapper.updateIdentityById(users.getIdentitynumber(), id);
        }catch (Exception e){
            e.printStackTrace();
            return "ERROR";
        }
        return "SUCCESS";
    }
}
