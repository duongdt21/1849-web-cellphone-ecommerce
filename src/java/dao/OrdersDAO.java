/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Cart;

import model.Orders;
import model.Product;
import model.ProductOrders;

/**
 *
 * @author DuongDT
 */
public class OrdersDAO {

    public List<ProductOrders> getProductOrders(int idOrders) throws Exception {
        List<ProductOrders> l = new ArrayList<>();
        String sql = "select od.order_id,od.product_id,p.product_name, od.amount_product from Orders_detail od, Products p\n"
                + "where od.product_id= p.product_id and od.order_id = " + idOrders;
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            int orderId = rs.getInt(1);
            int productId = rs.getInt(2);
            String productName = rs.getNString(3);
            int amountProduct = rs.getInt(4);

            l.add(new ProductOrders(orderId, productId, amountProduct, productName));
        }

        return l;
    }

    public List<Orders> getOrder() throws Exception {
        List<Orders> l = new ArrayList<>();
        String sql = "select * from Orders";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            String userName = rs.getString(1);
            int orderId = rs.getInt(2);
            float price = rs.getFloat(3);

            int status = rs.getInt(4);
            Date orderDate = rs.getDate(5);
            String address = rs.getNString(7);
            String phoneNumber = rs.getString(8);
            List<ProductOrders> lp = getProductOrders(orderId);
            Date receiDate = rs.getDate(9);

            l.add(new Orders(orderId, price, status, orderDate, address, phoneNumber, lp, userName, receiDate));
        }

        return l;
    }

    public List<Orders> getInStock() throws Exception {
        List<Orders> l = new ArrayList<>();
        String sql = "select * from Orders\n"
                + "where order_status = 2\n"
                + "order by order_date asc";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            String userName = rs.getString(1);
            int orderId = rs.getInt(2);
            float price = rs.getFloat(3);

            int status = rs.getInt(4);
            Date orderDate = rs.getDate(5);
            String address = rs.getNString(7);
            String phoneNumber = rs.getString(8);
            List<ProductOrders> lp = getProductOrders(orderId);
            Date receiDate = rs.getDate(9);

            l.add(new Orders(orderId, price, status, orderDate, address, phoneNumber, lp, userName, receiDate));
        }

        return l;
    }

    public Orders getOrderById(int orderId) throws Exception {
        Orders o = new Orders();
        String sql = "select * from Orders\n"
                + "order by order_date asc";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            o.setUserMail(rs.getString(1));
            o.setAddress(rs.getNString(7));
            o.setOrderDate(rs.getDate(5));
            o.setReceivedDate(rs.getDate(9));
            o.setPhoneNumber(rs.getString(8));
            o.setPrice(rs.getFloat(3));
            o.setStatus(rs.getInt(4));
            o.setLp(getProductOrders(orderId));
            o.setOrderId(orderId);

        }
        return o;
    }

    public void updateStatus(int orderid, int status) throws Exception {
        String sql = "update Orders\n"
                + "set order_status = " + status + " where order_id = " + orderid;

        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.execute();
        ps.close();
        conn.close();
    }

    public void updateSuccess(int orderid, Date date) throws Exception {
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String strDate = formatter.format(date);
        String sql = "update Orders\n"
                + "set order_status = 1, received_date = '" + strDate + "'\n"
                + "where order_id = " + orderid;

        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.execute();
        ps.close();
        conn.close();
    }

    public int getLastOrderId() throws Exception {
        String sql = "SELECT SCOPE_IDENTITY()";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }

    public void insertOrder(Orders o, Cart c) throws Exception {
        String sql = "insert into Orders(user_mail, total_price, order_status, order_discount_code, order_address, user_phone, received_date)\n"
                + "values(?,?,?,?,?,?,?)";
        double amount = c.getAmount();
        if (o.getDiscount() != null) {
            DiscountDAO dao2 = new DiscountDAO();
            if (dao2.getDiscountValue(o.getDiscount()) != -1) {
                amount = c.getAmount() - (c.getAmount() * dao2.getDiscountValue(o.getDiscount()) / 100);
            }
        }

        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        ps.setString(1, o.getUserMail());
        ps.setDouble(2, amount);
        ps.setInt(3, o.getStatus());
        ps.setString(4, o.getDiscount());
        ps.setString(5, o.getAddress());
        ps.setString(6, o.getPhoneNumber());
        ps.setString(7, null);
        ps.execute();

        ResultSet rs = ps.getGeneratedKeys();
        int id = 1;
        if (rs.next()) {
            id = rs.getInt(1);
        }

        for (Product p : c.getItems()) {
            String sql2 = "insert into Orders_detail(order_id, product_id, amount_product)\n"
                    + "values(?,?,?)";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.setInt(1, id);
            ps2.setInt(2, p.getId());
            ps2.setInt(3, p.getNumber());
            ps2.execute();        
            int amountt = new ProductDAO().getAmountById(p.getId());
            
            String sql3 = "update Amount_product set product_amount = "+(amountt-1)+" where product_id = " + p.getId();
            PreparedStatement ps3 = conn.prepareStatement(sql3);
            ps3.execute();
            ps3.close();
            ps2.close();
        }

        ps.close();
        conn.close();
    }


    public void cancelProduct(int productId, int amount) throws Exception {
        String sql = "update Amount_product\n"
                + "set product_amount = product_amount +" + amount + "\n"
                + "where product_id = " + productId;

        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.execute();
        ps.close();
        conn.close();
    }

    public void cancelProductInOrder(Orders o) throws Exception {
        List<ProductOrders> lp = o.getLp();
        for (ProductOrders po : lp) {
            cancelProduct(po.getProductId(), po.getAmountProduct());
        }
    }

    public List<Orders> getOrderByUser(String user) throws Exception {
        List<Orders> l = new ArrayList<>();
        String sql = "select * from Orders \n"
                + "where user_mail = '" + user + "'";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            String userName = rs.getString(1);
            int orderId = rs.getInt(2);
            float price = rs.getFloat(3);

            int status = rs.getInt(4);
            Date orderDate = rs.getDate(5);
            String address = rs.getNString(7);
            String phoneNumber = rs.getString(8);
            List<ProductOrders> lp = getProductOrders(orderId);
            Date receiDate = rs.getDate(9);

            l.add(new Orders(orderId, price, status, orderDate, address, phoneNumber, lp, userName, receiDate));
        }

        return l;
    }
}
