package KhaiPT.Controller;

import KhaiPT.Registration.RegistrationDAO;
import MyUtils.UserError;
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

public class CreateNewAccountController extends HttpServlet {

    private final String LOGINPAGE = "Login.html";
    private final String CREATENEWACCOUNT = "createNewAccount.html";
    private final String NOTIFERROR = "NotiError.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String url = CREATENEWACCOUNT;

            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String lastname = request.getParameter("txtLastname");
            
            boolean userchecked = true;
            boolean passchecked = true;
            boolean confirmchecked = true;
            boolean namechecked = true;

            boolean check = true;

            if (username.trim().length() < 6 || username.trim().length() > 20) {
                request.setAttribute("USER_ERROR", "Username must have 6 - 20 characters !!!");
                check = false;
                userchecked = false;
            }

            if (password.trim().length() < 6 || username.trim().length() > 30) {
                request.setAttribute("PASS_ERROR", "Password must have 6 - 30 characters !!!");
                check = false;
                passchecked = false;
            }

            if (!confirm.equals(password)) {
                request.setAttribute("CONF_ERROR", "Confirm password is not correct !!!");
                check = false;
                confirmchecked = false;
            }

            if (lastname.trim().length() < 6 || lastname.trim().length() > 50) {
                request.setAttribute("NAME_ERROR", "Lastname must have 6 - 30 characters !!!");
                check = false;
                namechecked = false;
            }
            
            RegistrationDAO dao = new RegistrationDAO();
                boolean checkDup = dao.checkDuplicate(username);
                if (checkDup) {
                    request.setAttribute("USER_DUPLI", "Username was existed !!!");
                    check = false;
                } 

            if (check) {
                    boolean result = dao.insertRecord(username, password, lastname, false);
                    if (result) {
                        url = LOGINPAGE;
                }
            } else {
                url = "NotiError2.jsp?usercheck=" +userchecked + "&passcheck="+passchecked+"&confirmcheck="+confirmchecked+"&namecheck="+namechecked+"&checkdup="+checkDup;
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
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(CreateNewAccountController.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (NamingException ex) {
            Logger.getLogger(CreateNewAccountController.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (Exception ex) {
            Logger.getLogger(CreateNewAccountController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(CreateNewAccountController.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (NamingException ex) {
            Logger.getLogger(CreateNewAccountController.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (Exception ex) {
            Logger.getLogger(CreateNewAccountController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
