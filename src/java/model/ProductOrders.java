/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.logging.Logger;

/**
 *
 * @author DuongDT
 */
public class ProductOrders {
    private int orderId;
    private int productId;
    private int amountProduct;
    private String nameProduct;

    public ProductOrders(int orderId, int productId, int amountProduct, String nameProduct) {
        this.orderId = orderId;
        this.productId = productId;
        this.amountProduct = amountProduct;
        this.nameProduct = nameProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }
    

    

    public int getOrderId() {
        return orderId;
    }

    public int getProductId() {
        return productId;
    }

    public int getAmountProduct() {
        return amountProduct;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setAmountProduct(int amountProduct) {
        this.amountProduct = amountProduct;
    }
    
    
            
}
