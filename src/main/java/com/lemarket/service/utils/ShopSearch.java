package com.lemarket.service.utils;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.ShopMapper;
import com.lemarket.data.model.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopSearch {

    private final ShopMapper shopMapper;

    private final CommodityMapper commodityMapper;

    @Autowired
    public ShopSearch(ShopMapper shopMapper, CommodityMapper commodityMapper) {
        this.shopMapper = shopMapper;
        this.commodityMapper = commodityMapper;
    }

    /**
     * 搜索店铺名
     * @param word 关键词
     * @return ShopIdList 店铺id
     */
    public List<Shop> shopSearchName(String word) {
        return shopMapper.selectByName(word);
    }

    /**
     * 搜索店铺id
     * @param id 关键词
     * @return ShopIdList 店铺信息
     */
    public Shop shopSearchId(Integer id) {
        return shopMapper.selectById(id);
    }
}
