package com.lemarket.service.account;

import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.UsernameCheckStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsernameChecker {

    private final UsersMapper usersMapper;

    @Autowired
    public UsernameChecker(UsersMapper usersMapper) {
        this.usersMapper = usersMapper;
    }

    /**
     * 根据用户名查询是否存在此用户
     * 存在返回SUCCESS and salt
     * 不存在返回ERROR
     * @param username 用户名
     * @return UsernameCheckStatus
     */
    public UsernameCheckStatus checkUsernameStatus(String username){
        Users user = getUsernameStatus(username);
        UsernameCheckStatus usernameCheckStatus = new UsernameCheckStatus();
        if(user != null){
            usernameCheckStatus.setStatus("SUCCESS");
            usernameCheckStatus.setSalt(user.getSalt());
        }
        else{
            usernameCheckStatus.setStatus("ERROR");
        }
        return usernameCheckStatus;
    }


    /**
     * 检查用户名是否存在
     * @param username 用户名
     * @return User
     */
    private Users getUsernameStatus(String username){
        return usersMapper.selectByUsername(username);
    }
}
