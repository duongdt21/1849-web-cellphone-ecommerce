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
import java.util.Date;
import java.util.List;
import model.Comment;
import model.ProductOrders;
import model.Reply;

/**
 *
 * @author DuongDT
 */
public class CommentDAO {
    public List<Reply> getReplyByCommentId(int commentId) throws Exception {
        List<Reply> l = new ArrayList<>();
        String sql = "select r.reply_id,r.comment_id,r.user_mail,a.[user_name],r.reply_content,r.reply_time from Reply r, Account a\n" +
"where r.user_mail = a.user_mail and r.comment_id = "+commentId;
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            int replyId = rs.getInt(1);
            
            String user_mail = rs.getString(3);
            String user_name = rs.getNString(4);
            String content = rs.getNString(5);
            Date date = rs.getDate(6);
            l.add(new Reply(replyId, commentId, user_mail, user_name, content, date));
        }

        return l;
    }
    
    public List<Comment> getCommentByProductId(int productId) throws Exception {
        List<Comment> l = new ArrayList<>();
        String sql = "select c.comment_id,c.product_id,c.user_mail,a.[user_name],c.comment_content,c.comment_time from Comment c, Account a\n" +
"where c.user_mail = a.user_mail and c.product_id= "+productId;
        Connection conn = new context.DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();

        while (rs.next()) {
            int commentId = rs.getInt(1);
            String user_mail = rs.getString(3);
            String user_name = rs.getNString(4);
            String content_comment = rs.getNString(5);
            Date date = rs.getDate(6);
            List<Reply> lr = getReplyByCommentId(commentId);
            l.add(new Comment(commentId, productId, user_mail, user_name, content_comment, date, lr));
        }

        return l;
    }
    
    public void commentByIdProduct(int productId,String content,String userName) throws Exception {
        String sql = "insert into Comment(product_id,user_mail,comment_content)\n" +
"values("+productId+",'"+userName+"',N'"+content+"')";
        
        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
            
        
        ps.execute();
        ps.close();
        conn.close();
    }
    
    public void replyByIdComment(int commentId,String content,String userName) throws Exception {
        String sql = "insert into Reply(comment_id,user_mail,reply_content)\n" +
"values("+commentId+",'"+userName+"',N'"+content+"')";
        
        Connection conn = new context.DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
            
        
        ps.execute();
        ps.close();
        conn.close();
    }
}
