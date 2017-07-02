package com.lemarket.data.dao;

import com.lemarket.data.model.Shop;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ShopMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Shop
     *
     * @mbg.generated
     */
    int insert(Shop record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Shop
     *
     * @mbg.generated
     */
    List<Shop> selectAll();

    List<Shop> selectByName(String word);

    Shop selectById(int id);

    Shop selectByOwner(int owner);
}