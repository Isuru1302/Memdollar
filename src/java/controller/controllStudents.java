
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao;

@WebServlet(name = "controllStudents", urlPatterns = {"/controllStudents"})
public class controllStudents extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String page = request.getParameter("page");
            int id = Integer.parseInt(request.getParameter("id"));
            int status;

            if (page.equals("add")) {
                status = dao.addStudent(id);

                if (status > 0) {
                    response.sendRedirect("Admin/students.jsp");
                }

            }

            else if (page.equals("remove")) {
                status = dao.removeStudent(id);

                if (status > 0) {
                    response.sendRedirect("Admin/students.jsp");
                }

            }
            
            else if(page.equals("addAdmin")) {
                status = dao.addAdmin(id);

                if (status > 0) {
                    response.sendRedirect("Admin/students.jsp");
                }

            }
            
            else if(page.equals("removeAdmin")) {
                status = dao.removeAdmin(id);

                if (status > 0) {
                    response.sendRedirect("Admin/admins.jsp");
                }

            }
            
            else if(page.equals("removeCourse")) {
                status = dao.removeCategory(id);

                if (status > 0) {
                    response.sendRedirect("Admin/category.jsp");
                }

            }
            
            else if(page.equals("addCourse")) {
                status = dao.addCategory(id);

                if (status > 0) {
                    response.sendRedirect("Admin/category.jsp");
                }
                
            }
            
            else if(page.equals("addNewCourse")) {
                status = dao.addCategory(id);

                if (status > 0) {
                    response.sendRedirect("Admin/category.jsp");
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
