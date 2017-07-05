package com.lemarket.controller.account;

import com.lemarket.data.model.Orderinfo;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.account.OrderService;
import com.lemarket.service.account.UserEditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PersonalController {

    private final OrderService orderService;

    private final UserEditService userEditService;

    @Autowired
    public PersonalController(OrderService orderService, UserEditService userEditService) {
        this.orderService = orderService;
        this.userEditService = userEditService;
    }

    @RequestMapping(value = "unpaid", method = RequestMethod.GET)
    @ResponseBody
    public List<Orderinfo> getOrderOfUnpaid(int page, HttpServletRequest request) {
        String token = request.getHeader("Token");
        return orderService.getOrderByStatus(token, "待付款", (page - 1) * 10, 10);
    }


    @RequestMapping(value = "unreceived", method = RequestMethod.GET)
    @ResponseBody
    public List<Orderinfo> getOrderOfUnreceived(int page, HttpServletRequest request) {
        String token = request.getHeader("Token");
        return orderService.getOrderByStatus(token, "待收货", (page - 1) * 10, 10);
    }

    @RequestMapping(value = "uncomment", method = RequestMethod.GET)
    @ResponseBody
    public List<Orderinfo> getOrderOfUncomment(int page, HttpServletRequest request) {
        String token = request.getHeader("Token");
        return orderService.getOrderByStatus(token, "收货", (page - 1) * 10, 10);
    }

    @RequestMapping(value = "orderList", method = RequestMethod.GET)
    @ResponseBody
    public List<Orderinfo> getOrderOfAll(int page, HttpServletRequest request) {
        String token = request.getHeader("Token");
        return orderService.getAllOrderById(token, (page - 1) * 10, 10);
    }

    @RequestMapping(value = "getAddress", method = RequestMethod.GET)
    @ResponseBody
    public Users getAddress(HttpServletRequest request) {
        String token = request.getHeader("Token");
        return userEditService.getAddressByToken(token);
    }

    @RequestMapping(value = "setUserInfo", method = RequestMethod.GET)
    @ResponseBody
    public Status setUserInfo(@RequestBody Users users, HttpServletRequest request) {
        return new Status(userEditService.setUserInfo(users, request.getHeader("Token")));
    }

    @RequestMapping(value = "userPage")
    public String userPage() {
        return "user/userPage";
    }
}
