package com.lemarket.controller.commodity;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.CommodityWithShop;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.market.CommodityAboutService;
import com.lemarket.service.utils.CommoditySearch;
import com.lemarket.service.utils.ImageFactory;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class CommodityController {
    private final CommodityMapper commodityMapper;
    private final CommoditySearch commoditySearch;
    private final ImageFactory imageFactory;
    private final CommodityAboutService commodityAboutService;

    @Autowired
    public CommodityController(CommodityMapper commodityMapper, CommoditySearch commoditySearch, ImageFactory imageFactory, CommodityAboutService commodityAboutService) {
        this.commodityMapper = commodityMapper;
        this.commoditySearch = commoditySearch;

        this.imageFactory = imageFactory;
        this.commodityAboutService = commodityAboutService;
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

    //上传商品图片
    @RequestMapping(value = "uploadCommodityImage", method = RequestMethod.POST)
    @ResponseBody
    public Status uploadCommodity(MultipartFile multipartFile, int id, HttpSession session) throws IOException {
        String path = imageFactory.saveFile(multipartFile,session);
        if(!path.equals("ERROR")) {
            commodityAboutService.updateCommodityIcon(path, id);
            return new Status("SUCCESS");
        }
        return new Status("ERROR");
    }

    @RequestMapping(value = "watchCommodity")
    public String watchCommodity() {
        return "business/watchCommodity";
    }

    @RequestMapping(value = "publishCommodity")
    public String addCommodity() {
        return "business/publishCommodity";
    }

    //添加商品
    @RequestMapping(value = "addCommodity", method = RequestMethod.POST)
    @ResponseBody
    public int addCommodity(Commodity commodity, HttpServletRequest request){
        commodity.setTime(new Date());
        return commodityAboutService.addCommodity(commodity, request.getHeader("token"));
    }

    //添加商品类型
    @RequestMapping(value = "addCommodityType", method = RequestMethod.POST)
    @ResponseBody
    public Status addCommodityType(int id,String type) {
        System.out.println(type);
        int insertNumber = commodityAboutService.addCommodityType(id, type);
        if (insertNumber > 0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //编辑商品信息
    @RequestMapping(value = "editCommodity", method = RequestMethod.GET)
    @ResponseBody
    public Status editCommodity(Commodity commodity){
        int st = commodityAboutService.updateCommodity(commodity);
        if(st > 0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //删除商品
    @RequestMapping(value = "deleteCommodity", method = RequestMethod.POST)
    @ResponseBody
    public Status deleteCommodity(int id){
        int st = commodityAboutService.deleteCommodity(id);
        if(st > 0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }
}
