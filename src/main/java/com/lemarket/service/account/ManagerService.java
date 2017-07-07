package com.lemarket.service.account;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Users;
import com.lemarket.service.utils.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerService {
    private final UsersMapper usersMapper;
    private final CommodityMapper commodityMapper;
    private final PasswordChecker passwordChecker;
    public final String DEFAULT_PASSWORD="123456";


    @Autowired
    public ManagerService(UsersMapper usersMapper, CommodityMapper commodityMapper, PasswordChecker passwordChecker) {
        this.usersMapper = usersMapper;
        this.commodityMapper = commodityMapper;
        this.passwordChecker = passwordChecker;
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

    public List<Commodity> getAllCommodityWithAllStatus(int beginRow,int pageSize)
    {
        return  commodityMapper.selectAllWithAllStatus(beginRow,pageSize);
    }

    public boolean changeCommodityStatus(int id, int status) {
        Commodity commodity = commodityMapper.selectById(id);
        if (commodity == null) return false;
        commodity.setStatus(status);
        System.out.println("Status:"+commodity.getStatus());
        commodityMapper.updateCommodity(commodity);
        return true;
    }

    public boolean changeCommodityStatus(int id) {
        return changeCommodityStatus(id, Math.abs(commodityMapper.selectById(id).getStatus() - 1));
    }

    //搜索用户
    public List<Users> searchUser(String key){
        return usersMapper.selectUserByNameOrEmail(key);
    }

    //搜索商品
    public List<Commodity> searchCommodity(String name){
        return commodityMapper.selectByName(name);
    }

    public boolean resetPasswordByUsername(String username)
    {
        Users selectUser=usersMapper.selectByUsername(username);
        if(selectUser==null) return false;
        resetPassword(selectUser);
        return true;
    }

    public boolean resetPasswordByEmail(String email)
    {
        Users selectUser=usersMapper.selectByEmail(email);
        if(selectUser==null) return  false;
        resetPassword(selectUser);
        return  true;
    }

    public boolean resetPasswordById(int id)
    {
        Users selectUser =usersMapper.selectById(id);
        if(selectUser ==null) return  false;
        resetPassword(selectUser);
        return  true;
    }

    private void resetPassword(Users users)
    {
        String defaultPassword= BCrypt.hashpw(DEFAULT_PASSWORD,users.getSalt());
        usersMapper.updatePasswordById(passwordChecker. getSavePasswordPart(defaultPassword),users.getId());
    }
}
