<%@page import="java.sql.ResultSet"%>
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


            .container-fluid {
                width: auto !important;
                margin-right: 0 !important;
                margin-left: 5% !important;
            }

            body{
                background: #fff;
                /*                background: #eef3f6;*/
            }

            .wrapper{
                margin-top: 8em;
                margin-bottom: 1em;
            }

            #qtable_length,#qtable_filter{
                z-index: 99!important;
                position: relative;
                width: 100%;
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
                <h2>My Questions</h2>
            </div>
        </div>
        <!--Top Image end-->

        <!--Body-->
        <div class="body-wrapper" style="padding-top: 8em;background: #F3F3F3;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-10 col-12">



                        <%
                            int currentPage;
                            int id = (Integer) se.getAttribute("user_ID");
                            int pageCount = dao.countAllQuestionsByID(id);

                            int countPerPage = 10;

                            if (request.getParameter("page") != null) {

                                currentPage = Integer.parseInt(request.getParameter("page"));
                            } else {
                                currentPage = 1;
                            }

                            int calc_page = (currentPage - 1) * countPerPage;
                            
                            
                            ResultSet qResults = dao.allQuestionsByID(id,calc_page, countPerPage);

                            while (qResults.next()) {
                                int qID = qResults.getInt("questionID");
                                String title = qResults.getString("questionTitle");
                                String question = qResults.getString("question");
                                String tags = qResults.getString("questionTags");
                                String studentName = qResults.getString("uFirstName");
                                String studentLastName = qResults.getString("uLastName");
                                int likes = qResults.getInt("questionLikes");
                                int dislikes = qResults.getInt("questionDisLikes");
                                String email = qResults.getString("userEmail");
                                String date = qResults.getString("date");
                                String[] tagsArray = tags.split(",");

                        %>

                        <div class="ques spacebottom">
                            <div class="row">
                                <div class="col-12 col-md-8 col-lg-10 col-sm-9 qcell">
                                    <div class="qcelltags">
                                        <ul>
                                            <% for (int i = 0; i < tagsArray.length; i++) {%>
                                            <li><%= tagsArray[i]%></li>
                                                <% }%>
                                        </ul>
                                    </div>
                                    <div class="qcellquestion">
                                        <div class="qtitle"><b><%= qID%>.&nbsp;<%= title%></b></div><br>
                                        <p><%= question%></p>

                                        <p style="text-align: right;bottom:0;margin-bottom: -5.3em;margin-right: 1em;"><i>by <%= studentName%>&nbsp;<%= studentLastName%>(<%= date%>)</i></p>
                                    </div>



                                    <div class="prv-answers">
                                        <div class="feedbacks-count">
                                            <i class="fa fa-lg fa-thumbs-o-up" style="margin-right: 0.5em;"><%= likes%></i>
                                            <i class="fa fa-lg fa-thumbs-o-down"><%= dislikes%></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="btncell">
                                    <div>
                                        <button onclick="location.href = 'answers.jsp?qid=<%=qID%>';">Answers</button>
                                    </div>

                                    <div>
                                        <button class="del-question" onclick="location.href = '../deleteQuestion?opt=delbyUser&id=<%=qID%>';">Delete</button>
                                    </div> 

                                </div>

                            </div>
                        </div>

                        <% }

                            
                            if ((pageCount / countPerPage) > 0) {

                        %>

                        <ul class="pagination"  style="float: right;margin-top: -2em;">

                            <%                if (currentPage > 1) {
                            %>
                            <li class="prev"><a href="?page=<%=currentPage - 1%>">Prev</a></li>
                                <% }%>

                            <% if (currentPage > 3) { %>
                            <li class="start"><a href="?page=1">1</a></li>
                            <li class="dots">...</li>
                                <% }%>

                            <% if (currentPage - 2 > 0) {%>
                            <li class="page">
                                <a href="?page=<%= currentPage - 2%>">
                                    <%= currentPage - 2%>
                                </a>
                            </li>
                            <% }%>

                            <% if (currentPage - 1 > 0) {%>
                            <li class="page">
                                <a href="?page=<%= currentPage - 1%>">
                                    <%= currentPage - 1%>
                                </a>
                                </a>
                            </li>
                            <% }%>

                            <li class="currentpage">
                                <a href="?page=<%= currentPage%>">
                                    <%= currentPage%>
                                </a>
                            </li>


                            <% if (currentPage + 1 < (pageCount / countPerPage) + 1) {%>
                            <li class="page">
                                <a href="?page=<%= currentPage + 1%>">
                                    <%= currentPage + 1%>
                                </a>
                            </li>
                            <% }%>

                            <% if (currentPage + 2 < (pageCount / countPerPage) + 1) {%>
                            <li class="page">
                                <a href="?page=<%= currentPage + 2%>">
                                    <%= currentPage + 2%>
                                </a>
                            </li>
                            <% }%>


                            <%if (currentPage < (pageCount / countPerPage) - 2) {%>
                            <li class="dots">...</li>
                            <li class="end"><a href="?page=<%= (pageCount / countPerPage)%>"><%= (pageCount / countPerPage)%></a></li>
                                <% }%>

                            <% if (currentPage < (pageCount / countPerPage)) {%>
                            <li class="next"><a href="?page=<%= currentPage + 1%>">Next</a></li>
                                <% } %>


                        </ul>


                        <% }%>


                    </div>

                    <div class="col-md-2 col-12" >
                        <div class="adver-area">
                            <div class="row">
                                <div class="col-6 col-sm-3 col-md-12 col-lg-12 adver">
                                    <img src="https://via.placeholder.com/250x250.png?text=Advertisement(250x250)" class="img-fluid">
                                </div>

                                <div class="col-6 col-sm-3 col-md-12 col-lg-12 adver">
                                    <img src="https://via.placeholder.com/250x250.png?text=Advertisement(250x250)" class="img-fluid">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--Body End-->





        <!--Footer-->
        <jsp:include page="../templates/footer.jsp" /> 
        <!--Footer End-->

        <jsp:include page="../templates/jsIncludes.jsp" /> 


        <script src="../Admin/js/jquery-ui.min.js"></script>
        <script src="../Admin/js/jquery.scrollbar.min.js"></script>
        <script src="../Admin/datatables/jquery.dataTables.min.js"></script>
        <script src="../Admin/datatables/dataTables.bootstrap4.min.js"></script>





    </body>
</html>
