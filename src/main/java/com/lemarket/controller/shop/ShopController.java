package com.lemarket.controller.shop;

import com.lemarket.data.dao.ShopMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.*;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.account.CookieChecker;
import com.lemarket.service.account.TokenSetter;
import com.lemarket.service.market.ShopService;
import com.lemarket.service.utils.ImageFactory;
import com.lemarket.service.utils.JsonConverter;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class ShopController {
    private final ShopService shopService;
    private final ImageFactory imageFactory;
    private final JsonConverter jsonConverter;
    private final CookieChecker cookieChecker;
    private final TokenSetter tokenSetter;

    private final ShopMapper shopMapper;

    @Autowired
    public ShopController(ShopService shopService, ImageFactory imageFactory, JsonConverter jsonConverter, CookieChecker cookieChecker, TokenSetter tokenSetter, ShopMapper shopMapper) {
        this.shopService = shopService;
        this.imageFactory = imageFactory;
        this.jsonConverter = jsonConverter;
        this.cookieChecker = cookieChecker;
        this.tokenSetter = tokenSetter;
        this.shopMapper = shopMapper;
    }

    @RequestMapping(value = "shop/navigation")
    public String getNavigation(HttpServletResponse response)
    {
        response.setContentType("text/html;charset=utf-8");
        return "business/shopNavigation";
    }

    //跳转店铺页面
    @RequestMapping(value = "shopManage")
    public String shop() {
        return "business/index";
    }

    //跳转新建店铺页面
    @RequestMapping(value = "createShop")
    public String addShop() {
        return "business/create";
    }

    //添加店铺
    @RequestMapping(value = "addShop", method = RequestMethod.POST)
    @ResponseBody
    public Status addShop(String name, String description, String phoneNumber, HttpServletRequest request){
        int answer = shopService.addShop(name, description, phoneNumber, request.getHeader("token"));
        if(answer > 0)
            //return "business/index";
            return new Status("SUCCESS");
        else
            //return "business/create";
            return new Status("ERROR");
    }

    //检查是否拥有店铺
    @RequestMapping(value = "checkRole", method = RequestMethod.GET)
    @ResponseBody
    public Status checkRole(@RequestHeader("token") String token){
        if(shopService.checkRole(token) > 0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //根据店铺id获取店铺信息
    @RequestMapping(value = "shop", method = RequestMethod.GET)
    @ResponseBody
    public ShopWithUser getShopById(int id){
        return shopService.getShopById(id);
    }

    //根据Token获取个人店铺信息
    @RequestMapping(value = "getShop", method = RequestMethod.GET)
    @ResponseBody
    public ShopWithUser getShopByToken(HttpServletRequest request){
        return shopService.getShopWithUserByToken(request.getHeader("token"));
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

    @RequestMapping(value="shop/newOrder")
    public ModelAndView getNewOrder(Integer page,HttpServletRequest request)
    {
        String token= cookieChecker.getToken(request.getCookies());
        int userId= tokenSetter.getToken(token).getId();
        int shopId=shopMapper.selectByOwner(userId).getId();
        if(page==null)page=1;
        int pageSize=5;
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("business/newOrderList");
        List<OrderWithDetail> orderDetails =shopService.getShopNewOrder(shopId,page*pageSize,pageSize);
        modelAndView.addObject("shopId",shopId);
        modelAndView.addObject("data",jsonConverter.OrdeDetailToJSON(orderDetails));
        return modelAndView;
    }

    @RequestMapping(value = "shop/historyOrder")
    public ModelAndView getHistoryOrder(Integer page,HttpServletRequest request)
    {
        String token= cookieChecker.getToken(request.getCookies());
        int userId= tokenSetter.getToken(token).getId();
        int shopId=shopMapper.selectByOwner(userId).getId();
        if(page==null)page=1;
        int pageSize=5;
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("business/historyOrderList");
        List<OrderWithDetail> orderDetails =shopService.getShopSendedOrder(shopId,page*pageSize,pageSize);
        modelAndView.addObject("shopId",shopId);
        modelAndView.addObject("data",jsonConverter.OrdeDetailToJSON(orderDetails));
        return modelAndView;
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
