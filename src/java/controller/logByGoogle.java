package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao;
import model.users;

@WebServlet(name = "logByGoogle", urlPatterns = {"/logByGoogle"})
public class logByGoogle extends HttpServlet {

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

            String userName = request.getParameter("g_uName");
            String fName = request.getParameter("g_fName");
            String lName = request.getParameter("g_lName");
            String email = request.getParameter("g_email");
            String password = request.getParameter("g_password");
            String img = request.getParameter("g_img");

            users user = dao.userLoginbyGoogle(userName, email, password, fName, lName, img);
            if (user.getUserID() > 0) {
                
                HttpSession session = request.getSession();
                session.setAttribute("user_ID", user.getUserID());
                session.setAttribute("u_FirstName", user.getuFirstName());
                session.setAttribute("user_Name", user.getUserName());
                session.setAttribute("user_Status", user.getuStatus());
                session.setAttribute("user_ProfilePic", user.getProfilePic());
                session.setAttribute("google_logedUser", "true");
                if (user.getuStatus() == 2) {
                    response.sendRedirect("Admin/");
                } else {
                    response.sendRedirect("Profile/");
                }
            } else {
                response.sendRedirect("login.jsp?login=fail");
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
