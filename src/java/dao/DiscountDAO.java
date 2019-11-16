/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DiscountCode;

/**
 *
 * @author maimaimai
 */
public class DiscountDAO {

    public List<DiscountCode> getListDiscount() throws Exception {
        List<DiscountCode> s = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM Discount_code as a";
        System.out.println(sql);
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String code_name = rs.getString("code_name");
            int discount_value = rs.getInt("discount_value");
            s.add(new DiscountCode(code_name, discount_value));
        }
        rs.close();
        conn.close();
        return s;
    }

    public boolean getNameDiscount(String name_code) throws Exception {

        String sql = "SELECT *\n"
                + "FROM Discount_code as a";
        System.out.println(sql);
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            if (name_code.equalsIgnoreCase(rs.getString("code_name"))) {
                rs.close();
                conn.close();
                return true;
            }
        }
        rs.close();
        conn.close();
        return false;
    }

    public boolean createDiscountCode(DiscountCode code) throws Exception {
        try {
            String sql = "INSERT INTO Discount_code(code_name, discount_value)\n"
                    + "VALUES(?,?)";
            System.out.println(sql);
            Connection conn = new context.DBContext().getConnection();
            PreparedStatement statement = conn.prepareCall(sql);
            statement.setString(1, code.getCodeName());
            statement.setInt(2, code.getDiscountValue());
            statement.executeUpdate();
            return true;
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean deleteDiscount(DiscountCode code) throws Exception {
        try {
            String sql = "DELETE FROM Discount_code "
                    + "WHERE code_name = '" + code.getCodeName() + "'";
            System.out.println(sql);
            Connection conn = new context.DBContext().getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.executeUpdate();
            return true;
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int getDiscountValue(String name_code) throws Exception {

        String sql = "select * from Discount_code where code_name = '"+name_code+"'";
        System.out.println(sql);
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            return rs.getInt(2);
        }
        rs.close();
        conn.close();
        return -1;
    }
}
