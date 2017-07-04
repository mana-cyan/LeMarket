package com.lemarket.service.market;

import com.lemarket.data.dao.CommentMapper;
import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.CommoditytypeMapper;
import com.lemarket.data.model.Comment;
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

    public List<Comment> getCommentPageById(int commodityId, int pageRow, int pageSize){
        return  commentMapper.selectPageById(commodityId, pageRow, pageSize);
    }

    //按类别获取商品分页
    public List<Commodity> getCommodityAbout(int id, int pageRow, int pageSize){
        Commodity commodity = commodityMapper.selectById(id);
        return commodityMapper.selectPageByKindAndSaled(commodity.getCategory(), pageRow, pageSize);
    }

    //按类别获取商品记录条数
    public int getCommodityCount(int categoryId){
        return commodityMapper.selectCountById(categoryId);
    }

    //通过商品类型id获取商品型号
    public List<String> getCommodityTypeById(Integer id){
        return commoditytypeMapper.selectCommodityTypeById(id);
    }
}
