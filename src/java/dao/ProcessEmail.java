/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author maimaimai
 */
public class ProcessEmail {

    public String processEmail(String full_name) {
        //create username for mail
        String mail = "@fpt.com.vn";
        full_name = full_name.trim();
        String[] t = full_name.split("\\s+");
        int len = t.length;
        String name_mail = t[len - 1];
        for (int i = 0; i < len - 1; i++) {
            name_mail = name_mail + t[i].charAt(0);
        }
        name_mail = name_mail + mail;
        System.out.println(name_mail);
        return name_mail;
    }
}
