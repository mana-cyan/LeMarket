package com.lemarket.service.market;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.model.Commodity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommodityUpdater {
    private final CommodityMapper commodityMapper;

    @Autowired
    public CommodityUpdater(CommodityMapper commodityMapper) {
        this.commodityMapper = commodityMapper;
    }

    public boolean ChangeCommodityStatus(int id, int status) {
        Commodity commodity = commodityMapper.selectById(id);
        if (commodity == null) return false;
        commodity.setStatus(status);
        commodityMapper.updateCommodity(commodity);
        return true;
    }

    public boolean ChangeCmmodityStatus(int id) {
        return ChangeCommodityStatus(id, Math.abs(commodityMapper.selectById(id).getStatus() - 1));
    }
}
