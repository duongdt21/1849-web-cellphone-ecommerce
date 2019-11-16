/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author maimaimai
 */
public class DiscountCode {

    private String codeName;
    private int discountValue;

    public DiscountCode() {
    }

    public DiscountCode(String codeName, int discountValue) {
        this.codeName = codeName;
        this.discountValue = discountValue;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public int getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(int discountValue) {
        this.discountValue = discountValue;
    }

}
