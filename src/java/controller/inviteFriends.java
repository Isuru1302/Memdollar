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
import model.dao;

@WebServlet(name = "inviteFriends", urlPatterns = {"/inviteFriends"})
public class inviteFriends extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static String host;
    private static String port;
    private static String user;
    private static String pass;

    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    public static int sentInvitation(String emailAddress, String subject, String message) {
        int status=0;

        try {
            sendEmail.sendEmail(host, port, user, pass, emailAddress, subject, message);
            status =1;
        } catch (Exception e) {
            status =-1;
            e.printStackTrace();
        }

        return status;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String emailAddress = request.getParameter("friendEmail");
            String name = request.getParameter("name");

            String subject = "Invitation for the QuiZ-Master";
            String link = "http://localhost:8080/";

            String message = "<h1><i>Your friend " + name + " is invite to the QuiZ - Master Website. </i></h1>";
            message += "<h3><b>click bellow button to redirect to the web page.</b></h3>";
            message += "<a style='color:white;font-weight:bold;background-color:#e0c21a;font-size:2em;padding:0.2em 3em 0.2em 3em;text-align:center;cursor: pointer;border-radius:10px;text-decoration: none;' href='" + link + "'>Go</a>";

            int status = sentInvitation(emailAddress, subject, message);
            

            if (status > 0) {
                dao.inviteFriends(name, emailAddress);
                response.sendRedirect("index.jsp?invitation=success");
            } else {
                response.sendRedirect("index.jsp?invitation=fail");
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
