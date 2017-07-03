package com.lemarket.service.market;

import com.lemarket.data.dao.*;
import com.lemarket.data.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopService {

    private final ShopMapper shopMapper;

    private final CommodityMapper commodityMapper;

    private final TokenMapper tokenMapper;
    private final UsersMapper usersMapper;
    private final PictureMapper pictureMapper;

    private final OrderdetailsMapper orderdetailsMapper;

    @Autowired
    public ShopService(ShopMapper shopMapper, CommodityMapper commodityMapper, TokenMapper tokenMapper, UsersMapper usersMapper, PictureMapper pictureMapper, OrderdetailsMapper orderdetailsMapper) {
        this.shopMapper = shopMapper;
        this.commodityMapper = commodityMapper;
        this.tokenMapper = tokenMapper;
        this.usersMapper = usersMapper;
        this.pictureMapper = pictureMapper;
        this.orderdetailsMapper = orderdetailsMapper;
    }

    public Shop getShopById(int id){
        return shopMapper.selectById(id);
    }

    public List<Commodity> getCommodityByShopId(int id, int beginRow, int pageSize){
        return commodityMapper.selectByShopId(id, beginRow, pageSize);
    }

    //添加店铺
    public int addShop(String name, String description, String tokenString){
        Token token = tokenMapper.selectByToken(tokenString);
        Shop shop = new Shop();
        shop.setName(name);
        shop.setDescription(description);
        shop.setOwner(token.getId());
        usersMapper.updateRoleById("卖家", token.getId());
        return shopMapper.insert(shop);
    }

    //根据用户token获取店铺
    public Shop getShop(String tokenString){
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

    //更新图标，返回原图标path
    public String updateShopIcon(String path, String tokenString){
            Token token = tokenMapper.selectByToken(tokenString);
            int userId = token.getId();
            //删除原有图标
            Shop shop = shopMapper.selectByOwner(userId);
            int pictureId = shop.getIcon();
            Picture oldPicture = pictureMapper.selectById(pictureId);
            pictureMapper.deleteById(pictureId);

            //插入新图标
            Picture picture = new Picture();
            picture.setPath(path);
            pictureMapper.insert(picture);
            picture = pictureMapper.selectByPath(path);
            shopMapper.updateIcon(picture.getId(), userId);
            return oldPicture.getPath();
    }

    //获取店铺订单
    public  List<Orderdetails> getShopOrderList(int shopid, int pageRow, int pageSize){
        return orderdetailsMapper.selectShopOrderByShopId(shopid, pageRow, pageSize);
    }
}
