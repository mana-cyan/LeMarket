package com.lemarket.data.model;

public class Receiveinfo {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ReceiveInfo.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ReceiveInfo.user
     *
     * @mbg.generated
     */
    private Integer user;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ReceiveInfo.postcode
     *
     * @mbg.generated
     */
    private String postcode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ReceiveInfo.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ReceiveInfo.phoneNumber
     *
     * @mbg.generated
     */
    private String phonenumber;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ReceiveInfo.address
     *
     * @mbg.generated
     */
    private String address;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ReceiveInfo.id
     *
     * @return the value of ReceiveInfo.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ReceiveInfo.id
     *
     * @param id the value for ReceiveInfo.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ReceiveInfo.user
     *
     * @return the value of ReceiveInfo.user
     *
     * @mbg.generated
     */
    public Integer getUser() {
        return user;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ReceiveInfo.user
     *
     * @param user the value for ReceiveInfo.user
     *
     * @mbg.generated
     */
    public void setUser(Integer user) {
        this.user = user;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ReceiveInfo.postcode
     *
     * @return the value of ReceiveInfo.postcode
     *
     * @mbg.generated
     */
    public String getPostcode() {
        return postcode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ReceiveInfo.postcode
     *
     * @param postcode the value for ReceiveInfo.postcode
     *
     * @mbg.generated
     */
    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ReceiveInfo.name
     *
     * @return the value of ReceiveInfo.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ReceiveInfo.name
     *
     * @param name the value for ReceiveInfo.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ReceiveInfo.phoneNumber
     *
     * @return the value of ReceiveInfo.phoneNumber
     *
     * @mbg.generated
     */
    public String getPhonenumber() {
        return phonenumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ReceiveInfo.phoneNumber
     *
     * @param phonenumber the value for ReceiveInfo.phoneNumber
     *
     * @mbg.generated
     */
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber == null ? null : phonenumber.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ReceiveInfo.address
     *
     * @return the value of ReceiveInfo.address
     *
     * @mbg.generated
     */
    public String getAddress() {
        return address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ReceiveInfo.address
     *
     * @param address the value for ReceiveInfo.address
     *
     * @mbg.generated
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }
}