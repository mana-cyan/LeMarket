package com.lemarket.service.market;

import com.lemarket.data.dao.CommentMapper;
import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.CommoditytypeMapper;
import com.lemarket.data.model.Comment;
import com.lemarket.data.model.CommentWithUser;
import com.lemarket.data.model.Commodity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityAboutService {
    private final CommentMapper commentMapper;

    private final CommodityMapper commodityMapper;
    private final CommoditytypeMapper commoditytypeMapper;

    @Autowired
    public CommodityAboutService(CommentMapper commentMapper, CommodityMapper commodityMapper, CommoditytypeMapper commoditytypeMapper) {
        this.commentMapper = commentMapper;
        this.commodityMapper = commodityMapper;
        this.commoditytypeMapper = commoditytypeMapper;
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

}
