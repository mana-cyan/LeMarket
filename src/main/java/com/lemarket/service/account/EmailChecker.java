package com.lemarket.service.account;

import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.EmailCheckStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmailChecker {

    private final UsersMapper usersMapper;

    @Autowired
    public EmailChecker(UsersMapper usersMapper) {
        this.usersMapper = usersMapper;
    }

    /**
     * 检查用户名是否存在
     * @param email 邮箱
     * @return SUCCESS/ERROR
     */
    public EmailCheckStatus checkEmailStatus(String email){
        Users users = checkEmail(email);
        EmailCheckStatus emailCheckStatus = new EmailCheckStatus();
        if(users != null){
            emailCheckStatus.setStatus("SUCCESS");
            emailCheckStatus.setSalt(users.getSalt());
        }
        else {
            emailCheckStatus.setStatus("ERROR");
        }
        return emailCheckStatus;
    }

    /**
     * 根据Email查询数据库
     * @param email 邮箱
     * @return Users
     */
    private Users checkEmail(String email){
        return usersMapper.selectByEmail(email);
    }
}
