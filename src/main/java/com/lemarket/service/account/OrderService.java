package com.lemarket.service.account;

import com.lemarket.data.dao.OrderinfoMapper;
import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.model.Orderinfo;
import com.lemarket.data.model.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    private final TokenMapper tokenMapper;

    private final OrderinfoMapper orderinfoMapper;

    @Autowired
    public OrderService(TokenMapper tokenMapper, OrderinfoMapper orderinfoMapper) {
        this.tokenMapper = tokenMapper;
        this.orderinfoMapper = orderinfoMapper;
    }
    //根据token获取获取用户相应状态的订单记录
    public List<Orderinfo> getOrderByStatus(String tokenString, String status, int beginRow, int pageSize){
        Token token = tokenMapper.selectByToken(tokenString);
        return orderinfoMapper.selectByUserIdAndStatus(token.getId(), status, beginRow, pageSize);
    }

    //根据Token获取用户的所有订单
    public List<Orderinfo> getAllOrderById(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return orderinfoMapper.selectAllById(token.getId());
    }

    //根据店铺id获取相应状态的订单
    public List<Orderinfo> getOrderByShopIdAndStatus(int shopid, String status, int beginRow, int pageSize){
        return orderinfoMapper.selectOrderByShopIdAndStatus(shopid,status,beginRow,pageSize);
    }
}
