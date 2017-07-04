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

    public List<Orderinfo> getOrderByStatus(String tokenString, String status){
        Token token = tokenMapper.selectByToken(tokenString);
        return orderinfoMapper.selectByIdAndStatus(token.getId(), status);
    }

    public List<Orderinfo> getAllOrderById(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return orderinfoMapper.selectAllById(token.getId());
    }
}
