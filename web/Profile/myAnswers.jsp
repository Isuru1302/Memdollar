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
                <h2>My Answers</h2>
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

                                        <table cellpadding="0" id="atable" style="width: 100%;">

                                            <thead style="visibility: hidden; ">
                                                <tr style="border-spacing:0px!important; ">
                                                    <th style="width: 100%!important;"></th>
                                                </tr>

                                            </thead>

                                            <tbody>

                                                <%
                                                    ResultSet answersRS = dao.myAnswers((Integer) se.getAttribute("user_ID"));
                                                    while (answersRS.next()) {

                                                        String Title = answersRS.getString("questionTitle");
                                                        String Question = answersRS.getString("question");
                                                        String Date = answersRS.getString("date");
                                                        int Marks = answersRS.getInt("marks");
                                                        String feedback = answersRS.getString("answerFeedback");
                                                        String Answer = answersRS.getString("answer");
                                                %>    

                                            <div class="answer-area">

                                                <div class="user-area">
                                                    <h6><%=Title%></h6>
                                                    <p><%=Question%></p>
                                                </div>

                                                <div class="user-answer">
                                                    <p><i><%=Answer%>(<%=Date%>)</i></p>
                                                </div>

                                                <div class="user-feedback">
                                                    <p><i style="color:green;"><b><%=feedback%></b></i></p>
                                                </div>



                                                <p class="marks-form" style="cursor: default;">
                                                    Marks:&nbsp;<span id="currentMarks"><%=Marks%></span>
                                                </p>

                                            </div>

                                            <% }%>
                                            </tbody>


                                        </table>
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
                $('#atable').dataTable({
                    "bStateSave": true,
                    "searching": true,
                    "language": {
                        "info": "Showing _START_ to _END_ of _TOTAL_ Answers",
                    }
                });
            });
        </script>



    </body>
</html>
