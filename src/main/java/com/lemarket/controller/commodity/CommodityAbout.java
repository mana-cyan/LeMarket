package com.lemarket.controller.commodity;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lemarket.data.model.CommentWithUser;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Commoditytype;
import com.lemarket.data.reponseObject.CategoryDetail;
import com.lemarket.service.market.CategoryDetails;
import com.lemarket.service.market.CommodityAboutService;
import com.lemarket.service.utils.JsonConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CommodityAbout {

    public final int TYPE_COMMODITY=0;
    public final int TYPE_SHOP=1;

    private final CommodityAboutService commodityAboutService;

    private final CategoryDetails categoryDetails;

    private final JsonConverter jsonConverter;

    @Autowired
    public CommodityAbout(CommodityAboutService commodityAboutService, CategoryDetails categoryDetails, JsonConverter jsonConverter) {
        this.commodityAboutService = commodityAboutService;
        this.categoryDetails = categoryDetails;
        this.jsonConverter = jsonConverter;
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
    public List<Commodity> getCommodityOfSameCategory(int commodityId){
        return commodityAboutService.getCommodityAbout(commodityId, 0, 5);
    }

    //根据分类获取商品分页
    @RequestMapping(value = "getCommodityByCategoryId", method = RequestMethod.GET)
    public ModelAndView getCommodityByCategory(Integer categoryId, Integer page){
        if(page==null)page=1;
        if(categoryId==null) categoryId=1;
        int pageSize=8;
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("shop/search");
        modelAndView.addObject("categoryId",categoryId);
        modelAndView.addObject("totalPage",(commodityAboutService.getCommodityCount(categoryId)-1)/pageSize+1);
        modelAndView.addObject("type",TYPE_COMMODITY);
        modelAndView.addObject("nowPage",page);
        modelAndView.addObject("data",jsonConverter.commodityListToJSON(commodityAboutService.getCommodityByCategoryId(categoryId, (page-1)*8, pageSize)));
//        model.addAttribute("count", commodityAboutService.getCommodityCount(categoryId));
        //model.addAttribute("list", commodityAboutService.getCommodityByCategoryId(categoryId, (page-1)*8, 8));;
        return modelAndView;
    }


    @RequestMapping(value = "getCommodityType", method = RequestMethod.GET)
    @ResponseBody
    public List<Commoditytype> getCommodityType(int id){
        return commodityAboutService.getCommodityTypeById(id);
    }

    @RequestMapping(value = "getCategoryId", method = RequestMethod.GET)
    @ResponseBody
    public int getCategoryId(String name){
        return categoryDetails.getCategoryId(name);
    }
}
