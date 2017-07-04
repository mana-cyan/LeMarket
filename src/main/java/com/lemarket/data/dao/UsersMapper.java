package com.lemarket.data.dao;

import com.lemarket.data.model.Users;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UsersMapper {

    int insert(Users record);
    
    List<Users> selectAll();

    Users selectByUsername(String username);
    Users selectByEmail(String email);

    Users selectById(int id);

    int updateNameById(String username, int id);
    int updateGenderById(String gender, int id);
    int updateBirthdayById(Date date, int id);
    int updateAddressById(String address, int id);
    int updatePhoneById(String phone, int id);
    int updateEmailById(String email, int id);

    int updateRoleById(String role, int id);
}