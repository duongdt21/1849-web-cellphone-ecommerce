/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.*;
import model.Product;

/**
 *
 * @author cogn1
 */
public class ProductDAO {

    public Product getProductById(int id) throws Exception {
        Product p = null;
        String sql = "select * from Products where product_id = " + id;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7));
        }
        rs.close();
        conn.close();
        return p;
    }

    public List<Product> searchProductWithType(String type, String keyword) throws Exception {
        List<Product> lp = new ArrayList<>();
        String sql = "";
        if (type.equals("all")) {
            sql = "select * from Products where product_name like '%" + keyword + "%' or product_type like '%" + keyword + "%'";
        } else {
            sql = "select * from Products\n"
                    + "where product_type = '" + type + "' and product_name like '%" + keyword + "%'";
        }
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            int id = rs.getInt(1);
            String name = rs.getNString(2);
            String des = rs.getNString(3);
            float price = rs.getFloat(4);
            String src = rs.getString(5);
            String typeProduct = rs.getString(6);
            String brand = rs.getString(7);
            lp.add(new Product(id, name, des, price, src, typeProduct, brand));
        }

        return lp;
    }

    public List<Product> getProductByBrand(String brandName, String keyword) throws Exception {
        List<Product> lp = new ArrayList<>();
        String sql = "select * from Products\n"
                + "where product_brand = '" + brandName + "'";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            int id = rs.getInt(1);
            String name = rs.getNString(2);
            String des = rs.getNString(3);
            float price = rs.getFloat(4);
            String src = rs.getString(5);
            String typeProduct = rs.getString(6);
            String brand = rs.getString(7);
            lp.add(new Product(id, name, des, price, src, typeProduct, brand));
        }

        return lp;
    }

    public int getAmountById(int id) throws Exception {
        String sql = "select * from Amount_product where product_id = " + id;
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            return rs.getInt(2);
        }
        return 0;
    }

}
