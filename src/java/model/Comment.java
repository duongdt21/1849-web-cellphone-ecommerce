/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author DuongDT
 */
public class Comment {
    private int commentId;
    private int productId;
    private String user;
    private String userName;
    private String comment_content;
    private Date comment_date;
    private List<Reply> lr;

    public Comment(int commentId, int productId, String user, String userName, String comment_content, Date comment_date, List<Reply> lr) {
        this.commentId = commentId;
        this.productId = productId;
        this.user = user;
        this.userName = userName;
        this.comment_content = comment_content;
        this.comment_date = comment_date;
        this.lr = lr;
    }

    public int getCommentId() {
        return commentId;
    }

    public int getProductId() {
        return productId;
    }

    public String getUser() {
        return user;
    }

    public String getUserName() {
        return userName;
    }

    public String getComment_content() {
        return comment_content;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public List<Reply> getLr() {
        return lr;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public void setLr(List<Reply> lr) {
        this.lr = lr;
    }
    
    
           
}
