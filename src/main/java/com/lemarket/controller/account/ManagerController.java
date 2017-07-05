package com.lemarket.controller.account;

import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.account.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ManagerController {
    private final ManagerService managerService;

    @Autowired
    public ManagerController(ManagerService managerService) {
        this.managerService = managerService;
    }

    //获取用户列表
    @RequestMapping(value = "getUserList", method = RequestMethod.GET)
    @ResponseBody
    public List<Users> getUserList(int page){
        return managerService.getUsersList((page-1)*20, 20);
    }

    //重置用户密码
    @RequestMapping(value = "resetPassword", method = RequestMethod.POST)
    @ResponseBody
    public Status resetPassword(int id, String newPassword){
        int st = managerService.resetPassword(newPassword.substring(0,32), id);
        if(st > 0 )
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //获取全部商品列表
    @RequestMapping(value = "getAllCommodityList", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> getAllCommodityList(int page){
        return managerService.getAllCommodity((page-1)*20, 20);
    }

    //搜索用户
    @RequestMapping(value = "searchUser", method = RequestMethod.GET)
    @ResponseBody
    public List<Users> searchUser(String key){
        return managerService.searchUser(key);
    }

    //搜索商品
    @RequestMapping(value = "searchCommodity", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> searchCommodity(String name){
        return managerService.searchCommodity(name);
    }

    @RequestMapping(value = "admin/login",method = RequestMethod.POST)
    public String adminLogin()
    {
        return  null;
    }

    @RequestMapping(value = "admin")
    public String admin()
    {
        return "admin/index";
    }

    @RequestMapping(value = "admin/report")
    public String adminReportPage()
    {
        return "admin/report";


    }

    @RequestMapping(value = "admin/login")
    public String adminLoginPage()
    {
        return "admin/login";
    }

    @RequestMapping(value = "admin/goods")
    public String adminGoodsPage()
    {
        return "admin/goods";
    }
}
