package com.lemarket.data.dao;

import com.lemarket.data.model.Shop;
import com.lemarket.data.model.ShopWithUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ShopMapper {
    int insert(Shop record);
    List<ShopWithUser> selectAll();

    List<Shop> selectByName(@Param("word") String word);

    ShopWithUser selectById(@Param("id") int id);

    Shop selectByOwner(@Param("owner") int owner);
    ShopWithUser selectWithUserByOwner(@Param("owner") int owner);

    int updateName(@Param("name") String name, @Param("id") int id);
    int updateDescription(@Param("description") String description, @Param("id") int id);
    int updatePhone(@Param("phone") String phone,@Param("id") int id);
    int updateIcon(@Param("icon") int icon,@Param("id") int id);
}