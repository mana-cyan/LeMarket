package com.lemarket.data.dao;

import com.lemarket.data.model.Orderinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderinfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table OrderInfo
     *
     * @mbg.generated
     */
    int insert(Orderinfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table OrderInfo
     *
     * @mbg.generated
     */
    List<Orderinfo> selectAll();

    List<Orderinfo> selectByIdAndStatus(int id, String status);

    List<Orderinfo> selectAllById(int id);
    int selectLast();

}