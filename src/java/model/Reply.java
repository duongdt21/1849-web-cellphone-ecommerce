/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author DuongDT
 */
public class Reply {
    private int replyId;
    private int commentId;
    private String user;
    private String userName;
    private String reply_content;
    private Date reply_date;

    public Reply(int replyId, int commentId, String user, String userName, String reply_content, Date reply_date) {
        this.replyId = replyId;
        this.commentId = commentId;
        this.user = user;
        this.userName = userName;
        this.reply_content = reply_content;
        this.reply_date = reply_date;
    }

    public int getReplyId() {
        return replyId;
    }

    public int getCommentId() {
        return commentId;
    }

    public String getUser() {
        return user;
    }

    public String getUserName() {
        return userName;
    }

    public String getReply_content() {
        return reply_content;
    }

    public Date getReply_date() {
        return reply_date;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public void setReply_date(Date reply_date) {
        this.reply_date = reply_date;
    }
    
    
}
