/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.discount;

import dao.DiscountDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DiscountCode;

/**
 *
 * @author maimaimai
 */
public class CreateDiscountCodeController extends HttpServlet {

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

            if (request.getParameter("create") != null) {
                String code_name = request.getParameter("name_code");
                int discount_value = Integer.valueOf(request.getParameter("discount_value"));
                int length = code_name.length();
                discount_value = Integer.valueOf(request.getParameter("discount_value"));
                System.out.println(code_name);
                System.out.println(discount_value);
                if ((length < 0 || length > 8) || (discount_value <= 0 || discount_value > 100)) {
                    session.setAttribute("error", "Name code must be less than 8 charaters or discount value must be less than 100");
                    response.sendRedirect("create-discount-code");
                }

                if ((length > 0 && length <= 8) && (discount_value > 0 && discount_value <= 100)) {
                    DiscountDAO dao = new DiscountDAO();
                    DiscountCode code = new DiscountCode();
                    if (dao.getNameDiscount(code_name) == true) {
                        session.setAttribute("error", "The discount already exitsts");
                        response.sendRedirect("create-discount-code");
                    }
                    code.setCodeName(code_name);
                    code.setDiscountValue(discount_value);
                    System.out.println(code.getCodeName());
                    System.out.println(code.getDiscountValue());
                    if (dao.createDiscountCode(code) == true) {
                        System.out.println("Da vao day");
                        response.sendRedirect("list-discount-code");
                    }
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher("/admin/create-discount-code.jsp");
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
