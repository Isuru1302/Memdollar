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
                                    <h2 class="text-white pb-2 fw-bold">Messages</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">

                            <div class="col-md-12">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">All Messages</div>
                                        <table class="table table-bordered" id="messageTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Message</th>
                                                    <th>Read/Unread</th>
                                                    <th>Reply</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%
                                                    ResultSet mResults = dao.getUsermessages();
                                                    while (mResults.next()) {
                                                        int msg_ID = mResults.getInt("messageID");
                                                        String msg_Name = mResults.getString("name");
                                                        String msg_Email = mResults.getString("email");
                                                        String msg = mResults.getString("message");
                                                        int msgS = mResults.getInt("status");
                                                %>
                                                <tr>
                                                    <td><%=msg_ID%></td>
                                                    <td><%=msg_Name%></td>
                                                    <td><%=msg_Email%></td>
                                                    <td><%=msg%></td>
                                                    <td><%if (msgS < 1) {%>
                                                        Read
                                                        <% } else {%>
                                                        Unread
                                                        <% }%>

                                                    </td>

                                                    <td>
                                                        <i class="fa fa-reply replyModel"  aria-hidden="true" data-toggle="modal" 
                                                           data-target="#replyModal"  data-student="<%=msg_Name%>" data-email="<%=msg_Email%>"></i>
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

        <!--Reply Model-->
        <div class="modal fade" id="replyModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">


                    <div class="modal-header">
                        <h6 class="modal-title">Reply to Message</h6>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>


                    <div class="modal-body">

                        <form action="../replyToStudent?type=message" method="POST" id="replyM">

                            Student Name: 
                            <input type="text" name="studentName" id="sName" readonly><br>

                            Student Email 
                            <input type="text" name="studentEmail" id="sEmail" readonly> <br>

                            Reply Message:
                            <textarea rows="4" name="replyMsg" id="replyMsg" required>  </textarea><br>


                        </form>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"  onclick="if (document.getElementById('replyMsg').value != '') {
                                    document.getElementById('replyM').submit();
                                }">Reply</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

        <jsp:include page="templates/jsIncludes.jsp" /> 

        <script>
            $(document).on("click", ".replyModel", function () {

                var studentName = $(this).data('student');
                var studentEmail = $(this).data('email');
                $(".modal-body #sName").val(studentName);
                $(".modal-body #sEmail").val(studentEmail);
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#messageTable').DataTable(
                        {
                            "order": [[0, "desc"]]
                        }
                );
            });
        </script>

    </body>
</html>
