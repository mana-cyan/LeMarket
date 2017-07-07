package com.lemarket.controller.shop;

import com.lemarket.data.model.*;
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

    //跳转店铺页面
    @RequestMapping(value = "shop")
    public String shop() {
        return "business/index";
    }

    //跳转新建店铺页面
    @RequestMapping(value = "addShop")
    public String addShop() {
        return "business/create";
    }

    //添加店铺
    @RequestMapping(value = "addShop", method = RequestMethod.POST)
    @ResponseBody
    public Status addShop(String name, String description, String phoneNumber, HttpServletRequest request){
        int answer = shopService.addShop(name, description, phoneNumber, request.getHeader("token"));
        if(answer == 1)
            return new Status("SUCCESS");
        else
            return new Status("ERROR");
    }

    //根据店铺id获取店铺信息
    @RequestMapping(value = "shop", method = RequestMethod.GET)
    @ResponseBody
    public Shop getShopById(int id){
        return shopService.getShopById(id);
    }

    //根据Token获取个人店铺信息
    @RequestMapping(value = "getShop", method = RequestMethod.GET)
    @ResponseBody
    public Shop getShopByToken(HttpServletRequest request){
        return shopService.getShopByToken(request.getHeader("token"));
    }


    /**
     * 获取店铺商品分页
     * @param id 店铺id
     * @param page 分页码
     * @return 商品List
     */
    @RequestMapping(value = "getCommodityList", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> getCommodityList(int id, int page){
        return shopService.getCommodityByShopId(id, (page-1)*5, 5);
    }

    @RequestMapping(value = "setshop", method = RequestMethod.GET)
    @ResponseBody
    public Status setShop(String name, String description, String phone, HttpServletRequest request){
        Shop shop = new Shop();
        shop.setName(name);
        shop.setDescription(description);
        shop.setPhonenumber(phone);
        String resp = shopService.updateShopInformation(shop, request.getHeader("token"));
        return new Status(resp);
    }

    //设置店铺图标
    @RequestMapping(value = "setShopImage", method = RequestMethod.POST)
    @ResponseBody
    public Status setShopImage(MultipartFile multipartFile, HttpServletRequest request,HttpSession session) throws IOException {
            String path = imageFactory.saveFile(multipartFile,session);
            if(!path.equals("ERROR")) {
                shopService.updateShopIcon(path, request.getHeader("token"));
                return new Status("SUCCESS");
            }
            return new Status("ERROR");
    }

    @RequestMapping(value = "getNewOrder", method = RequestMethod.GET)
    @ResponseBody
    public List<Orderdetails> getNewOrder(int id, int page){
        return shopService.getShopOrderList(id, (page-1)*5, 5);
    }

    /**
     * 发货
     * @param id 订单id
     * @return 发货是否成功
     */
    @RequestMapping(value = "send", method = RequestMethod.GET)
    @ResponseBody
    public Status sendCommodity(int id){
        return shopService.sendCommodity(id);
    }

    /**
     * 删除订单
     * @param id 订单id
     * @return 删除状态
     */
    @RequestMapping(value = "deleteOrder", method = RequestMethod.GET)
    @ResponseBody
    public Status deleteOrder(int id){
        return shopService.deleteOrder(id);
    }

    /**
     * 获取已发货订单
     * @param id 商铺id
     * @return 订单list
     */
    @RequestMapping(value = "getSended", method = RequestMethod.GET)
    @ResponseBody
    public List<OrderWithDetail> getSended(int id){
        return shopService.getShopSendedOrder(id, 0, 10);
    }
}
