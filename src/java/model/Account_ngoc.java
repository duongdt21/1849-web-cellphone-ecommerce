/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author cogn1
 */
public class Account_ngoc {
    private String usr, pwd;
    private int role;
    private String name, address, phone;
    private int check;

    public Account_ngoc() {
    }

    public Account_ngoc(String usr, String pwd, int role, String name, String address, String phone, int check) {
        this.usr = usr;
        this.pwd = pwd;
        this.role = role;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.check = check;
        
    }    

    public String getUsr() {
        return usr;
    }

    public String getPwd() {
        return pwd;
    }

    public int getRole() {
        return role;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setCheck(int check) {
        this.check = check;
    }

    public int getCheck() {
        return check;
    }

    
    
    
    
    
}
