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
                                    <h2 class="text-white pb-2 fw-bold">Categories</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">

                            <div class="col-md-12">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">All Categories
                                            <span style="float: right;">
                                                <button type="button" data-toggle="modal" data-target="#addcou"
                                                        style="color:#fff;background:greenyellow;cursor:pointer;border: 1px solid transparent;border-radius: 10px;">
                                                    +
                                                </button>
                                            </span>
                                        </div>
                                        <table class="table table-bordered" id="messageTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Course Name</th>
                                                    <th>Remove</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%                                                    
                                                    ResultSet sResults = dao.viewAllCategories();
                                                    while (sResults.next()) {
                                                        int cID = sResults.getInt("categoryID");
                                                        String cname = sResults.getString("categoryName");
                                                        int cStatus = sResults.getInt("categoryStatus");
                                                %>
                                                <tr>
                                                    <td><%=cID%></td>
                                                    <td><%=cname%></td>


                                                    <td>
                                                        <% if (cStatus != 0) {%>
                                                        <button onclick="location.href = '../controllStudents?page=removeCourse&id=<%=cID%>'"
                                                                style=" color:#fff;background:lightcoral;cursor:pointer;border: 1px solid transparent;border-radius: 10px;">X</button>
                                                        <% } else {%>
                                                        <button onclick="location.href = '../controllStudents?page=addCourse&id=<%=cID%>'"
                                                                style=" color:#fff;background:greenyellow;cursor:pointer;border: 1px solid transparent;border-radius: 10px;">✓</button>
                                                        <% } %>
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


                <!-- Modal -->
                <div class="modal fade" id="addcou" tabindex="-1" role="dialog" aria-labelledby="addCourse"
                     aria-hidden="true">
                    <div class="modal-dialog modal-md" role="document">
                        <div class="modal-content">
                            <form method="POST" action="../addNewCourse">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add Course</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <b>Course Name</b>
                                    <input type="text" id="course_name" name="course_name" minlength="2" required style="width:100%;">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add Course</button>
                                </div>
                            </form>
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



            <jsp:include page="templates/jsIncludes.jsp" /> 

            <script>
                $(document).ready(function () {
                    $('#messageTable').DataTable();
                });
            </script>

    </body>
</html>
