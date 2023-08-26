package KhaiPT.Controller;

import KhaiPT.Registration.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateController extends HttpServlet {
    private final String UPDATEERRPAGE = "updateErr.html";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {    
            String url = UPDATEERRPAGE;
            String username = request.getParameter("txtUsername");
            String passsword = request.getParameter("txtPassword");
            String lastname = request.getParameter("txtLastname");
            String searchValue = request.getParameter("txtSearch");
            String isAdmin = request.getParameter("isAdmin");
            boolean role = false;
            if(isAdmin!=null){
                role = true;
            }
            
//            out.println(username);
//            out.println(passsword);
//            out.println(isAdmin);
//            out.println(searchValue);
//            RegistrationDAO dao = new RegistrationDAO();
//            boolean result = dao.updateRecord(username, passsword, lastname, role);
//            out.println(result);
            try{
                RegistrationDAO dao = new RegistrationDAO();
                boolean result = dao.updateRecord(username, passsword, lastname, role);
                if(result){
                    url = "MainController?btAction=Search&txtSearch="+searchValue;
                }
            }catch(SQLException e){
                e.printStackTrace();
            } finally {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
           
        }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
