/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DuongDT
 */
public class TokenVerify {
    private String mail;
    private String token;
    private String create_time;

    public TokenVerify(String mail, String token, String create_time) {
        this.mail = mail;
        this.token = token;
        this.create_time = create_time;
    }

    public String getMail() {
        return mail;
    }

    public String getToken() {
        return token;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
    
    
}
