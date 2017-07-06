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

    public Users getUserByToken(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return usersMapper.selectById(token.getId());
    }

    public String setUserInfo(Users users, String tokenString) {
        try{
            Token token = tokenMapper.selectByToken(tokenString);
            int id = token.getId();
            if(users.getName() != null &&
                    users.getGender() != null &&
                    users.getBirthday() != null &&
                    users.getAddress() != null &&
                    users.getPhonenumber() != null &&
                    users.getIdentitynumber() != null) {
                usersMapper.updateNameById(users.getName(), id);
                usersMapper.updateGenderById(users.getGender(), id);
                usersMapper.updateBirthdayById(users.getBirthday(), id);
                usersMapper.updateAddressById(users.getAddress(), id);
                usersMapper.updatePhoneById(users.getPhonenumber(), id);
                usersMapper.updateIdentityById(users.getIdentitynumber(), id);
            }else {
                return "ERROR";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "ERROR";
        }
        return "SUCCESS";
    }
}
