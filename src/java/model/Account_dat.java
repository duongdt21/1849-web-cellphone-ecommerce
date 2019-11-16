/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author yurn3r0
 */
public class Account_dat {

    private String userMail;
    private String password;
    private int accountRole;
    private String userName;
    private String userAdess;
    private String userPhone;
    private boolean accountVetify;

    public Account_dat() {
    }

    public Account_dat(String userMail, String password, int accountRole, String userName, String userAdess, String userPhone, boolean accountVetify) {
        this.userMail = userMail;
        this.password = password;
        this.accountRole = accountRole;
        this.userName = userName;
        this.userAdess = userAdess;
        this.userPhone = userPhone;
        this.accountVetify = accountVetify;
    }

    public Account_dat(String userName, String userMail, int accountRole, String userAdess, String userPhone) {
        this.userMail = userMail;
        this.userName = userName;
        this.accountRole = accountRole;
        this.userAdess = userAdess;
        this.userPhone = userPhone;
    }

    public Account_dat(String userName, int accountRole, String userAdess, String userPhone) {
        this.userName = userName;
        this.accountRole = accountRole;
        this.userAdess = userAdess;
        this.userPhone = userPhone;
    }

    public Account_dat(String userName) {
        this.userName = userName;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAccountRole() {
        return accountRole;
    }

    public void setAccountRole(int accountRole) {
        this.accountRole = accountRole;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAdess() {
        return userAdess;
    }

    public void setUserAdess(String userAdess) {
        this.userAdess = userAdess;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public boolean isAccountVetify() {
        return accountVetify;
    }

    public void setAccountVetify(boolean accountVetify) {
        this.accountVetify = accountVetify;
    }
}
