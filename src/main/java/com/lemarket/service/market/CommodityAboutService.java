package com.lemarket.service.market;

import com.lemarket.data.dao.CommentMapper;
import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.model.Comment;
import com.lemarket.data.model.Commodity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityAboutService {
    private final CommentMapper commentMapper;

    private final CommodityMapper commodityMapper;

    @Autowired
    public CommodityAboutService(CommentMapper commentMapper, CommodityMapper commodityMapper) {
        this.commentMapper = commentMapper;
        this.commodityMapper = commodityMapper;
    }

    public List<Comment> getCommentPageById(int commodityId, int pageRow, int pageSize){
        return  commentMapper.selectPageById(commodityId, pageRow, pageSize);
    }

    public List<Commodity> getCommodityAbout(int id){
        Commodity commodity = commodityMapper.selectById(id);
        return commodityMapper.selectPageByKindAndSaled(commodity.getCategroy());
    }
}
