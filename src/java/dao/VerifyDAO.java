/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import model.TokenVerify;

/**
 *
 * @author DuongDT
 */
public class VerifyDAO {

    final String alphabet = "0987654321qwertyuiopasdfghjklzxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM";
    final int length = alphabet.length();

    public String createToken() {
        String token = "";
        Random rd = new Random();
        for (int i = 0; i <= 10; i++) {
            token = token + alphabet.charAt(rd.nextInt(length));
        }
        return token;
    }

    public String encode64(String input) {
        String BasicBase64format
                = Base64.getEncoder()
                        .encodeToString(input.getBytes());
        return BasicBase64format;
    }

    public String decode(String input) {
        byte[] actualByte = Base64.getDecoder()
                .decode(input);

        String actualString = new String(actualByte);
        return actualString;
    }

    public void addTokenToDB(String mail, String token) throws Exception {
        String sql = "insert into token_verify(user_mail,token)"
                + "values(?,?)";

        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, mail);
        ps.setString(2, token);

        ps.execute();
        ps.close();
        conn.close();

    }

    public List<TokenVerify> getAllToken() throws Exception {
        List<TokenVerify> list = new ArrayList<>();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        String dateFormat = formatter.format(date);
        String sql = "select * from token_verify";
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            String usr = rs.getString("user_mail");
            String token = rs.getString("token");
            String create_date = formatter.format(rs.getDate("create_time"));
            list.add(new TokenVerify(usr, token, create_date));
        }

        return list;
    }

    public Boolean checkToken(String email, String token) throws Exception {
        List<TokenVerify> list = getAllToken();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        boolean flag = false;
        Date today = new Date();
        for (int i = 0; i < list.size(); i++) {
            TokenVerify t = list.get(i);

            Date date = formatter.parse(t.getCreate_time());
            long getDiff = today.getTime() - date.getTime();

            // using TimeUnit class from java.util.concurrent package
            long getDaysDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
            if (t.getMail().equals(email) && t.getToken().equals(token) && (getDaysDiff <= 1)) {
                flag = true;
                break;
            }

        }
        return flag;
    }
}
