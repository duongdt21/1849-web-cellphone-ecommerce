package controller.product;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import dao.AddProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Products;

/**
 *
 * @author Hoang
 */
public class AddProductController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String add = request.getParameter("add");
                if (add == null) {
                    RequestDispatcher rd = request.getRequestDispatcher("addproduct.jsp");
                    rd.forward(request, response);
                } else {
                    Products p;
                    String name = request.getParameter("name");
                    String des = request.getParameter("des");
                    float price = Float.parseFloat(request.getParameter("price"));
                    //check if price < 0, display error
                    if (price < 0) {
                        request.setAttribute("error", "Number of product must be > 0");
                        RequestDispatcher rd = request.getRequestDispatcher("addproduct.jsp");
                        rd.forward(request, response);
                    }
                    String url = request.getParameter("image");
                    String type = request.getParameter("type");
                    String brand = request.getParameter("brand");
                    if (brand.equals("1")) {
                        brand = request.getParameter("brand2");
                    }
                    int number = Integer.parseInt(request.getParameter("number"));
                    //check if number of product < 0, display error
                    if (number < 1) {
                        request.setAttribute("error", "Number of product must be > 0");
                        RequestDispatcher rd = request.getRequestDispatcher("addproduct.jsp");
                        rd.forward(request, response);
                    }
                    p = new Products(0, name, des, price, url, type, brand, 0);
                    new AddProductDAO().AddProduct(p);
                    new AddProductDAO().AddNumber(number);
                    RequestDispatcher rd = request.getRequestDispatcher("list");
                    rd.forward(request, response);
                }
            } //check number exeption //check number exeption
            catch (NumberFormatException ex) {
                request.setAttribute("error", "Price or number must be number");
                RequestDispatcher rd = request.getRequestDispatcher("addproduct.jsp");
                rd.forward(request, response);
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
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
