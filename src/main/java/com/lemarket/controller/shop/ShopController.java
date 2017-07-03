package com.lemarket.controller.shop;

import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Shop;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.market.ShopService;
import com.lemarket.service.utils.ImageFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class ShopController {
    private final ShopService shopService;
    private final ImageFactory imageFactory;

    @Autowired
    public ShopController(ShopService shopService, ImageFactory imageFactory) {
        this.shopService = shopService;
        this.imageFactory = imageFactory;
    }


    @RequestMapping(value = "addShop", method = RequestMethod.POST)
    @ResponseBody
    public Status addShop(String name, String description, HttpServletRequest request){
        int answer = shopService.addShop(name, description, request.getHeader("Token"));
        if(answer == 1)
            return new Status("SUCCESS");
        else
            return new Status("ERROR");
    }

    @RequestMapping(value = "shop", method = RequestMethod.GET)
    @ResponseBody
    public Shop getShop(int id){
        return shopService.getShopById(id);
    }

    @RequestMapping(value = "shopCommodity", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> getShopCommodity(int id, int page){
        return shopService.getCommodityByShopId(id, (page-1)*5 + 1, 5);
    }

    @RequestMapping(value = "setshop", method = RequestMethod.GET)
    @ResponseBody
    public Status setShop(String name, String description, String phone, HttpServletRequest request){
        Shop shop = new Shop();
        shop.setName(name);
        shop.setDescription(description);
        shop.setPhonenumber(phone);
        String resp = shopService.updateShopInformation(shop, request.getHeader("Token"));
        return new Status(resp);
    }

    @RequestMapping(value = "setShopImage", method = RequestMethod.POST)
    @ResponseBody
    public Status setShopImage(MultipartFile multipartFile, HttpServletRequest request,HttpSession session) throws IOException {
        if(multipartFile.getSize()>0){
            String fileName = multipartFile.getOriginalFilename();
            if(fileName.endsWith(".png") || fileName.endsWith(".jpg") || fileName.endsWith(".gif")){
                String uploadPath = "/static/upload/";
                String path = session.getServletContext().getRealPath(uploadPath);
                String[] splits = fileName.split(".");
                String newFileName = new Date().toString() + "." + splits[splits.length-1];
                String oldPath = shopService.updateShopIcon(uploadPath+newFileName, request.getHeader("Token"));
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
