package com.lemarket.service.market;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.ShopMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopService {

    private final ShopMapper shopMapper;

    private final CommodityMapper commodityMapper;

    @Autowired
    public ShopService(ShopMapper shopMapper, CommodityMapper commodityMapper) {
        this.shopMapper = shopMapper;
        this.commodityMapper = commodityMapper;
    }

    public Shop getShopById(int id){
        return shopMapper.selectById(id);
    }

    public List<Commodity> getCommodityByShopId(int id, int beginRow, int pageSize){
        return commodityMapper.selectByShopId(id, beginRow, pageSize);
    }
}
