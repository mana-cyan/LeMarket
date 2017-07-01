package com.lemarket.data.dao;

import com.lemarket.data.model.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Comment
     *
     * @mbg.generated
     */
    int insert(Comment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Comment
     *
     * @mbg.generated
     */
    List<Comment> selectAll();

    List<Comment> selectPageById(int commodityId, int beginRow, int pageSize);
}