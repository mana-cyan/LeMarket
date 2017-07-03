package com.lemarket.service.utils;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.ShopMapper;
import com.lemarket.data.model.Commodity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommoditySearch {
    private final ShopMapper shopMapper;

    private final CommodityMapper commodityMapper;

    @Autowired
    public CommoditySearch(ShopMapper shopMapper, CommodityMapper commodityMapper) {
        this.shopMapper = shopMapper;
        this.commodityMapper = commodityMapper;
    }

    /**
     * 搜索商品名
     * @param word 关键词
     * @return CommodityIdList 商品id
     */
    public List<Commodity> commoditySearchName(String word) {
        return commodityMapper.selectByName(word);
    }

    /**
     * 搜索商品id
     * @param id 关键词
     * @return CommodityList 商品信息
     */
    public Commodity commoditySearchId(Integer id) {
        return commodityMapper.selectById(id);
    }
}
