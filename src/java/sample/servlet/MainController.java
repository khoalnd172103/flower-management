/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String url = "index.jsp";
            switch (action) {
                // Manage order
                case "ManageOrders":
                    url = "ManageOrderServlet";
                    break;
                case "ViewUserOrder":
                    url = "ViewUserOrderServlet";
                    break;
                case "ViewUserOrderDetail":
                    url = "ViewUserOrderDetailServlet";
                    break;
                case "ConfirmOrder":
                    url = "ConfirmOrderServlet";
                    break;
                case "Sort":
                    url = "SortOrderServlet";
                    break;
                // Account
                case "Create":
                    url = "RegisterServlet";
                    break;
                case "LogIn":
                    url = "LoginServlet";
                    break;
                case "MustLogIn":
                    url = "login.jsp";
                    break;
                case "Logout":
                    url = "LogoutServlet";
                    break;
                case "Save":
                    url = "UpdateAccProfileServlet";
                    break;
                case "Submit":
                    url = "SearchOrderByDateServlet";
                    break;
                // Cart
                case "addtocart":
                    url = "AddToCartServlet";
                    break;
                case "viewcart":
                    url = "ViewCart.jsp";
                    break;
                case "Update":
                    url = "UpdateCartServlet";
                    break;
                case "Delete":
                    url = "DeleteCartServlet";
                    break;
                case "SaveOrder":
                    url = "SaveShoppingCartServlet";
                    break;
                case "CancelOrder":
                    url = "CancelOrderServlet";
                    break;
                case "OrderAgain":
                    url = "OrderAgainServlet";
                    break;
                //Manage account
                case "ManageAccounts":
                    url = "ManageAccountsServlet";
                    break;
                case "UpdateStatusAccount":
                    url = "UpdateStatusAccountServlet";
                    break;
                case "SearchAccount":
                    url = "SearchAccountServlet";
                    break;
                // Manage plant
                case "Search":
                    url = "SearchPlantServlet";
                    break;
                case "SearchByCate":
                    url = "SearchByCateServlet";
                    break;
                case "Save plant":
                    url = "ManagePlantsServlet";
                    break;
                case "Add":
                    url = "CreatePlantServlet";
                    break;
                // Manage category
                case "Add category":
                    url = "CreateCategoryServlet";
                    break;
                case "Save Category":
                    url = "ManageCategorysServlet";
                    break;
            }
            //Send data from client to servlet
            request.getRequestDispatcher(url).forward(request, response);
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
