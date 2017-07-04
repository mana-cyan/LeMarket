package com.lemarket.controller.commodity;

import com.lemarket.data.model.Comment;
import com.lemarket.data.model.CommentWithUser;
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

    //分页获取商品评论
    @RequestMapping(value = "getComment", method = RequestMethod.GET)
    @ResponseBody
    public List<CommentWithUser> getComment(int id, int page){
        return commodityAboutService.getCommentPageById(id, (page-1)*5 , 5);
    }

    //根据商品id获取同类商品
    @RequestMapping(value = "sameCategoryByCommodityId", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> getCommodityOfSameCategory(int commodityId, int page){
        return commodityAboutService.getCommodityAbout(commodityId, (page-1)*5, 5);
    }

    //根据分类获取商品分页
    @RequestMapping(value = "getCommodityByCategoryId", method = RequestMethod.GET)
    public String getCommodityByCategory(int categoryId, int page, Model model){
        model.addAttribute("type", 0);
        model.addAttribute("count", commodityAboutService.getCommodityCount(categoryId));
        model.addAttribute("list", commodityAboutService.getCommodityByCategoryId(categoryId, (page-1)*5, 5));
        return "shop/search";
    }

    @RequestMapping(value = "getCommodityType", method = RequestMethod.GET)
    @ResponseBody
    public List<String> getCommodityType(int id){
        return commodityAboutService.getCommodityTypeById(id);
    }
}
