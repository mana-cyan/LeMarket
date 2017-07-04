package com.lemarket.controller.commodity;

import com.lemarket.data.model.Comment;
import com.lemarket.data.model.Commodity;
import com.lemarket.service.market.CommodityAboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    //根据类别获取同类商品
    @RequestMapping(value = "sameCategory", method = RequestMethod.GET)
    public String getCommodityByCategory(int id, int page, Model model){
        model.addAttribute("type", 0);
        model.addAttribute("count",commodityAboutService.getCommodityCount(id));
        model.addAttribute("list",commodityAboutService.getCommodityAbout(id, (page-1)*5, 5));
        return "shop/search";
    }
}
