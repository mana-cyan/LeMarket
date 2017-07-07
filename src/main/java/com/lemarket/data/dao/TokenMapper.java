package com.lemarket.data.dao;

import com.lemarket.data.model.Token;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TokenMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Token
     *
     * @mbg.generated
     */
    int insert(Token record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Token
     *
     * @mbg.generated
     */
    List<Token> selectAll();

    Token selectById(@Param("id") int id);

    int deleteById(@Param("id") int id);

    Token selectByToken(@Param("token") String token);
    int selectUserById(@Param("id") int id);

}