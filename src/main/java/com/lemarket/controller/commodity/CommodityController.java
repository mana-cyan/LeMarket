package com.lemarket.controller.commodity;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.service.utils.CommoditySearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommodityController {

    private final CommodityMapper commodityMapper;

    private final CommoditySearch commoditySearch;

    @Autowired
    public CommodityController(CommodityMapper commodityMapper, CommoditySearch commoditySearch) {
        this.commodityMapper = commodityMapper;
        this.commoditySearch = commoditySearch;

    }

    @RequestMapping(value = "commodityDetails", method = RequestMethod.GET)
    public String commodityDetails(Integer id) {
        Commodity details = commoditySearch.CommoditySearchId(id);
        return "shop/commodityDetails";
    }

}
