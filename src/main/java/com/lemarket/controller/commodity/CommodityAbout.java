package com.lemarket.controller.commodity;

import com.lemarket.data.model.Comment;
import com.lemarket.data.model.Commodity;
import com.lemarket.service.market.CommodityAboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommodityAbout {
    private final CommodityAboutService commodityAboutService;

    @Autowired
    public CommodityAbout(CommodityAboutService commodityAboutService) {
        this.commodityAboutService = commodityAboutService;
    }

    //分页获取商品
    @RequestMapping(value = "getComment", method = RequestMethod.GET)
    @ResponseBody
    public List<Comment> getComment(int id, int page){
        return commodityAboutService.getCommentPageById(id, (page-1)*5 + 1, 5);
    }

    //获取同类商品
    @RequestMapping(value = "preferSameCommodity", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> getCommodityByCategory(int id){
        return commodityAboutService.getCommodityAbout(id);
    }
}
