package com.lemarket.data.dao;

import com.lemarket.data.model.Shop;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ShopMapper {
    int insert(Shop record);
    List<Shop> selectAll();

    List<Shop> selectByName(String word);

    Shop selectById(int id);

    Shop selectByOwner(int owner);

    int updateName(String name, int id);
    int updateDescription(String description, int id);
    int updatePhone(String phone, int id);
    int updateIcon(int icon, int id);
}