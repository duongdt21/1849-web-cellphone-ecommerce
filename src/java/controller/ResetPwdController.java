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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cogn1
 */
public class ResetPwdController extends HttpServlet {

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
        try {
            // catch request from mail
            VerifyDAO verify = new VerifyDAO();
            String info = request.getParameter("token");

            if (info != null) {
                String token = verify.decode(info.split("-")[0]);
                String mail = verify.decode(info.split("-")[1]);
                if (verify.checkToken(mail, token)) {
                    request.setAttribute("username", mail);
                    RequestDispatcher rd = request.getRequestDispatcher("resetPwd.jsp");
                    rd.forward(request, response);
                }
            }
            
            // catch request after user enter new password
            request.getSession(true).invalidate();
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            String passwordcf = request.getParameter("passwordcf");
            String regexAcc = "[a-zA-Z0-9_]+";          
            HttpSession session = request.getSession(true);
            
            
            if(!password.equals(passwordcf)){
                session.setAttribute("noti", "Password doesn't match.");
                response.sendRedirect(request.getHeader("referer"));               
            }
            
            if (!password.matches(regexAcc)) {
                session.setAttribute("noti", "Enter another password");
                response.sendRedirect(request.getHeader("referer"));
            }
            

            AccountDAO dao = new AccountDAO();

            if (user != null && password != null) {
                dao.resetPwd(user, dao.HashMD5(password));
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);

            }

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
