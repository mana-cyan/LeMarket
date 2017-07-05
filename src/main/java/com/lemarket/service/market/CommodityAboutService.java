package com.lemarket.service.market;

import com.lemarket.data.dao.*;
import com.lemarket.data.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityAboutService {
    private final CommentMapper commentMapper;

    private final CommodityMapper commodityMapper;
    private final CommoditytypeMapper commoditytypeMapper;
    private final PictureMapper pictureMapper;
    private final ShopMapper shopMapper;

    @Autowired
    public CommodityAboutService(CommentMapper commentMapper, CommodityMapper commodityMapper, CommoditytypeMapper commoditytypeMapper, PictureMapper pictureMapper, ShopMapper shopMapper) {
        this.commentMapper = commentMapper;
        this.commodityMapper = commodityMapper;
        this.commoditytypeMapper = commoditytypeMapper;
        this.pictureMapper = pictureMapper;
        this.shopMapper = shopMapper;
    }

    //根据商品id获取评论
    public List<CommentWithUser> getCommentPageById(int commodityId, int pageRow, int pageSize){
        return  commentMapper.selectPageById(commodityId, pageRow, pageSize);
    }

    //按商品类别获取相同类别商品分页
    public List<Commodity> getCommodityAbout(int id, int pageRow, int pageSize){
        Commodity commodity = commodityMapper.selectById(id);
        List<Commodity> commodityList = commodityMapper.selectPageByKindAndSaled(commodity.getCategory(), pageRow, pageSize);
        commodityList.remove(commodity);
        return commodityList;
    }

    //根据主分类获取商品分页
    public List<Commodity> getCommodityByCategoryId(int categoryId, int pageRow, int pageSize){
        return commodityMapper.selectPageByKindAndSaled(categoryId, pageRow, pageSize);
    }

    //按类别获取商品记录条数
    public int getCommodityCount(int categoryId){
        return commodityMapper.selectCountById(categoryId);
    }

    //通过商品id获取商品型号
    public List<String> getCommodityTypeById(Integer id){
        return commoditytypeMapper.selectCommodityTypeById(id);
    }


    //更新商品图标,返回原图片路径
    public void updateCommodityIcon(String path, int commodityId){
        Commodity commodity = commodityMapper.selectById(commodityId);
        int pictureId = commodity.getImage();
        pictureMapper.updateImageById(path,pictureId);
    }

    //添加商品
    public int addCommodity(Commodity commodity){
        //commodity里无店主id， 获取并设置
        Shop shop = shopMapper.selectById(commodity.getShop());
        commodity.setOwner(shop.getOwner());
        return commodityMapper.insert(commodity);
    }

    //添加商品类型
    public int addCommodityType(int id, List<String> type){
        return commoditytypeMapper.insertCommodityTypeList(id, type);
    }

    //编辑商品
    public int updateCommodity(Commodity commodity){
        if(commodity.getId() == 0)
            return 0;
        if(commodity.getName() == null)
            return 0;
        if(commodity.getDetails() == null)
            return 0;
        if(commodity.getCategory() == 0)
            return 0;
        if(commodity.getStorage() == 0)
            return 0;
        if(commodity.getPrice() == 0.0f)
            return 0;
        if(commodity.getImage() == 0)
            return 0;
        return commodityMapper.updateCommodity(commodity);
    }

    //删除商品
    public int deleteCommodity(int commodityId){
        return commodityMapper.deleteCommodity(commodityId);
    }
}
