package com.lemarket.controller.account;

import com.lemarket.data.model.Address;
import com.lemarket.data.model.OrderWithDetail;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.account.CookieChecker;
import com.lemarket.service.account.OrderService;
import com.lemarket.service.account.TokenSetter;
import com.lemarket.service.account.UserEditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PersonalController {

    private final OrderService orderService;

    private final UserEditService userEditService;

    private final TokenSetter tokenSetter;

    private final CookieChecker cookieChecker;

    @Autowired
    public PersonalController(OrderService orderService, UserEditService userEditService, TokenSetter tokenSetter, CookieChecker cookieChecker) {
        this.orderService = orderService;
        this.userEditService = userEditService;
        this.tokenSetter = tokenSetter;
        this.cookieChecker = cookieChecker;
    }

    @RequestMapping(value = "unpaid", method = RequestMethod.GET)
    @ResponseBody
    public List<OrderWithDetail> getOrderOfUnpaid(int page, HttpServletRequest request) {
        String token = request.getHeader("token");
        return orderService.getOrderByStatus(token, "待付款", (page - 1) * 10, 10);
    }


    @RequestMapping(value = "unreceived", method = RequestMethod.GET)
    @ResponseBody
    public List<OrderWithDetail> getOrderOfUnreceived(int page, HttpServletRequest request) {
        String token = request.getHeader("token");
        return orderService.getOrderByStatus(token, "待收货", (page - 1) * 10, 10);
    }

    @RequestMapping(value = "uncomment", method = RequestMethod.GET)
    @ResponseBody
    public List<OrderWithDetail> getOrderOfUncomment(int page, HttpServletRequest request) {
        String token = request.getHeader("token");
        return orderService.getOrderByStatus(token, "收货", (page - 1) * 10, 10);
    }

    @RequestMapping(value = "orderList", method = RequestMethod.GET)
    @ResponseBody
    public List<OrderWithDetail> getOrderOfAll(int page, HttpServletRequest request) {
        String token = request.getHeader("token");
        return orderService.getAllOrderById(token, (page - 1) * 10, 10);
    }

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    @ResponseBody
    public Users getAddress(HttpServletRequest request) {
        String token = request.getHeader("token");
        return userEditService.getUserByToken(token);
    }

    @RequestMapping(value = "setUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public Status setUserInfo(@RequestBody Users users, HttpServletRequest request) {
        return new Status(userEditService.setUserInfo(users, request.getHeader("token")));
    }

    @RequestMapping(value = "userPage")
    public String userPage(HttpServletRequest request) {
        String token= cookieChecker.getToken(request.getCookies());
        System.out.println(token);
        boolean isValid= tokenSetter.checkTokenIsValid(token);
        if(isValid)
        return "user/userPage";
        else
            return "redirect:/login";
    }

    //获取个人所有收货地址
    @RequestMapping(value = "getAllAddress", method = RequestMethod.GET)
    @ResponseBody
    public List<Address> getAllAddress(@RequestHeader("token") String token){
        return userEditService.getAllAddressByToken(token);
    }

    //新增收货地址
    @RequestMapping(value = "addAddress", method = RequestMethod.POST)
    @ResponseBody
    public Status addAddress(String name, String address, String phone, HttpServletRequest servletRequest){
        System.out.println(name);
        int st = userEditService.addAddress(servletRequest.getHeader("token"), name,address,phone);
        if(st > 0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //获取个人单个收货地址
    @RequestMapping(value = "getAddress", method = RequestMethod.GET)
    @ResponseBody
    public Address getAddress(int id, @RequestHeader("token") String token){
        return userEditService.getAddress(token, id);
    }

    //编辑收货地址
    @RequestMapping(value = "editAddress", method = RequestMethod.POST)
    @ResponseBody
    public Status editAddress(int id, String name, String address, String phone, @RequestHeader("token") String token){
        int st = userEditService.editAddress(id, name, address, phone, token);
        if(st>0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //删除收获地址
    @RequestMapping(value = "deleteAddress", method = RequestMethod.POST)
    @ResponseBody
    public Status deleteAddress(int id){
        int st = userEditService.deleteAddress(id);
        if(st>0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }
}
