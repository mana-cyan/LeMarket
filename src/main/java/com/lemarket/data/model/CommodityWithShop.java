package com.lemarket.data.model;


import java.util.Date;

public class CommodityWithShop {
    private Shop shop;

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.category
     *
     * @mbg.generated
     */
    private Integer category;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.shop
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.storage
     *
     * @mbg.generated
     */
    private Integer storage;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.saled
     *
     * @mbg.generated
     */
    private Integer saled;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.price
     *
     * @mbg.generated
     */
    private Float price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.image
     *
     * @mbg.generated
     */
    private Integer image;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.visitCount
     *
     * @mbg.generated
     */
    private Integer visitcount;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.status
     *
     * @mbg.generated
     */
    private Integer status;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.time
     *
     * @mbg.generated
     */
    private Date time;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.owner
     *
     * @mbg.generated
     */
    private Integer owner;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column Commodity.details
     *
     * @mbg.generated
     */
    private String details;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.id
     *
     * @return the value of Commodity.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.id
     *
     * @param id the value for Commodity.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.category
     *
     * @return the value of Commodity.category
     *
     * @mbg.generated
     */
    public Integer getCategory() {
        return category;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.category
     *
     * @param category the value for Commodity.category
     *
     * @mbg.generated
     */
    public void setCategory(Integer category) {
        this.category = category;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.name
     *
     * @return the value of Commodity.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.name
     *
     * @param name the value for Commodity.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.storage
     *
     * @return the value of Commodity.storage
     *
     * @mbg.generated
     */
    public Integer getStorage() {
        return storage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.storage
     *
     * @param storage the value for Commodity.storage
     *
     * @mbg.generated
     */
    public void setStorage(Integer storage) {
        this.storage = storage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.saled
     *
     * @return the value of Commodity.saled
     *
     * @mbg.generated
     */
    public Integer getSaled() {
        return saled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.saled
     *
     * @param saled the value for Commodity.saled
     *
     * @mbg.generated
     */
    public void setSaled(Integer saled) {
        this.saled = saled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.price
     *
     * @return the value of Commodity.price
     *
     * @mbg.generated
     */
    public Float getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.price
     *
     * @param price the value for Commodity.price
     *
     * @mbg.generated
     */
    public void setPrice(Float price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.image
     *
     * @return the value of Commodity.image
     *
     * @mbg.generated
     */
    public Integer getImage() {
        return image;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.image
     *
     * @param image the value for Commodity.image
     *
     * @mbg.generated
     */
    public void setImage(Integer image) {
        this.image = image;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.visitCount
     *
     * @return the value of Commodity.visitCount
     *
     * @mbg.generated
     */
    public Integer getVisitcount() {
        return visitcount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.visitCount
     *
     * @param visitcount the value for Commodity.visitCount
     *
     * @mbg.generated
     */
    public void setVisitcount(Integer visitcount) {
        this.visitcount = visitcount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.status
     *
     * @return the value of Commodity.status
     *
     * @mbg.generated
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.status
     *
     * @param status the value for Commodity.status
     *
     * @mbg.generated
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.time
     *
     * @return the value of Commodity.time
     *
     * @mbg.generated
     */
    public Date getTime() {
        return time;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.time
     *
     * @param time the value for Commodity.time
     *
     * @mbg.generated
     */
    public void setTime(Date time) {
        this.time = time;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.owner
     *
     * @return the value of Commodity.owner
     *
     * @mbg.generated
     */
    public Integer getOwner() {
        return owner;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.owner
     *
     * @param owner the value for Commodity.owner
     *
     * @mbg.generated
     */
    public void setOwner(Integer owner) {
        this.owner = owner;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column Commodity.details
     *
     * @return the value of Commodity.details
     *
     * @mbg.generated
     */
    public String getDetails() {
        return details;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column Commodity.details
     *
     * @param details the value for Commodity.details
     *
     * @mbg.generated
     */
    public void setDetails(String details) {
        this.details = details == null ? null : details.trim();
    }
}