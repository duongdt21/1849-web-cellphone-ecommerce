/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.*;
import model.Product;

/**
 *
 * @author cogn1
 */
public class PagingIndex implements Serializable{
    private int size, page;
    private String type;

    public void setPage(int page) {
        this.page = page;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    

    public PagingIndex() {
        size = 8;
        page = 1;
    }
    
    public List<Product> getProductsAll() throws Exception{
        int from = (page - 1) * size + 1;
        int to = size * page;

        Connection conn = new context.DBContext().getConnection();
        CallableStatement cs = conn.prepareCall("{call GetProducts(?,?)}");// call store proc
        
        cs.setInt(1, from);
        cs.setInt(2, to);
        
        ResultSet rs = cs.executeQuery();
        
        List<Product> p = new ArrayList<>();
        
        while(rs.next()){            
            p.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7)));
        }
        rs.close();
        conn.close();
        return p;
    }
    
    public int getPagesAll() throws Exception{
        String sql = "select count(*) from Products";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        int rows = 0;
        if(rs.next()) rows = rs.getInt(1);
        return (rows < size ? 1 : (int) Math.ceil((rows*1.0) / size));

    }
    
    public List<Product> getProductsType() throws Exception{
        int from = (page - 1) * size + 1;
        int to = size * page;

        Connection conn = new context.DBContext().getConnection();
        CallableStatement cs = conn.prepareCall("{call GetProductsType(?,?,?)}");// call store proc
        
        cs.setInt(1, from);
        cs.setInt(2, to);
        cs.setString(3, type);
        
        ResultSet rs = cs.executeQuery();
        
        List<Product> p = new ArrayList<>();
        
        while(rs.next()){            
            p.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7)));
        }
        rs.close();
        conn.close();
        return p;
    }
    
    public int getPagesType() throws Exception{
        String sql = "select count(*) from Products where product_type = '"+type+"'";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        int rows = 0;
        if(rs.next()) rows = rs.getInt(1);
        return (rows < size ? 1 : (int) Math.ceil((rows*1.0) / size));
    }
    
}
