package com.lemarket.data.dao;

import com.lemarket.data.model.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UsersMapper {

    int insert(Users record);
    
    List<Users> selectAll(@Param("beginRow") int beginRow,@Param("pageSize") int pageSize);

    Users selectByUsername(String username);
    Users selectByEmail(String email);

    Users selectById(int id);

    int updateNameById(@Param("name") String name,@Param("id") int id);
    int updateGenderById(@Param("gender") String gender, @Param("id") int id);
    int updateBirthdayById(@Param("date") Date date, @Param("id") int id);
    int updateAddressById(@Param("address") String address,@Param("id") int id);
    int updatePhoneById(@Param("phone") String phone, @Param("id") int id);
    int updateRoleById(@Param("role") String role, @Param("id") int id);
    int updatePasswordById(@Param("newPassword") String newPassword, @Param("id") int id);
    int updateIdentityById(@Param("identity") String identity, @Param("id") int id);

    List<Users> selectUserByNameOrEmail(String key);

    int getCount();
}