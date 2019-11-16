package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Products;

public class AddProductDAO {

    //add product
    public void AddProduct(Products p) throws Exception {
        String sql = "SET IDENTITY_INSERT Products ON\n"
                + "insert into Products(product_id, product_name, product_des, product_price, product_img_source, product_type, product_brand)\n"
                + "values (?,?,?,?,?,?,?)\n"
                + "SET IDENTITY_INSERT Products OFF";
        int id = new AddProductDAO().getTopId();
        String name = p.getName();
        String des = p.getDescription();
        float price = p.getPrice();
        String source = p.getSrc();
        String type = p.getType();
        String brand = p.getBrand();
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setString(3, des);
        ps.setFloat(4, price);
        ps.setString(5, source);
        ps.setString(6, brand);
        ps.setString(7, type);
        ps.execute();
        ps.close();
        conn.close();
    }

    public void AddNumber(int number) throws Exception {
        String sql = "insert into Amount_product(product_id,product_amount)\n"
                + "values (?,?)";
        int id = new AddProductDAO().getTopId();
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setInt(1, id - 1);
        ps.setInt(2, number);
        ps.execute();
        ps.close();
        conn.close();
    }

    //make sure that id is the biggest one + 1 -> always ave empty id for new product
    public int getTopId() throws Exception {
        int top = 0;
        String sql = "select MAX(product_id) AS 'top' from Products ";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareCall(sql).executeQuery();
        while (rs.next()) {
            top = rs.getInt("top");
        }
        top += 1;
        rs.close();
        conn.close();
        return top;
    }

}
