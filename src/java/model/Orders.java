/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author DuongDT
 */
public class Orders {
    private int orderId;
    private float price;
    private int status;
    private Date orderDate;
    private String address;
    private String phoneNumber;
    private List<ProductOrders> lp;
    private String userMail;
    private Date receivedDate;
    private String discount; 
    
    public Orders() {
        
    }

    public Orders(int orderId, float price, int status, Date orderDate, String address, String phoneNumber, List<ProductOrders> lp, String userMail, Date receivedDate) {
        this.orderId = orderId;
        this.price = price;
        this.status = status;
        this.orderDate = orderDate;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.lp = lp;
        this.userMail = userMail;
        this.receivedDate = receivedDate;
    }
    
    public Orders(String userMail, int status, String discount, String address, String phoneNumber, Date receivedDate) {
        this.status = status;       
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.discount = discount;
        this.userMail = userMail;
        this.receivedDate = receivedDate;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getDiscount() {
        return discount;
    }
    
    

    

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }
    
    
    
    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }
    
    public int getOrderId() {
        return orderId;
    }

    public float getPrice() {
        return price;
    }

    public int getStatus() {
        return status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public List<ProductOrders> getLp() {
        return lp;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setLp(List<ProductOrders> lp) {
        this.lp = lp;
    }
    
    
    
    
          
}
