<%@page import="model.dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="templates/headerIncludes.jsp" /> 

       
    </head>
    <body>

        <%
            HttpSession se = request.getSession();

            if (se.getAttribute("user_Status") == null || !se.getAttribute("user_Status").equals(2)) {

                response.sendRedirect("../");
                return;
            }
        %>
        
        <div class="wrapper">

            <jsp:include page="templates/header.jsp" /> 

            <div class="main-panel">
                <div class="content">
                    <div class="panel-header bg-primary-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Students</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">

                            <div class="col-md-12">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">All Students</div>
                                        <table class="table table-bordered" id="messageTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>First Name</th>
                                                    <th>Last Name</th>
                                                    <th>Email</th>
                                                    <th>DOB</th>
                                                    <th>City</th>
                                                    <th>Country</th>
                                                    <th>Make Admin</th>
                                                    <th>Add/Remove</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%                                                    ResultSet sResults = dao.viewAllStudent();
                                                    while (sResults.next()) {
                                                        int sID = sResults.getInt("userID");
                                                        String sFname = sResults.getString("uFirstName");
                                                        String sLname = sResults.getString("uLastName");
                                                        String sEmail = sResults.getString("userEmail");
                                                        String sDOB = sResults.getString("userDOB");
                                                        String sCity = sResults.getString("userCity");
                                                        String sCountry = sResults.getString("userCountry");
                                                        int sStatus = sResults.getInt("userstatus");
                                                %>
                                                <tr>
                                                    <td><%=sID%></td>
                                                    <td><%=sFname%></td>
                                                    <td><%=sLname%></td>
                                                    <td><%=sEmail%></td>
                                                    <td><%=sDOB%></td>
                                                    <td><%=sCity%></td>
                                                    <td><%=sCountry%></td>

                                                    <td>
                                                        <%if ((Integer) se.getAttribute("user_ID") == 3) {%>
                                                        <button onclick="location.href = '../controllStudents?page=addAdmin&id=<%=sID%>'"
                                                                style=" color:#fff;background:greenyellow;cursor:pointer;border: 1px solid transparent;border-radius: 10px;">✓</button>
                                                        <%} else { %>
                                                        <button disabled
                                                                style=" color:#fff;background:lightcoral;cursor:not-allowed;border: 1px solid transparent;border-radius: 10px;">X</button>
                                                        <% } %>
                                                    </td>

                                                    <td><%if (sStatus == 1) {%>
                                                        <button onclick="location.href = '../controllStudents?page=remove&id=<%=sID%>'"
                                                                style=" color:#fff;background:lightcoral;cursor:pointer;border: 1px solid transparent;border-radius: 10px;">X</button>
                                                        <% } else {%>

                                                        <button onclick="location.href = '../controllStudents?page=add&id=<%=sID%>'"
                                                                style=" color:#fff;background:greenyellow;cursor:pointer;border: 1px solid transparent;border-radius: 10px;">✓</button>

                                                        <% }%>

                                                    </td>

                                                </tr>

                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul class="nav">

                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        Help
                                    </a>
                                </li>

                            </ul>
                        </nav>
                        <div class="copyright ml-auto">
                            Copyright ©2019 All rights reserved
                        </div>				
                    </div>
                </footer>
            </div>
        </div>

        <jsp:include page="templates/jsIncludes.jsp" /> 

        <script>
            $(document).ready(function () {
                $('#messageTable').DataTable();
            });
        </script>

    </body>
</html>
