/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;
import model.Account_ngoc;
import model.Account_dat;

/**
 *
 * @author cogn1
 */
public class AccountDAO {

	/* ngocnb */

    private static final byte [] secretKeys = "anh_se_om_em_den_het_mua_hoa_roi".getBytes();
    
    public String HashMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            byte[] hash = md.digest(password.getBytes());

            return DatatypeConverter.printHexBinary(hash).toLowerCase();
        } catch (NoSuchAlgorithmException ex) {
        }
        return null;
    }    

    public List<Account_ngoc> getAllAccount() throws Exception {
        List<Account_ngoc> l = new ArrayList<>();
        String sql = "select * from Account";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            String usr = rs.getString("user_mail");
            String pwd = rs.getString("password");
            int role = rs.getInt("account_role");
            String name = rs.getString("user_name");
            String addr = rs.getString("user_address");
            String phone = rs.getString("user_phone");
            int check = rs.getInt("account_verify");
            l.add(new Account_ngoc(usr, pwd, role, name, addr, phone, check));
        }

        return l;
    }

    public Account_ngoc getAccountByUsername(String user) throws Exception {       
        String sql = "select * from Account where user_mail = '" + user + "'";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        Account_ngoc acc = null;
        while (rs.next()) {
            String usr = rs.getString(1);
            String pwd = rs.getString(2);
            int role = rs.getInt(3);
            String name = rs.getString(4);
            String addr = rs.getString(5);
            String phone = rs.getString(6);
            int check = rs.getInt(7);
            acc = new Account_ngoc(usr, pwd, role, name, addr, phone, check);
        }

        return acc;
    }
    
    public void register(Account_ngoc a) throws Exception{       
        String sql = "insert into Account(user_mail, [password], account_role, [user_name], user_address, user_phone, account_verify)\n" +
                        "values(?, ?, ?, ?, ?, ?, ?)";
        
        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, a.getUsr());
        ps.setString(2, a.getPwd());
        ps.setInt(3, a.getRole());    
        ps.setString(4, a.getName());
        ps.setString(5, a.getAddress());
        ps.setString(6, a.getPhone());
        ps.setInt(7, a.getCheck());       
        
        ps.execute();
        ps.close();
        conn.close();
    }
    
    public void confirmMail(String mail) throws Exception{
        String sql = "update Account set account_verify = 1 where user_mail = '"+mail+"'";
        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }
    
    public void resetPwd(String username, String password) throws Exception{
        String sql = "update Account set [password] = '"+password+"' where user_mail = '"+username+"'";
        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }
    
    public String mySuperSecureEncrypt(String a, String b){
        String r = "";
        
        byte [] aa = a.getBytes();
        byte [] bb = b.getBytes();
        
        for(int i = 0; i < aa.length; i++)
            r += String.valueOf((char)(aa[i] ^ secretKeys[i])) + String.valueOf((char)(bb[i] ^ secretKeys[i]));
           
        return r ;
    }
    
    public String mySuperSecureDecrypt(String a){
        String r1 = "", r2 = "", ret = "";
               
        for(int i = 0; i < a.length(); i+=2){
            r1 += String.valueOf(a.charAt(i));
            r2 += String.valueOf(a.charAt(i+1));
        }
        
        byte [] aa = r1.getBytes();
        byte [] bb = r2.getBytes();
        
        for(int i = 0; i < aa.length; i++)
            ret += String.valueOf((char)(aa[i] ^ secretKeys[i]));
        
        for(int i = 0; i < bb.length; i++)
            ret += String.valueOf((char)(bb[i] ^ secretKeys[i]));                     
               
        return ret ;
    }


    /* end ngocnb */


    /*	datdq     */


    public List<Account_dat> getListStaff() throws Exception {
        List<Account_dat> s = new ArrayList<>();
        String sql = "SELECT a.user_name, a.user_mail, a.account_role, a.user_address, a.user_phone\n"
                + "FROM Account as a\n"
                + "WHERE account_role = 1 OR account_role = 0";
        System.out.println(sql);
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String name = rs.getString("user_name");
            String mail = rs.getString("user_mail");
            int roles = rs.getInt("account_role");
            String adress = rs.getString("user_address");
            String phone = rs.getString("user_phone");
            s.add(new Account_dat(name, mail, roles, adress, phone));
        }
        rs.close();
        conn.close();
        return s;
    }

    public List<Account_dat> getListShipper() throws Exception {
        List<Account_dat> s = new ArrayList<>();
        String sql = "SELECT a.user_name, a.user_mail, a.account_role, a.user_address, a.user_phone\n"
                + "FROM Account as a\n"
                + "WHERE account_role = 0";
        System.out.println(sql);
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String name = rs.getString("user_name");
            String mail = rs.getString("user_mail");
            int roles = rs.getInt("account_role");
            String adress = rs.getString("user_address");
            String phone = rs.getString("user_phone");
            s.add(new Account_dat(name, mail, roles, adress, phone));
        }
        rs.close();
        conn.close();
        return s;
    }

    public List<Account_dat> getListAdmin() throws Exception {
        List<Account_dat> s = new ArrayList<>();
        String sql = "SELECT a.user_name, a.user_mail, a.account_role, a.user_address, a.user_phone\n"
                + "FROM Account as a\n"
                + "WHERE account_role = 1";
        System.out.println(sql);
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String name = rs.getString("user_name");
            String mail = rs.getString("user_mail");
            int roles = rs.getInt("account_role");
            String adress = rs.getString("user_address");
            String phone = rs.getString("user_phone");
            s.add(new Account_dat(name, mail, roles, adress, phone));
        }
        rs.close();
        conn.close();
        return s;
    }

    public List<Account_dat> getInformation(String mail) throws Exception {
        List<Account_dat> s = new ArrayList<>();
        String sql = "SELECT a.user_name, a.user_mail, a.account_role, a.user_address, a.user_phone\n"
                + "FROM Account as a\n"
                + "WHERE user_mail = '" + mail + "'";
        System.out.println(sql);
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String name = rs.getString("user_name");
            int roles = rs.getInt("account_role");
            String adress = rs.getString("user_address");
            String phone = rs.getString("user_phone");
            s.add(new Account_dat(name, mail, roles, adress, phone));
        }
        rs.close();
        conn.close();
        return s;
    }

    public boolean deleteAccount(Account_dat account) throws Exception {
        try {
            String sql = "DELETE FROM Account "
                    + "WHERE user_mail = '" + account.getUserMail() + "'";
            System.out.println(sql);
            Connection conn = new context.DBContext().getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.executeUpdate();
            return true;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean getUpdate(Account_dat acc) {
        try {
            String sql = "UPDATE Account\n"
                    + "SET user_name = ?\n"
                    + ", account_role= ?\n"
                    + ", user_address= ?\n"
                    + ", user_phone= ?\n"
                    + "WHERE user_mail = '" + acc.getUserMail() + "'\n";

            Connection conn = new context.DBContext().getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, acc.getUserName());
            statement.setInt(2, acc.getAccountRole());
            statement.setString(3, acc.getUserAdess());
            statement.setString(4, acc.getUserPhone());
            statement.executeUpdate();
            System.out.println(sql);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean createAddmin(Account_dat account) throws Exception {
        try {
            String sql = "INSERT INTO Account(user_mail, password, account_role,[user_name], user_address, user_phone, account_verify)\n"
                    + "VALUES(?,?,?,?,?,?,?)";
            System.out.println(sql);
            Connection conn = new context.DBContext().getConnection();
            PreparedStatement statement = conn.prepareCall(sql);
            statement.setString(1, account.getUserMail());
            statement.setString(2, account.getPassword());
            statement.setInt(3, account.getAccountRole());
            statement.setString(4, account.getUserName());
            statement.setString(5, account.getUserAdess());
            statement.setString(6, account.getUserPhone());
            statement.setBoolean(7, account.isAccountVetify());
            statement.executeUpdate();
            return true;
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    /*	end datdq 	*/
    
    
    
   
}
