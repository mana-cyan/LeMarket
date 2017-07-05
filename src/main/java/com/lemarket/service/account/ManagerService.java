package com.lemarket.service.account;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerService {
    private final UsersMapper usersMapper;
    private final CommodityMapper commodityMapper;

    @Autowired
    public ManagerService(UsersMapper usersMapper, CommodityMapper commodityMapper) {
        this.usersMapper = usersMapper;
        this.commodityMapper = commodityMapper;
    }

    //获取用户列表
    public List<Users> getUsersList(int beginRow, int pageSize){
        return usersMapper.selectAll(beginRow, pageSize);
    }

    //更新用户密码
    public int resetPassword(String newPassword, int id){
        return usersMapper.updatePasswordById(newPassword, id);
    }

    //获取商品列表
    public List<Commodity> getAllCommodity(int beginRow, int pageSize){
        return commodityMapper.selectAll(beginRow, pageSize);
    }

    //搜索用户
    public List<Users> searchUser(String key){
        return usersMapper.selectUserByNameOrEmail(key);
    }

    //搜索商品
    public List<Commodity> searchCommodity(String name){
        return commodityMapper.selectByName(name);
    }
}
