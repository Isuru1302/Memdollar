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
                                    <h2 class="text-white pb-2 fw-bold">All Questions</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">

                            <div class="col-md-12">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">All Questions</div>


                                        <table class="table table-bordered" id="allQuestionTable" width="100%" cellspacing="0">

                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Title</th>
                                                    <th>Question</th>
                                                    <th>Tags</th>
                                                    <th>Student</th>
                                                    <th>status</th>
                                                    <th>Edit</th>
                                                    <th>Add/Remove</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <%
                                                    ResultSet qResults = dao.allQuestions();
                                                    while (qResults.next()) {
                                                        int qID = qResults.getInt("questionID");
                                                        String title = qResults.getString("questionTitle");
                                                        String question = qResults.getString("question");
                                                        String tags = qResults.getString("questionTags");
                                                        String studentName = qResults.getString("uFirstName");
                                                        int qStatus = qResults.getInt("questionStatus");
                                                %>    

                                                <tr>
                                                    <td><%=qID%></td>
                                                    <td><%=title%></td>

                                                    <td><%=question%></td>

                                                    <td><%=tags%></td>
                                                    <td><%=studentName%></td>
                                                    <td><%=qStatus%></td>
                                                    <td>
                                                        <i class="fa fa-pencil-square-o editQuestionModel"  aria-hidden="true" data-toggle="modal" 
                                                           data-target="#editQModel" data-id="<%=qID%>" data-question="<%=question%>" data-studentname="<%=studentName%>"
                                                           data-tags="<%=tags%>" data-title="<%=title%>"></i>
                                                    </td>

                                                    <td>
                                                        <% if (qStatus == 1) {%>
                                                        <i class="fa fa-trash-o"  aria-hidden="true" 
                                                           onclick="
                                                                   if (window.confirm('Are you sure you want to delete this question?'))
                                                                   {
                                                                       window.location = '../deleteQuestion?opt=del&id=<%=qID%>';
                                                                   }">

                                                        </i>

                                                        <% } else {%>
                                                        <i class="fa fa-plus"  aria-hidden="true" 
                                                           onclick="
                                                                   if (window.confirm('Are you sure you want to add this question?'))
                                                                   {
                                                                       window.location = '../deleteQuestion?opt=add&id=<%=qID%>';
                                                                   }
                                                           ">

                                                        </i>
                                                        <% } %>

                                                    </td>
                                                </tr>

                                                <%
                                                    }
                                                %>
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

        <!--Edit Question-->
        <div class="modal fade" id="editQModel">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">


                    <div class="modal-header">
                        <h6 class="modal-title">Edit Question</h6>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>


                    <div class="modal-body">

                        <form action="../editQuestion" method="POST" id="editQ">

                            ID: 
                            <input type="text" name="questionID" id="questionID" readonly><br>
                            
                            Title 
                            <input type="text" name="title" id="title" required> <br>
                            
                            Question: 
                            <input type="text" name="question" id="question" required> <br>

                            Tags:
                            <input type="text" name="tags" id="tags" readonly>  <br>
                            
                            Student Name:
                            <input type="text" name="studentName" id="studentName" readonly>  <br>


                        </form>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"  onclick="document.getElementById('editQ').submit();">Submit</button>
                        <button type="button" class="btn btn-secondary" style="background:red;" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

        <jsp:include page="templates/jsIncludes.jsp" /> 

        <script>
            $(document).ready(function () {
                $('#allQuestionTable').DataTable({
                    "order": [[0, "desc"]]
                });
            });
        </script>

        <script>
            $(document).on("click", ".editQuestionModel", function () {
                var studentID = $(this).data('id');
                var question = $(this).data('question');
                var studentName = $(this).data('studentname');
                var tags = $(this).data('tags');
                var title = $(this).data('title');
                $(".modal-body #questionID").val(studentID);
                $(".modal-body #question").val(question);
                $(".modal-body #studentName").val(studentName);
                $(".modal-body #tags").val(tags);
                $(".modal-body #title").val(title);
            });
        </script>

    </body>
</html>
