package controller;

import Email.sendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "replyToStudent", urlPatterns = {"/replyToStudent"})
public class replyToStudent extends HttpServlet {

    private String sitename;
    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        ServletContext context = getServletContext();
        sitename = context.getInitParameter("weburl");
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String type = request.getParameter("type");
            String studentName = request.getParameter("studentName");
            String studentEmail = request.getParameter("studentEmail");
            String msg = request.getParameter("replyMsg");
            String subject;
            String slink, flink;

            if (type.equals("message")) {
                subject = "Reply from the Memdollar for your message";
                slink = "Admin/messages.jsp?reply=success";
                flink = "Admin/messages.jsp?reply=failed";
            } 
            else {
                subject = "Reply from the Memdollar for your feedback";
                slink = "Admin/feedback.jsp?reply=success";
                flink = "Admin/feedback.jsp?reply=failed";
            }

            int status = sendMessage(studentName, studentEmail, subject, msg);

            if (status > 0) {
                response.sendRedirect(slink);
            } else {
                response.sendRedirect(flink);
            }
 
        }
    }

    private int sendMessage(String studName, String stuEmail, String subject, String msg) {
        int status = 0;

        try {
            String message = "<h1><i>Hello " + studName + " !!!</i></h1>";
            message += "<p><b>" + msg + "</b></p>";
            sendEmail.sendEmail(host, port, user, pass, stuEmail, subject, message);
            status = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
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
