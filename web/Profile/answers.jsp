<%@page import="model.history"%>
<%@page import="model.users"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.dao"%>
<%@page import="model.dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/headerIncludes.jsp" /> 
        <link href="../Admin/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


        <style>
            .view-disable{
                display: none;
            }

            .menu2{
                display: block!important;
                color:#fff;
                font-weight: bold;
            }

            #atable_length,#atable_filter,#atable_previous,#atable_next,#atable_info,.dataTables_empty{
                display: none;
            }

        </style>
    </head>
    <body>

        <%
            HttpSession se = request.getSession();

            if (se.getAttribute("user_Status") == null || !se.getAttribute("user_Status").equals(1)) {

                response.sendRedirect("../");
                return;
            }
        %>

        <!-- Preloader -->
        <div id="preloader">
            <i class="circle-preloader"></i>
        </div>
        <!-- Preloader End -->


        <!--Header -->
        <header class="header-area">
            <jsp:include page="../templates/topheader.jsp" />
        </header>
        <!--Header End-->

        <!--Top Image-->
        <div class="topimage bg-img" style="background-image: url(../images/topimage.jpg);">
            <div class="topimageContent">
                <h2>Answers</h2>
            </div>
        </div>
        <!--Top Image end-->


        <section class="contact-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="contact-content">
                            <div class="row">


                                <div class="col-12 col-lg-12">
                                    <div class="contact-form-area wow fadeInUp" data-wow-delay="500ms">

                                        <div class="section-heading text-left">
                                            <h6>
                                                <%
                                                    int id = 0, checkStatus=0;
                                                    int userID = (Integer) se.getAttribute("user_ID");
                                                    if (request.getParameter("qid") == null) {
                                                        response.sendRedirect("../");
                                                    } else {
                                                        id = Integer.parseInt(request.getParameter("qid"));

                                                    }

                                                    int status = history.checkUserForQuestion(id);

                                                    if (status != userID) {
                                                        checkStatus = 1;
                                                    }
                                                    

                                                    ResultSet qResults = dao.questionByID(id);

                                                    while (qResults.next()) {
                                                        String qTitle = qResults.getString("questionTitle");
                                                %>
                                                <%=qTitle%>
                                                <% }%>
                                            </h6>
                                        </div>




                                        <%
                                            String picPath = "";

                                            ResultSet aResults = dao.answersByID(id);
                                            while (aResults.next()) {
                                                int answerID = aResults.getInt("answerID");
                                                String dp = aResults.getString("userProfilePic");
                                                String name = aResults.getString("uFirstName");
                                                String lname = aResults.getString("uLastName");
                                                String answer = aResults.getString("answer");
                                                int loginType = aResults.getInt("loginType");
                                                String dateTime = aResults.getString("date");
                                                int astatus = aResults.getInt("status");
                                                int marks = aResults.getInt("marks");
                                                if (loginType == 2) {
                                                    picPath = "";
                                                } else {
                                                    picPath = "../";
                                                }
                                        %>

                                        <div class="answer-area" <% if (checkStatus == 0) {%> style="cursor: pointer;" onclick="location.href = 'marks.jsp?aid=<%=answerID%>&qid=<%=id%>'" <% } else{ %> style="cursor: pointer!important;"<% }%> >

                                            <div class="user-area">
                                                <ul>
                                                    <li><img class="profile-pic" src="<%=picPath%><%=dp%>"></li>
                                                    <li><b><%=name%>&nbsp;<%=lname%></b></li>
                                                    <li><i style="color:gray;">(<%=dateTime%>)</i></li>

                                                    <% if (astatus == 1) {%>
                                                    <li><img src="../images/new.png" alt="new png" style="height: 2.8em;"></li>
                                                        <% }%>
                                                </ul>
                                            </div>

                                            <div class="user-answer">
                                                <p><%=answer%></p>
                                            </div>

                                            <p class="marks-form"> 
                                                Marks:&nbsp;<span id="currentMarks"><%=String.valueOf(marks)%></span>
                                            </p>

                                        </div>

                                        <% }%>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

       


        <!--Footer-->
        <jsp:include page="../templates/footer.jsp" /> 
        <!--Footer End-->


        <jsp:include page="../templates/jsIncludes.jsp" /> 


        <script src="../Admin/js/jquery-ui.min.js"></script>
        <script src="../Admin/js/jquery.scrollbar.min.js"></script>
        <script src="../Admin/datatables/jquery.dataTables.min.js"></script>
        <script src="../Admin/datatables/dataTables.bootstrap4.min.js"></script>



      

        <script>
            $(document).ready(function () {
                $("#marksAnswer").click(function () {
                    // currentMarks
                    var currentMark = document.getElementById("currentMarks").innerHTML;
                    window.alert(currentMark);
                });
            });
        </script>

    </body>
</html>
