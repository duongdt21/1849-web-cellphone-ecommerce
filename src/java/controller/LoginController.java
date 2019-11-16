/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.VerifyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account_ngoc;

/**
 *
 * @author cogn1
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8"); // vietnamese
        try {
            
            Cookie [] c = request.getCookies();
            for(Cookie co : c){
                if((co.getName()).compareTo("loginname") == 0){
                    co.setMaxAge(0);
                    response.addCookie(co);
                }
            }  
            request.getSession(true).invalidate();
            
            AccountDAO dao = new AccountDAO();
            VerifyDAO dao2 = new VerifyDAO();
            
            String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
            String regex = "[a-zA-Z0-9_!@#$%^&*]+";
            
            String user = request.getParameter("username");
            String password = request.getParameter("password");
            HttpSession session = request.getSession(true);
            
            // filter
            if (!password.matches(regex) || !user.matches(regexMail)) {
                session.setAttribute("error", "invalid syntax");
                response.sendRedirect("login.jsp");
            }

            // check account
            Account_ngoc acc = dao.getAccountByUsername(user);
            
            if (acc != null && acc.getPwd().equals(dao.HashMD5(password))) {

                //set session
                session.setAttribute("user", user);
                
                // set cookie
                Cookie username = new Cookie("loginname", user);
                Cookie info = new Cookie("logininfo", dao2.encode64(dao.mySuperSecureEncrypt(dao.HashMD5(user), dao.HashMD5(password))));
                
                info.setMaxAge(24 * 60 * 60);
                username.setMaxAge(24 * 60 * 60); // set cookie for 1 day
                response.addCookie(username);
                response.addCookie(info);

                if (acc.getCheck() != 1) {
                    RequestDispatcher rd = request.getRequestDispatcher("confirmMail.jsp");
                    rd.forward(request, response);
                }
                
                if(acc.getRole() == 1)
                    response.sendRedirect("admin/index.jsp");
                else if(acc.getRole() == 2)
                    response.sendRedirect("user/index.jsp");
                else if(acc.getRole() == 0)
                    response.sendRedirect("shipper/orders-list");

            } else {
                session.setAttribute("error", "wrong username or password");
                response.sendRedirect("login.jsp");
            }

        } catch (NullPointerException e) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
