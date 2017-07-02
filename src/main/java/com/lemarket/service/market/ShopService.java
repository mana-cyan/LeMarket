package com.lemarket.service.market;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.ShopMapper;
import com.lemarket.data.dao.TokenMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Shop;
import com.lemarket.data.model.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopService {

    private final ShopMapper shopMapper;

    private final CommodityMapper commodityMapper;

    private final TokenMapper tokenMapper;

    @Autowired
    public ShopService(ShopMapper shopMapper, CommodityMapper commodityMapper, TokenMapper tokenMapper) {
        this.shopMapper = shopMapper;
        this.commodityMapper = commodityMapper;
        this.tokenMapper = tokenMapper;
    }

    public Shop getShopById(int id){
        return shopMapper.selectById(id);
    }

    public List<Commodity> getCommodityByShopId(int id, int beginRow, int pageSize){
        return commodityMapper.selectByShopId(id, beginRow, pageSize);
    }

    //添加店铺
    public int addShop(String name, String description, String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        Shop shop = new Shop();
        shop.setName(name);
        shop.setDescription(description);
        shop.setOwner(token.getId());
        return shopMapper.insert(shop);
    }

    //根据用户token获取店铺
    public Shop getShop(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return shopMapper.selectByOwner(token.getId());
    }
}
