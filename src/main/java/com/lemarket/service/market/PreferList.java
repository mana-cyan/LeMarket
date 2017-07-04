package com.lemarket.service.market;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.model.Commodity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PreferList {

    private final CommodityMapper commodityMapper;

    @Autowired
    public PreferList(CommodityMapper commodityMapper) {
        this.commodityMapper = commodityMapper;
    }

    public List<Commodity> getPreferListObject(){
       return commodityMapper.selectBySaledOrder();
    }
}
