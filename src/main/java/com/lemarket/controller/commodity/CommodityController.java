package com.lemarket.controller.commodity;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.CommodityWithShop;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.market.CommodityAboutService;
import com.lemarket.service.utils.CommoditySearch;
import com.lemarket.service.utils.ImageFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

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
        if(multipartFile.getSize()>0){
            String fileName = multipartFile.getOriginalFilename();
            if(fileName.endsWith(".png") || fileName.endsWith(".jpg") || fileName.endsWith(".gif")){
                String uploadPath = "/static/upload/";
                String path = session.getServletContext().getRealPath(uploadPath);
                String[] splits = fileName.split(".");
                String newFileName = new Date().toString() + "." + splits[splits.length-1];
                String oldPath = commodityAboutService.updateCommodityIcon(uploadPath+newFileName, id);
                //删除原图标
                imageFactory.deleteFile(session.getServletContext().getRealPath("/") + oldPath);
                //写入新图标
                imageFactory.saveFile(multipartFile.getInputStream(), path + newFileName);
            }
        }else {
            return new Status("ERROR");
        }
        return new Status("SUCCESS");
    }
}
