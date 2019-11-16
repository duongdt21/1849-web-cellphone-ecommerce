/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import API.VerifyRecaptcha;
import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account_ngoc;
import dao.MailProcess;
import dao.VerifyDAO;

/**
 *
 * @author cogn1
 */
public class RegisterController extends HttpServlet {

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
            request.getSession(true).invalidate();
            // regex
            String regexAcc = "[a-zA-Z0-9_]+";
            String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";

            String user = request.getParameter("username");
            String pwd = request.getParameter("password");
            String pwdcf = request.getParameter("password_cf");
            String name = request.getParameter("name");
            String addr = request.getParameter("address");
            String phone = request.getParameter("phone");
            String accept = request.getParameter("accept");

            //HttpSession session = request.getSession(true);
            RequestDispatcher rd1 = request.getRequestDispatcher("register.jsp");

            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean verifyCapt = VerifyRecaptcha.verify(gRecaptchaResponse);

            if (!pwd.matches(regexAcc) || !pwd.equals(pwdcf) || !verifyCapt || !user.matches(regexMail)) {
                request.setAttribute("error", "invalid input type");
                rd1.forward(request, response);
            }

            AccountDAO dao = new AccountDAO();
            if (dao.getAccountByUsername(user) != null) {
                request.setAttribute("error", "user already exist");
                rd1.forward(request, response);
            }

            dao.register(new Account_ngoc(user, dao.HashMD5(pwd), 2, name, addr, phone, 0));

            // verify mail
            VerifyDAO verify = new VerifyDAO();

            String token = verify.createToken();

            verify.addTokenToDB(user, token);

            MailProcess mailProcess = new MailProcess();
            mailProcess.sendMail(user, "http://localhost:8080/1849/confirm-register?token=" + verify.encode64(token) + "-" + verify.encode64(user));

            RequestDispatcher rd = request.getRequestDispatcher("confirmMail.jsp");
            rd.forward(request, response);

        } catch (NullPointerException e) {
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
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
