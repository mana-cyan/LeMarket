package com.lemarket.data.dao;

import com.lemarket.data.model.Commoditytype;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommoditytypeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CommodityType
     *
     * @mbg.generated
     */
    int insert(Commoditytype record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CommodityType
     *
     * @mbg.generated
     */
    List<Commoditytype> selectAll();

    List<String> selectCommodityTypeById(@Param("id") int id);

    int insertCommodityType(int commodityId, String type);
}