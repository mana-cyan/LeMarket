package com.lemarket.service.account;

import com.lemarket.data.dao.AddressMapper;
import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Address;
import com.lemarket.data.model.Token;
import com.lemarket.data.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserEditService {
    private final UsersMapper usersMapper;

    private final TokenMapper tokenMapper;
    private final AddressMapper addressMapper;
    @Autowired
    public UserEditService(UsersMapper usersMapper, TokenMapper tokenMapper, AddressMapper addressMapper) {
        this.usersMapper = usersMapper;
        this.tokenMapper = tokenMapper;
        this.addressMapper = addressMapper;
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

    //获取全部个人收获地址
    public List<Address> getAllAddressByToken(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return addressMapper.selectAllByUserId(token.getId());
    }

    //新增收获地址
    public int addAddress(String tokenString, String name, String address, String phone){
        Token token = tokenMapper.selectByToken(tokenString);
        Address newAddress = new Address();
        newAddress.setUser(token.getId());
        newAddress.setAddress(address);
        newAddress.setPhonenumber(phone);
        newAddress.setName(name);
        return addressMapper.insert(newAddress);
    }

    //获取个人单个收货地址
    public Address getAddress(String tokenString, int id){
        Token token = tokenMapper.selectByToken(tokenString);
        return addressMapper.selectByUserIdAndId(token.getId(),id);
    }

    //编辑收货地址
    public int editAddress(int id, String name, String address, String phone, String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        Address newAddress = new Address();
        newAddress.setName(name);
        newAddress.setPhonenumber(phone);
        newAddress.setId(token.getId());
        newAddress.setId(id);
        newAddress.setAddress(address);
        return addressMapper.updateAddress(newAddress);
    }

    //删除收获地址
    public int deleteAddress(int id){
        return addressMapper.updateByIdToDelete(id);
    }
}
