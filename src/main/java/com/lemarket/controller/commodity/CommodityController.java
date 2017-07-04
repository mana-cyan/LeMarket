package com.lemarket.controller.commodity;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.CommodityWithShop;
import com.lemarket.service.utils.CommoditySearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommodityController {

    private final CommodityMapper commodityMapper;

    private final CommoditySearch commoditySearch;

    @Autowired
    public CommodityController(CommodityMapper commodityMapper, CommoditySearch commoditySearch) {
        this.commodityMapper = commodityMapper;
        this.commoditySearch = commoditySearch;

    }

    //跳转到商品详情页
    @RequestMapping(value = "commodityDetails", method = RequestMethod.GET)
    public String commodityDetails(Integer id, Model model) {
        CommodityWithShop commodity = commoditySearch.commodityWithShopById(id);
        model.addAttribute("commodity", commodity);
        return "shop/commodityDetails";
    }

    //根据id获取商品信息
    @RequestMapping(value = "getCommodity", method = RequestMethod.GET)
    @ResponseBody
    public Commodity getCommodity(Integer id){
        return commoditySearch.commoditySearchById(id);
    }
}
