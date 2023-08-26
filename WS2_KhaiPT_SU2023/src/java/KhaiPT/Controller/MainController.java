package KhaiPT.Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class MainController extends HttpServlet {
    
    final String LOGINCONTROLLER = "LoginController";
    final String SEARCHCONTROLLER = "SearchController";
    final String DELETECONTROLLER = "DeleteController";
    final String INVALIDPAGE = "Invalid.html";
    final String UPDATECONTROLLER = "UpdateController";
    final String ADDTOCARTCONTROLLER = "AddToCartController";
    private final String NULLCONTROLLER = "NullController";
    final String VIEWCART = "ViewCart1.jsp";
    final String REMOVEITEMCONTROLLER = "RemoveItemController";
    final String CREATENEWACCOUNT = "CreateNewAccountController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = INVALIDPAGE;
            String button = request.getParameter("btAction");
            if(button==null) {
                url = NULLCONTROLLER;
            }
            else if(button.equals("Login")){
                url = LOGINCONTROLLER;
            }
            else if(button.equals("Search")){
                url = SEARCHCONTROLLER;
            }
            else if(button.equals("Delete")){
                url = DELETECONTROLLER;
            }
            else if(button.equals("Update")){
                url = UPDATECONTROLLER;
            }
            else if(button.equals("Add to Cart")){
                url = ADDTOCARTCONTROLLER;
            }
            else if(button.equals("View Cart")){
                url = VIEWCART;
            }
            else if(button.equals("Remove Item")){
                url = REMOVEITEMCONTROLLER;
            }
            else if(button.equals("Create account")){
                url = CREATENEWACCOUNT;
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
