/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.VerifyDAO;
import dao.AccountDAO;
import java.util.List;
import javax.servlet.RequestDispatcher;
import model.TokenVerify;

/**
 *
 * @author DuongDT
 */
public class VerifyRegister extends HttpServlet {

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
        VerifyDAO verify = new VerifyDAO();
        AccountDAO acc = new AccountDAO();
        try (PrintWriter out = response.getWriter()) {
            String info = request.getParameter("token");
            out.println("<h2>" + info + "</h2>");
            String token = verify.decode(info.split("-")[0]);
            String mail = verify.decode(info.split("-")[1]);
            out.println("<h2>" + token + "</h2>");
            out.println("<h2>" + mail + "</h2>");

            if (verify.checkToken(mail, token)) {
             
                
                acc.confirmMail(mail);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");

                rd.forward(request, response);
            }
        } catch (Exception e) {
          
            response.getWriter().println(e);
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
