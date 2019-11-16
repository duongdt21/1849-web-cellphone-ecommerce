/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.account;

import dao.AccountDAO;
import dao.ProcessEmail;
import dao.RamdomPasswordGenerator;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account_dat;

/**
 *
 * @author maimaimai
 */
public class CreateAdminController extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        try {

            if (request.getParameter("create") != null) {
                String full_name = request.getParameter("full_name");
                System.out.println(full_name);
                //get role
                int role = Integer.valueOf(request.getParameter("newRole"));
                System.out.println(role);

                // gen mail
                ProcessEmail email = new ProcessEmail();
                String name_mail = email.processEmail(full_name);

                // create password
                RamdomPasswordGenerator a = new RamdomPasswordGenerator();
                String password = a.makePassowrd();
                String hashPasswordMD5 = a.passwordHashMD5(password);
                System.out.println(password);

                String address = request.getParameter("address");
                System.out.println(address);
                String phone = request.getParameter("phone");
                System.out.println(phone);

                if ("".equals(full_name) || "".equals(address) || "".equals(phone)) {
                    session.setAttribute("error", "Name, Address or Phone can not be blank");
                    response.sendRedirect("/1849/admin/create-admin");
                } else {
                    boolean account_vetify = true;
                    System.out.println(account_vetify);
                    AccountDAO dao = new AccountDAO();

                    Account_dat account = new Account_dat();
                    account.setUserMail(name_mail);
                    account.setPassword(hashPasswordMD5);
                    account.setAccountRole(role);
                    account.setUserName(full_name);
                    account.setUserAdess(address);
                    account.setUserPhone(phone);
                    account.setAccountVetify(account_vetify);

                    if (dao.createAddmin(account) == true) {
                        request.setAttribute("full_name", full_name);
                        request.setAttribute("mail", account.getUserMail());
                        request.setAttribute("password", password);
                        RequestDispatcher rd = request.getRequestDispatcher("/admin/create-successfully.jsp");
                        rd.forward(request, response);
//                    response.sendRedirect("/DemoWeb/list-all");
                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin/create-admin.jsp");
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
