/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.account;

import dao.AccountDAO;
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
 * @author yurn3r0
 */
public class EditStaffController extends HttpServlet {

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

            HttpSession session = request.getSession(true);
            String currentMail = request.getParameter("usermail");
            session.setAttribute("mail", currentMail);

            String newName = request.getParameter("newName");
            String name_mail = request.getParameter("name_mail");
            String role = request.getParameter("newRole");
            String newAddress = request.getParameter("newAddress");
            String newPhone = request.getParameter("newPhone");
            String submit = request.getParameter("submit");

            AccountDAO dao = new AccountDAO();
            Account_dat acc = new Account_dat();
            if (submit != null) {
                System.out.println("Da vao day");
                System.out.println("name:" + newName);
                System.out.println("mail:" + name_mail);
                System.out.println(role);
                System.out.println("Address:" + newAddress);
                System.out.println("Phone:" + newPhone);
                if ("".equals(newName) || "".equals(name_mail) || "".equals(newAddress) || "".equals(newPhone)) {
                    session.setAttribute("error", "Name, Address or Phone can not be blank");
                    response.sendRedirect("/1849/admin/edit?usermail=" + name_mail);
                } else {
                    acc.setUserMail(name_mail);
                    acc.setUserName(newName);
                    acc.setAccountRole(Integer.valueOf(role));
                    acc.setUserAdess(newAddress);
                    acc.setUserPhone(newPhone);
                    if (dao.getUpdate(acc) == true) {
                        response.sendRedirect("/1849/admin/display-all-staff");
                    }
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher("/admin/edit-staff.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            response.getWriter().println(e);
        }
//        RequestDispatcher rd = request.getRequestDispatcher("EditStaffController.jsp");
//        rd.forward(request, response);
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
