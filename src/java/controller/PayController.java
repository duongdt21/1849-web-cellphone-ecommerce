/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.DiscountDAO;
import dao.OrdersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.DiscountCode;
import model.Orders;

/**
 *
 * @author cogn1
 */
public class PayController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        try {
            HttpSession session = request.getSession(true);

            if (session.getAttribute("cart") == null) {
            }
            OrdersDAO dao = new OrdersDAO();

            Cart c = (Cart) session.getAttribute("cart");
            String username = (String) session.getAttribute("user");
            String discount = request.getParameter("discount");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            boolean isTrue = false;
            DiscountDAO dao2 = new DiscountDAO();
            for (DiscountCode dd : dao2.getListDiscount()) {
                if (dd.getCodeName().equalsIgnoreCase(discount)) {
                    isTrue = true;
                    break;
                }
            }
            if (!isTrue) {
                discount = "HARUHARU";
            }
            Orders d = new Orders(username, 2, discount, address, phone, null);
            dao.insertOrder(d, c);

            response.sendRedirect("index.jsp");

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
