package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao;
import model.history;

@WebServlet(name = "handdleQuestion", urlPatterns = {"/handdleQuestion"})
public class handdleQuestion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String action = request.getParameter("action");
            if (action.equals("report")) {
                int status = 0;
                int id = Integer.parseInt(request.getParameter("qid"));
                String stuName = request.getParameter("sname");
                String stuEmail = request.getParameter("semail");
                String reason = request.getParameter("reason");;
                status = dao.reportQuestion(id, stuName, stuEmail, reason);
                //out.print(status);
                if (status > 0) {
                    response.sendRedirect("Profile/index.jsp?report=success");
                } else {
                    response.sendRedirect("Profile/index.jsp?report=fail");
                }
            } else if (action.equals("answer")) {

                int qid = Integer.parseInt(request.getParameter("aqid"));
                int stuID = Integer.parseInt(request.getParameter("stid"));
                String answer = request.getParameter("qanswer");
                String date = history.date();

                int status = dao.answerQuestion(stuID, qid, answer, date);

                if (status > 0) {
                    //history.checkAnswerdQuestion(stuID, qid);
                    //history.answerQuestion(stuID, qid);
                    response.sendRedirect("Profile/index.jsp?answer=success");
                } else {
                    response.sendRedirect("Profile/index.jsp?answer=fail");
                }

            } else if (action.equals("skip")) {
                int qid = Integer.parseInt(request.getParameter("qID"));
                int stuID = Integer.parseInt(request.getParameter("stid"));

                int status = history.skipQuestion(stuID, qid);
                
                if (status > 0) {
                    response.sendRedirect("Profile/index.jsp");
                } else {
                    response.sendRedirect("Profile/index.jsp");
                }
            } else if (action.equals("mark")) {

                int qid = Integer.parseInt(request.getParameter("qID"));
                int stuID = Integer.parseInt(request.getParameter("stuID"));
                int aID = Integer.parseInt(request.getParameter("aID"));
                int mark = Integer.parseInt(request.getParameter("qmark"));
                String review = request.getParameter("answerFeedback");

                dao.markAnswer(stuID, qid, mark, review);
                history.answerStatus(aID);

                response.sendRedirect("Profile/answers.jsp?qid=" + qid);
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
