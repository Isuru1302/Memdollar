package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao;
import model.history;

@WebServlet(name = "aQuestion", urlPatterns = {"/aQuestion"})
public class aQuestion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int stuID = Integer.parseInt(request.getParameter("studID"));
            String QTitle = request.getParameter("qtitle");
            String Question = request.getParameter("question");
            String tags = request.getParameter("qtags");
            String date = history.date();
            int status = dao.addQutstion(stuID, QTitle, Question, tags, date);

            List<String> arraylist = Arrays.asList(tags.split(","));

            if (status > 0) {
                for (int i = 0; i < arraylist.size(); i++) {
                    dao.addNewCategory(arraylist.get(i));
                }
                response.sendRedirect("Profile/askQuestion.jsp?status=success");
            } else {
                response.sendRedirect("Profile/askQuestion.jsp?status=failed");
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
