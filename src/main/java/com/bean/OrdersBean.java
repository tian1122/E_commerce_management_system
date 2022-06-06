package com.bean;

import java.io.Serializable;

public class OrdersBean implements Serializable {
    private int orderId;
    private String orderIdReadOnly;
    private String goodsName;
    private String goodsNameReadOnly;
    private String customersName;
    private String customersNameReadOnly;
    private String createDate;
    private String createDateReadOnly;
    private String contactWay;
    private String contactWayReadOnly;
    private double subtotal;
    private String subtotalReadOnly;
    private String admin;
    private String adminReadOnly;
    private int adminId;
    private String adminIdReadOnly;
    private int customerId;
    private String customerIdReadOnly;
    private int num;
    private String numReadOnly;

    public OrdersBean() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderIdReadOnly() {
        return orderIdReadOnly;
    }

    public void setOrderIdReadOnly(String orderIdReadOnly) {
        this.orderIdReadOnly = orderIdReadOnly;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsNameReadOnly() {
        return goodsNameReadOnly;
    }

    public void setGoodsNameReadOnly(String goodsNameReadOnly) {
        this.goodsNameReadOnly = goodsNameReadOnly;
    }

    public String getCustomersName() {
        return customersName;
    }

    public void setCustomersName(String customersName) {
        this.customersName = customersName;
    }

    public String getCustomersNameReadOnly() {
        return customersNameReadOnly;
    }

    public void setCustomersNameReadOnly(String customersNameReadOnly) {
        this.customersNameReadOnly = customersNameReadOnly;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getCreateDateReadOnly() {
        return createDateReadOnly;
    }

    public void setCreateDateReadOnly(String createDateReadOnly) {
        this.createDateReadOnly = createDateReadOnly;
    }

    public String getContactWay() {
        return contactWay;
    }

    public void setContactWay(String contactWay) {
        this.contactWay = contactWay;
    }

    public String getContactWayReadOnly() {
        return contactWayReadOnly;
    }

    public void setContactWayReadOnly(String contactWayReadOnly) {
        this.contactWayReadOnly = contactWayReadOnly;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public String getSubtotalReadOnly() {
        return subtotalReadOnly;
    }

    public void setSubtotalReadOnly(String subtotalReadOnly) {
        this.subtotalReadOnly = subtotalReadOnly;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getAdminReadOnly() {
        return adminReadOnly;
    }

    public void setAdminReadOnly(String adminReadOnly) {
        this.adminReadOnly = adminReadOnly;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminIdReadOnly() {
        return adminIdReadOnly;
    }

    public void setAdminIdReadOnly(String adminIdReadOnly) {
        this.adminIdReadOnly = adminIdReadOnly;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerIdReadOnly() {
        return customerIdReadOnly;
    }

    public void setCustomerIdReadOnly(String customerIdReadOnly) {
        this.customerIdReadOnly = customerIdReadOnly;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getNumReadOnly() {
        return numReadOnly;
    }

    public void setNumReadOnly(String numReadOnly) {
        this.numReadOnly = numReadOnly;
    }
}