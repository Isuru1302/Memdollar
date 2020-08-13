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
            .menu2{
                display: none!important;
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
            int stuID = Integer.parseInt(request.getParameter("stuId"));
            int seStuID = (Integer) se.getAttribute("user_ID");

            if (stuID != seStuID) {
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
                <h2>My Profle</h2>
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

                                        <div class="row">
                                            <div class="col-12 col-md-4 col-lg-4">

                                                <%
                                                    users stu = new users();
                                                    stu = dao.getUserDetailsByID(stuID);

                                                %>

                                                <div class="user-dp">
                                                    <img src="<%=stu.getProfilePic()%>" class="">
                                                </div>

                                                <div class="user-details">
                                                    <h6><%=stu.getuFirstName()%>&nbsp;<%=stu.getuLastName()%></h6>

                                                    <p><i class="fa fa-envelope"></i>&nbsp;<%=stu.getuEmail()%></p>
                                                    <p><i class="fa fa-birthday-cake"></i>&nbsp;<%=stu.getUserDOB()%></p>
                                                    <p><i class="fa fa-male"></i>&nbsp;<%=stu.getGender()%></p>
                                                    <p><i class="fa fa-phone"></i>&nbsp;<%=stu.getContactNo()%></p>
                                                    <p><i class="fa fa-location-arrow"></i>&nbsp;<%=stu.getUserCity()%></p>
                                                    <p><i class="fa fa-globe"></i>&nbsp;<%=stu.getUserCountry()%></p>

                                                    <button onclick="location.href = 'edit.jsp';">Edit</button>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-8 col-lg-8">

                                                <%
                                                    int avarage=0;
                                                    int marks = dao.calculateMarks(stuID);
                                                    int totalAnswers = history.totalAnsweredQuestions(stuID);

                                                    if (totalAnswers > 0) {
                                                        avarage = (marks / (totalAnswers * 10)) * 100;
                                                    }else{
                                                        avarage=0;
                                                    }
                                                %>

                                                <div class="my-skills">
                                                    <h2 style="font-weight: 100;">My Skills</h2>

                                                    <p>Total Answered Questions: <%=totalAnswers%></p>
                                                    <p>Total Marks: <%=marks%></p>
                                                    <p>Average: <%=avarage%>%</p>
                                                </div>

                                                <h6><u>Recent Questions</u></h6>

                                                <%
                                                    ResultSet recentRs = history.recentQuestions(stuID);
                                                    while (recentRs.next()) {
                                                        String title = recentRs.getString("questionTitle");
                                                        String question = recentRs.getString("question");
                                                        String likes = recentRs.getString("questionLikes");
                                                        String dislikes = recentRs.getString("questionDisLikes");
                                                %>

                                                <div class="col-12 recent-questions">
                                                    <div class="qcellquestion">
                                                        <div class="qtitle"><b><%=title%></b></div><br>
                                                        <p><%=question%></p>

                                                    </div>

                                                    <div class="prv-answers">
                                                        <div class="feedbacks-count">
                                                            <i class="fa fa-lg fa-thumbs-o-up" style="margin-right: 0.5em;"><%=likes%></i>
                                                            <i class="fa fa-lg fa-thumbs-o-down"><%=dislikes%></i>
                                                        </div>
                                                    </div>
                                                </div>

                                                <% }
                                                    dao.closeConnection();
                                                %>
                                            </div>
                                        </div>
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


    </body>
</html>
