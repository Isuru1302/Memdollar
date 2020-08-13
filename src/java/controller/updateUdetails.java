package controller;

import model.users;
import model.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "updateUdetails", urlPatterns = {"/updateUdetails"})
public class updateUdetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String gender="";
            HttpSession se = request.getSession();
            int ustatus = (Integer) se.getAttribute("user_Status");

            int uID = Integer.parseInt(request.getParameter("u_ID"));
            String fName = request.getParameter("f_name");
            String lName = request.getParameter("l_name");
            String uEmail = request.getParameter("u_email");
            String uBirthday = request.getParameter("u_birthday");
            int genderIndex = Integer.parseInt(request.getParameter("u_gender"));
            
            if(genderIndex==1){
                gender="Male";
            }
            
            else if(genderIndex==2){
                gender="Female";
            }
            
            int cNum = Integer.parseInt(request.getParameter("u_cnumber"));
            String uCity = request.getParameter("u_city");
            String uCountry = request.getParameter("u_country");

            users u = new users();
            u.setUserID(uID);
            u.setuFirstName(fName);
            u.setuLastName(lName);
            u.setuEmail(uEmail);
            u.setUserDOB(uBirthday);
            u.setGender(gender);
            u.setContactNo(cNum);
            u.setUserCity(uCity);
            u.setUserCountry(uCountry);

            int status = dao.updateUDetils(u);

            if (ustatus > 1) {
                if (status > 0) {
                    response.sendRedirect("Admin/edit.jsp?edit=success");
                } else {
                    response.sendRedirect("Admin/edit.jsp?edit=fail");
                }
            } else {
                if (status > 0) {
                    response.sendRedirect("Profile/edit.jsp?edit=success");
                } else {
                    response.sendRedirect("Profile/edit.jsp?edit=fail");
                }
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
