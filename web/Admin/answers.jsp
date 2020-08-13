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
                                    <h2 class="text-white pb-2 fw-bold">Answers</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">

                            <div class="col-md-12">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">All Answers</div>
                                        <table class="table table-bordered" id="answerTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Question</th>
                                                    <th>Name</th>
                                                    <th>Answer</th>
                                                    <th>Marks</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%
                                                    ResultSet aResults = dao.allAnswers();
                                                    while (aResults.next()) {
                                                        String Title = aResults.getString("questionTitle");
                                                        String FName = aResults.getString("uFirstName");
                                                        String LName = aResults.getString("uLastName");
                                                        String Answer = aResults.getString("answer");
                                                        String Marks = aResults.getString("marks");
                                                %>
                                                <tr>
                                                    <td><%=Title%></td>
                                                    <td><%=FName%>&nbsp;<%=LName%></td>
                                                    <td><%=Answer%></td>
                                                    <td><%=Marks%></td>
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
                $('#answerTable').DataTable(
                        {
                            "order": [[0, "desc"]]
                        }
                );
            });
        </script>

    </body>
</html>
