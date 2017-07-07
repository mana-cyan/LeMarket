package com.lemarket.controller.account;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Users;
import com.lemarket.data.reponseObject.Status;
import com.lemarket.service.account.AdminChecker;
import com.lemarket.service.account.ManagerService;
import com.lemarket.service.account.ValidateCodeChecker;
import com.lemarket.service.market.CommodityUpdater;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class ManagerController {
    private final ManagerService managerService;

    private final ValidateCodeChecker validateCodeChecker;

    private final AdminChecker adminChecker;

    private final UsersMapper usersMapper;

    private final CommodityMapper commodityMapper;

    private final CommodityUpdater commodityUpdater;

    @Autowired
    public ManagerController(ManagerService managerService, ValidateCodeChecker validateCodeChecker, AdminChecker adminChecker, UsersMapper usersMapper, CommodityMapper commodityMapper, CommodityUpdater commodityUpdater) {
        this.managerService = managerService;
        this.validateCodeChecker = validateCodeChecker;
        this.adminChecker = adminChecker;
        this.usersMapper = usersMapper;
        this.commodityMapper = commodityMapper;
        this.commodityUpdater = commodityUpdater;
    }

    //获取用户列表
    @RequestMapping(value = "getUserList", method = RequestMethod.GET)
    @ResponseBody
    public List<Users> getUserList(int page){
        return managerService.getUsersList((page-1)*20, 20);
    }

    /**
     * 获取Users表数据的条数，即User的数量
     * @return
     */
    @RequestMapping(value = "getCountOfUser")
    @ResponseBody
    public String getCountOfUser()
    {
        return usersMapper.getCount()+"";
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

    @RequestMapping(value = "admin/index",method = RequestMethod.POST)
    public ModelAndView adminLogin(String username,String password, String validateCode, HttpServletRequest request,HttpServletResponse response) {

        ModelAndView modelAndView=new ModelAndView();
        String trueValidateCode = (String) request.getSession().getAttribute("code");
        boolean isTrue=validateCodeChecker.checkValidate(validateCode,trueValidateCode);
        response.setCharacterEncoding("UTF-8");
        if(!isTrue) {
            modelAndView.setViewName("redirect:/admin/login");
            return modelAndView;
        }
        else
        {
            isTrue= adminChecker.check(username,password);
            if(isTrue) {
                request.getSession().setAttribute("login","SUCCESS");
                int page=1;
                int pageSize=20;
                modelAndView.setViewName("admin/index");
                List<Users> selectUsers=usersMapper.selectAll((page-1)*pageSize,pageSize);
                modelAndView.addObject("data", userListToJSON(selectUsers));
                modelAndView.addObject("totalPage",(usersMapper.getCount()-1)/pageSize+1);
                modelAndView.addObject("nowPage",page);
                return modelAndView;
            }
            else {
                modelAndView.setViewName("redirect:/admin/login");
                return modelAndView;
            }
        }
    }

    private String userListToJSON(List<Users> users)
    {
        JsonArray jsonArray=new JsonArray();
        for(Users user:users){
            JsonObject jsonObject=new JsonObject();
            jsonObject.addProperty("id",user.getId());
            jsonObject.addProperty("username",user.getUsername());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    private String commodityListToJSON(List<Commodity> commodities)
    {
        JsonArray jsonArray=new JsonArray();
        for(Commodity commodity:commodities)
        {
            JsonObject jsonObject=new JsonObject();
            jsonObject.addProperty("id",commodity.getId());
            jsonObject.addProperty("name",commodity.getName());
            jsonObject.addProperty("status",commodity.getStatus());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    @RequestMapping(value = "admin/report")
    public String adminReportPage()
    {
        return "admin/report";


    }

    /**
     * 获得admin页面的user信息，并返回页面
     * @param page
     * @return
     */
    @RequestMapping(value="admin/user")
    public ModelAndView adminPage(Integer page,HttpServletRequest request)
    {
        boolean isLogin= adminChecker.checkIsLogin(request);
        if(!isLogin) return directToAdminLogin();
        int pageSize=20;
        if(page==null) page=1;
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/index");
        modelAndView.addObject("data", userListToJSON(usersMapper.selectAll((page-1)*pageSize,pageSize)));
        modelAndView.addObject("totalPage",(usersMapper.getCount()-1)/pageSize+1);
        modelAndView.addObject("nowPage",page);
        return modelAndView;
    }

    @RequestMapping(value = "admin/login")
    public String adminLoginPage()
    {
        return "admin/login";
    }

    @RequestMapping(value = "admin/goods")
    public ModelAndView adminGoodsPage(Integer page,HttpServletRequest request)
    {
        boolean isLogin= adminChecker.checkIsLogin(request);
        if(!isLogin) return directToAdminLogin();
        int pageSize=20;
        if(page==null) page=1;
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/goods");
        modelAndView.addObject("data", commodityListToJSON(commodityMapper.selectAll((page-1)*pageSize,pageSize)));
        modelAndView.addObject("totalPage",(commodityMapper.getCount()-1)/pageSize+1);
        modelAndView.addObject("nowPage",page);
        System.out.println(commodityListToJSON(commodityMapper.selectAll((page-1)*pageSize,pageSize)));
        return modelAndView;
    }

    @RequestMapping(value = "admin/tool")
    public String adminTool(HttpServletResponse response)
    {
        response.setContentType("text/html;charset=utf-8");
        return "admin/adminToolView";
    }

    @RequestMapping(value="admin/panel")
    public String adminPanel(HttpServletResponse response)
    {
        response.setContentType("text/html;charset=utf-8");
        return "admin/panelPage";
    }

    @RequestMapping(value="admin/goods/status")
    @ResponseBody
    public Status adminChangeGoodStatus(Integer id,HttpServletRequest request,HttpServletResponse response)
    {
        boolean isLogin= adminChecker.checkIsLogin(request);
        if(!isLogin) return new Status("LOGOUT");
        boolean operationSuccess= commodityUpdater.ChangeCmmodityStatus(id);
        if(operationSuccess) return new Status("SUCCESS");
        else return new Status("ERROR");
    }

    private ModelAndView directToAdminLogin()
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("redirect:admin/login");
        return modelAndView;
    }
}
