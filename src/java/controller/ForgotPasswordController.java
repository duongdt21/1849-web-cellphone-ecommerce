/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.MailProcess;
import dao.VerifyDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cogn1
 */
public class ForgotPasswordController extends HttpServlet {

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
            String username = request.getParameter("username");
            if (username != null) {
                String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
                RequestDispatcher rd = request.getRequestDispatcher("forgotPwd.jsp");

                AccountDAO dao = new AccountDAO();
                if (dao.getAccountByUsername(username) == null || !username.matches(regexMail)) {
                    request.setAttribute("noti", "Your email doesn't exist, your can try another!");
                    rd.forward(request, response);
                }
                // mail reset password
                VerifyDAO verify = new VerifyDAO();

                String token = verify.createToken();

                verify.addTokenToDB(username, token);

                MailProcess mailProcess = new MailProcess();
                mailProcess.sendMail(username, "http://localhost:8080/1849/resetPwd?token=" + verify.encode64(token) + "-" + verify.encode64(username));
                // end mail reset password

                request.setAttribute("noti", "A reset password mail is sent to " + username + ". Please check it.");
                rd.forward(request, response);
            }
            RequestDispatcher rd = request.getRequestDispatcher("forgotPwd.jsp");
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
