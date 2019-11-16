/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.util.*;
/**
 *
 * @author cogn1
 */
public class Cart {
    private List<Product> items;
    
    public Cart() {
        items = new ArrayList<>();
    }
    
    // add to cart
    public void add(Product ci){
        for (Product x : items)
            if(ci.getId() == x.getId()){
                x.setNumber(x.getNumber()+1);
                return;
            }
        items.add(ci);
    }
    
    // remove from cart
    public void remove(int id){
        for (Product x : items)
            if(x.getId() == id){
                items.remove(x);               
                return;
            }
    }
    
    // return total amount of cart
    public double getAmount(){
        double s = 0;
        for (Product x : items)
            s += x.getPrice() * x.getNumber();        
        return Math.round(s * 100.0) / 100.0;
    }
      
    
    // return list of item
    public List<Product> getItems(){
        return items;
    }
    
}
