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
                                    <h2 class="text-white pb-2 fw-bold">Invitations</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">

                            <div class="col-md-12">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">All Invitations</div>
                                        <table class="table table-bordered" id="inviteTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Friend's Email</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%
                                                    ResultSet iResults = dao.invitations();
                                                    while (iResults.next()) {
                                                        String Name = iResults.getString("Name");
                                                        String Email = iResults.getString("Email");
                                                        String Date =iResults.getString("Date");
                                                        
                                                %>
                                                <tr>
                                                    <td><%=Name%></td>
                                                    <td><%=Email%></td>
                                                    <td><%=Date%></td>
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
                $('#inviteTable').DataTable(
                        {
                            "order": [[0, "desc"]]
                        }
                );
            });
        </script>

    </body>
</html>
