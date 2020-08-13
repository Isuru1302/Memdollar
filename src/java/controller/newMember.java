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
import passwordHashing.randomString;
import passwordHashing.BCrypt;

@WebServlet(name = "newMember", urlPatterns = {"/newMember"})
public class newMember extends HttpServlet {

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
            String fName = request.getParameter("userFirst");
            String lName = request.getParameter("userLast");
            String DOB = request.getParameter("uDOB");
            int gender = Integer.parseInt(request.getParameter("uGender"));
            int cNumber = Integer.parseInt(request.getParameter("cNumber"));
            String username = request.getParameter("username");
            String Email = request.getParameter("uEmail");

            String rString = randomString.randomString();
            String tempPW = rString;
            String hashedTempPW = BCrypt.hashpw(rString, BCrypt.gensalt());

            int status = dao.registerNewStudent(fName, lName, DOB, gender, cNumber, username, Email, tempPW);

            if (status < 0) {
                response.sendRedirect("register.jsp?register=already_registerd");
            } else if (status > 0) {

                String subject = "Memdollar E-mail verification!!";
                String link = "http://"+sitename+"/newPw.jsp?un=" + username + "&token=" + hashedTempPW;

                String message = "<h1><i>Hello " + username + " !!!</i></h1>";
                message += "<h3><b>click here to verify your email</b></h3>";
                message += "<a style='color:white;font-weight:bold;background-color:#e0c21a;font-size:2em;padding:0.2em 3em 0.2em 3em;text-align:center;cursor: pointer;border-radius:10px;text-decoration: none;' href='" + link + "'>Verify</a>";

                sendEmail.sendEmail(host, port, user, pass, Email, subject, message);

                response.sendRedirect("index.jsp?register=success");
            } else {
                response.sendRedirect("register.jsp?register=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
