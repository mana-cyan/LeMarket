package com.lemarket.service.market;

import com.lemarket.data.dao.*;
import com.lemarket.data.model.*;
import com.lemarket.data.reponseObject.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class ShopService {

    private final ShopMapper shopMapper;

    private final CommodityMapper commodityMapper;

    private final TokenMapper tokenMapper;
    private final UsersMapper usersMapper;
    private final PictureMapper pictureMapper;

    private final OrderdetailsMapper orderdetailsMapper;

    private final OrderinfoMapper orderinfoMapper;

    @Autowired
    public ShopService(ShopMapper shopMapper, CommodityMapper commodityMapper, TokenMapper tokenMapper, UsersMapper usersMapper, PictureMapper pictureMapper, OrderdetailsMapper orderdetailsMapper, OrderinfoMapper orderinfoMapper) {
        this.shopMapper = shopMapper;
        this.commodityMapper = commodityMapper;
        this.tokenMapper = tokenMapper;
        this.usersMapper = usersMapper;
        this.pictureMapper = pictureMapper;
        this.orderdetailsMapper = orderdetailsMapper;
        this.orderinfoMapper = orderinfoMapper;
    }

    public Shop getShopById(int id){
        return shopMapper.selectById(id);
    }

    public List<Commodity> getCommodityByShopId(int id, int beginRow, int pageSize){
        return commodityMapper.selectByShopId(id, beginRow, pageSize);
    }

    //检查权限
    public int checkRole(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        Users users = usersMapper.selectById(token.getId());
        if(users.getRole() == 2)
            return 1;
        return 0;
    }

    //添加店铺
    public int addShop(String name, String description, String phone, String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        Shop shop = new Shop();
        shop.setName(name);
        shop.setDescription(description);
        shop.setOwner(token.getId());
        shop.setPhonenumber(phone);
        Users users = usersMapper.selectById(token.getId());
        if(users.getRole() == 2)
            return 0;
        usersMapper.updateRoleById(2, token.getId());
        return shopMapper.insert(shop);
    }

    //根据用户token获取店铺
    public Shop getShopByToken(String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        return shopMapper.selectByOwner(token.getId());
    }

    //更新店铺信息
    public String updateShopInformation(Shop shop, String tokenString){
        try {
            Token token = tokenMapper.selectByToken(tokenString);
            int id = token.getId();
            if(shop.getName() != null)
                shopMapper.updateName(shop.getName(), id);
            if(shop.getDescription() != null)
                shopMapper.updateDescription(shop.getDescription(), id);
            if(shop.getPhonenumber() != null)
                shopMapper.updatePhone(shop.getPhonenumber(), id);
            if(shop.getIcon() != null)
                shopMapper.updateIcon(shop.getIcon(), id);
        }catch (Exception e){
            e.printStackTrace();
            return "ERROR";
        }
        return "SUCCESS";
    }

    //更新图标
    public void updateShopIcon(String path, String tokenString){
            Token token = tokenMapper.selectByToken(tokenString);
            int userId = token.getId();
            Shop shop = shopMapper.selectByOwner(userId);
            int pictureId = shop.getIcon();
            pictureMapper.updateImageById(path, pictureId);
    }

    //获取店铺订单
    public  List<Orderdetails> getShopOrderList(int shopid, int pageRow, int pageSize){
        return orderdetailsMapper.selectShopOrderByShopId(shopid, pageRow, pageSize);
    }

    //发货
    public Status sendCommodity(int orderId){
        int i = orderinfoMapper.updateStatusById("待收货", orderId);
        if(i>0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //删除订单
    public Status deleteOrder(int orderId){
        int m = orderdetailsMapper.deleteOrderByOrderId(orderId);
        int n = orderinfoMapper.deleteOrderByOrderId(orderId);

        if(m>0 && n>0)
            return new Status("SUCCESS");
        return new Status("ERROR");
    }

    //获取店铺以发货订单
    public List<OrderWithDetail> getShopSendedOrder(int shopid, int beginRow, int pageSize){
        //待收货
        List<OrderWithDetail> listOfSended = orderinfoMapper.selectOrderByShopIdAndStatus(shopid, "待收货");
        //以完成
        List<OrderWithDetail> listOfFinished = orderinfoMapper.selectOrderByShopIdAndStatus(shopid, "已完成");
        List<OrderWithDetail> list = new ArrayList<>();
        list.addAll(listOfSended);
        list.addAll(listOfFinished);
        return list;
    }
}
