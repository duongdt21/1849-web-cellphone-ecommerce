package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Products;

public class ListProductDAO {

    //get the list of product
    public List<Products> search(String characters) throws Exception {
        List<Products> result = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select p.product_id, p.product_name, p.product_des, p.product_price, p.product_img_source,\n"
                + "p.product_type, p.product_brand, ap.product_amount from Products p, Amount_product ap\n"
                + "where p.product_id = ap.product_id\n"
                + "and product_name like '%" + characters + "%'";
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("product_id");
            String name = rs.getString("product_name");
            String des = rs.getString("product_des");
            float price = rs.getFloat("product_price");
            String source = rs.getString("product_img_source");
            String type = rs.getString("product_type");
            String brand = rs.getString("product_brand");
            int number = rs.getInt("product_amount");
            result.add(new Products(id, name, des, price, source, type, brand, number));
        }
        rs.close();
        ps.close();
        conn.close();
        return result;
    }

    //get the product
    public Products getProduct(String characters) throws Exception {
        Products result = null;
        Connection conn = new DBContext().getConnection();
        String sql = "SELECT * FROM Products WHERE product_id = " + characters;
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("product_id");
            String name = rs.getString("product_name");
            String des = rs.getString("product_des");
            float price = rs.getFloat("product_price");
            String source = rs.getString("product_img_source");
            String type = rs.getString("product_type");
            String brand = rs.getString("product_brand");
            result = new Products(id, name, des, price, source, type, brand, 0);
        }
        rs.close();
        ps.close();
        conn.close();
        return result;
    }

    //delete in product table
    public void deleteProduct(int id) throws Exception {
        String sql = "DELETE FROM Products WHERE product_id = ?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, id);
        ps.execute();
        ps.close();
        conn.close();
    }

    //delete in amount_product table
    public void deleteProductNumber(int id) throws Exception {
        String sql = "DELETE FROM Amount_product WHERE product_id = ?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, id);
        ps.execute();
        ps.close();
        conn.close();
    }

    //update product
    public void update(Products p, int id) throws Exception {
        String name = p.getName();
        String des = p.getDescription();
        float price = p.getPrice();
        String source = p.getSrc();
        String type = p.getType();
        String brand = p.getBrand();
        String sql = "UPDATE Products SET product_name = ?, product_des= ?,\n"
                + "product_price= ?, product_img_source= ?, product_type= ?, \n"
                + "product_brand= ? WHERE product_id = " + id;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setString(1, name);
        ps.setString(2, des);
        ps.setFloat(3, price);
        ps.setString(4, source);
        ps.setString(5, brand);
        ps.setString(6, type);
        ps.execute();
        ps.close();
        conn.close();
    }

    //get number of product
    public int getNumber(int id) throws Exception {
        int number = 0;
        String sql = "select product_amount from Amount_product where product_id = " + id;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareCall(sql).executeQuery();
        while (rs.next()) {
            number = rs.getInt("product_amount");
        }
        rs.close();
        conn.close();
        return number;
    }

    //update number of product
    public void updateNumber(int id, int amount) throws Exception {
        String sql = "update Amount_product\n"
                + "SET product_amount = ?\n"
                + "where product_id = " + id;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, amount);
        ps.execute();
        ps.close();
        conn.close();
    }

}
