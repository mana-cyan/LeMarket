package com.lemarket.data.dao;

import com.lemarket.data.model.Orderdetails;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderdetailsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table OrderDetails
     *
     * @mbg.generated
     */
    int insert(Orderdetails record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table OrderDetails
     *
     * @mbg.generated
     */
    List<Orderdetails> selectAll();

    List<Orderdetails> selectShopOrderByShopId(@Param("id") int id, @Param("beginRow") int beginRow, @Param("pageSize") int pageSize);

    int deleteOrderByOrderId(@Param("id") int id);
}