<%@page import="model.history"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.dao"%>
<%@page import="model.dao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <jsp:include page="../templates/headerIncludes.jsp" /> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/tag-editor/1.0.20/jquery.tag-editor.min.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tag-editor/1.0.20/jquery.tag-editor.min.js"></script>
        <link rel="stylesheet" href="tageditor/jquery.tag-editor.css">

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

            .tag-editor{
                padding: 0.5em!important;
                border:1px solid #61ba6d!important;
                border-radius: 5px;
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

            #qtable{
                z-index: 10!important;
            }


        </style>
    </head>

    <body>

        <%
            HttpSession se = request.getSession();
            String stags = "";
            int searchStatus = 0;
            int pageCount = 0;
            int countPerPage = 10;
            int currentPage = 0;
            ResultSet qResults = null;

            List<String> tagsArrayList = new ArrayList<String>();;

            if (se.getAttribute("user_Status") == null || !se.getAttribute("user_Status").equals(1)) {

                response.sendRedirect("../");
                return;
            }

            int sID = (Integer) se.getAttribute("user_ID");

            if (request.getParameter("qtags") == null) {
                response.sendRedirect("../Profile/");
                searchStatus = 0;
            } else if (request.getParameter("qtags").equals("")) {
                response.sendRedirect("../Profile/");
                searchStatus = 0;
            } else if (!request.getParameter("qtags").equals("")) {
                stags = request.getParameter("qtags");
                String[] stagsArray = stags.split(",");

                for (int i = 0; i < stagsArray.length; i++) {
                    tagsArrayList.add(stagsArray[i]);
                }

                searchStatus = 1;
            }
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            } else {
                currentPage = 1;
            }
            int calc_page = (currentPage - 1) * countPerPage;
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
                <h2>Question Area</h2>
            </div>
        </div>
        <!--Top Image end-->

        <!--Body-->
        <div class="body-wrapper" style="padding-top: 8em;background: #F3F3F3;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-10 col-12">

                        <div class="search-area">

                            <form id="searchForm" action="search.jsp" method="GET">
                                <div class="row">
                                    <div class="col-12 col-md-10 col-lg-10 col-sm-10">
                                        <input type="text" data-json="<%=stags%>" id="qtag" name="qtags"> 
                                    </div>

                                    <div class="col-12 col-md-2 col-lg-2 col-sm-2">
                                        <button class="searchbutton">Search</button>
                                    </div>
                                </div>

                            </form>

                        </div>

                        <%
                            if (searchStatus == 1) {

                                for (String s : tagsArrayList) {
                                    pageCount = dao.searchResultsByTagsCount(sID, s);
                                    qResults = dao.searchResultsByTags(sID, s, calc_page, countPerPage);

                                    while (qResults.next()) {
                                        int qID = qResults.getInt("questionID");
                                        int studentID = qResults.getInt("userID");
                                        String title = qResults.getString("questionTitle");
                                        String question = qResults.getString("question");
                                        String tags = qResults.getString("questionTags");
                                        String studentName = qResults.getString("uFirstName");
                                        String studentLastName = qResults.getString("uLastName");
                                        String email = qResults.getString("userEmail");
                                        String date = qResults.getString("date");
                                        String dp = qResults.getString("userProfilePic");
                                        String[] tagsArray = tags.split(",");

                                        String pic;
                                        if (history.loginType(studentID) == 2) {
                                            pic = "";
                                        } else {
                                            pic = "../";
                                        }
                        %>

                        <div class="ques spacebottom">
                            <div class="row">
                                <div class="col-12 col-md-8 col-lg-10 col-sm-9 qcell">
                                    <div class="qcelltags">
                                        <ul>
                                            <% for (int j = 0; j < tagsArray.length; j++) {%>
                                            <li><%= tagsArray[j]%></li>
                                                <% }%>
                                        </ul>
                                    </div>
                                    <div class="qcellquestion">
                                        <div class="qtitle">
                                            <img class="userDP" src="<%=pic%><%=dp%>" alt="profilepic">
                                            <b><%= title%></b>
                                        </div><br>
                                        <p><%= question%></p>

                                        <p style="text-align: right;bottom:0;margin-bottom: -5.3em;margin-right: 1em;"><i>by <%= studentName%>&nbsp;<%= studentLastName%>(<%= date%>)</i></p>
                                    </div>



                                    <div class="prv-answers"><b onclick="location.href = 'answers.jsp?qid=<%= qID%>';">Previous Answers</b>

                                        <div class="feedbacks-count" id="feedbackstab<%=qID%>">

                                            <div id="feedbackData">
                                                <%
                                                    int likeStatus = history.LikeAndDislike(sID, qID);
                                                    int likeCount = dao.getLikeCount(qID);
                                                    int disLikeCount = dao.getDisLikeCount(qID);
                                                %>
                                            </div>

                                            <%
                                                String likeIcon = "";
                                                String disLikeIcon = "";
                                                String likeStyle = "";
                                                String disLikeStyle = "";
                                                String likefunction = "";
                                                if (likeStatus > 0) {
                                                    if (likeStatus == 1) {
                                                        likeIcon = "fa-thumbs-up";
                                                        disLikeIcon = "fa-thumbs-o-down";
                                                        likeStyle = "color:blue;";
                                                        likefunction = "onclick = 'likeToUnLike(" + qID + "," + sID + "," + likeCount + "," + disLikeCount + ")'";
                                                    }

                                                    if (likeStatus == 2) {
                                                        disLikeIcon = "fa-thumbs-down";
                                                        likeIcon = "fa-thumbs-o-up";
                                                        disLikeStyle = "color:red;";
                                                        likefunction = "onclick = 'unLikeToLike(" + qID + "," + sID + "," + likeCount + "," + disLikeCount + ")'";
                                                    }
                                                }
                                            %>

                                            <% if (likeStatus > 0) {%>
                                            <div id="likebtns">
                                                <i id="likebtn<%=qID%>" class="fa fa-lg <%= likeIcon%>" style="margin-right: 0.5em;<%= likeStyle%>" <%= likefunction%>><%= likeCount%></i>
                                                <i id="dislikebtn<%=qID%>"  class="fa fa-lg <%= disLikeIcon%>" style="<%= disLikeStyle%>" <%= likefunction%> ><%= disLikeCount%></i>
                                            </div>


                                            <% } else {%>
                                            <div id="likebtns">
                                                <i id="likebtn<%=qID%>" class="fa fa-lg fa-thumbs-o-up " style="margin-right: 0.5em;" onclick="LikeFunction(<%=qID%>,<%=sID%>,<%= likeCount%>,<%= disLikeCount%>)" ><%= likeCount%></i>
                                                <i id="dislikebtn<%=qID%>" class="fa fa-lg fa-thumbs-o-down DisLikeBtnValue" onclick="UnLikeFunction(<%=qID%>,<%=sID%>,<%= likeCount%>,<%= disLikeCount%>))"><%= disLikeCount%></i>
                                            </div>

                                            <% } %>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-sm-3 col-md-2 col-lg-2 col-12 btncell">
                                    <div>
                                        <%
                                            int status = history.checkAnswerdQuestion(sID, qID);

                                            if (status < 1) {
                                        %>

                                        <button onclick="location.href = 'answer.jsp?qid=<%= qID%>';">Answer</button>

                                        <% } else {%>

                                        <button disabled style="cursor: not-allowed;"
                                                data-toggle="tooltip" data-placement="top" title="You already answerd for this question!">
                                            Answer</button>
                                            <% }%>
                                    </div>

                                    <div>
                                        <button class="skip-question<%=qID%>" id="skipb" onclick="location.href = '../handdleQuestion?qID=<%= qID%>&stid=<%= sID%>&action=skip';">Skip</button>
                                    </div> 

                                    <div>
                                        <button class="reprtBtn" onclick="location.href = 'report.jsp?qid=<%= qID%>';">
                                            Report
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <% }
                                }
                            } %>
                        <%
                            String url = "?qtags=" + stags + "";

                            if ((pageCount / countPerPage) > 0) {

                        %>

                        <ul class="pagination"  style="float: right;margin-top: -2em;">

                            <%                if (currentPage > 1) {
                            %>
                            <li class="prev"><a href="<%=url%>&page=<%=currentPage - 1%>">Prev</a></li>
                                <% }%>

                            <% if (currentPage > 3) {%>
                            <li class="start"><a href="<%=url%>&page=1">1</a></li>
                            <li class="dots">...</li>
                                <% }%>

                            <% if (currentPage - 2 > 0) {%>
                            <li class="page">
                                <a href="<%=url%>&page=<%= currentPage - 2%>">
                                    <%= currentPage - 2%>
                                </a>
                            </li>
                            <% }%>

                            <% if (currentPage - 1 > 0) {%>
                            <li class="page">
                                <a href="<%=url%>&page=<%= currentPage - 1%>">
                                    <%= currentPage - 1%>
                                </a>
                                </a>
                            </li>
                            <% }%>

                            <li class="currentpage">
                                <a href="<%=url%>&page=<%= currentPage%>">
                                    <%= currentPage%>
                                </a>
                            </li>


                            <% if (currentPage + 1 < (pageCount / countPerPage) + 1) {%>
                            <li class="page">
                                <a href="<%=url%>&page=<%= currentPage + 1%>">
                                    <%= currentPage + 1%>
                                </a>
                            </li>
                            <% }%>

                            <% if (currentPage + 2 < (pageCount / countPerPage) + 1) {%>
                            <li class="page">
                                <a href="<%=url%>&page=<%= currentPage + 2%>">
                                    <%= currentPage + 2%>
                                </a>
                            </li>
                            <% }%>


                            <%if (currentPage < (pageCount / countPerPage) - 2) {%>
                            <li class="dots">...</li>
                            <li class="end"><a href="<%=url%>&page=<%= (pageCount / countPerPage)%>"><%= (pageCount / countPerPage)%></a></li>
                                <% }%>

                            <% if (currentPage < (pageCount / countPerPage)) {%>
                            <li class="next"><a href="<%=url%>&page=<%= currentPage + 1%>">Next</a></li>
                                <% }

                                %>


                        </ul>


                        <% }

                            dao.closeConnection();
                        %>
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

        <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.min.js"></script>

        <script src="tageditor/jquery.caret.min.js"></script>
        <script src="tageditor/jquery.tag-editor.js"></script>





        <script>
                                            $(document).ready(function () {
                                                $('[data-toggle="tooltip"]').tooltip();
                                            });
        </script>

        <script>
            $(function () {
                var tagslist = [""];
                var uniqTags = [];

            <%
                ResultSet crs = dao.viewAllCategories();
                while (crs.next()) {
                    String tag = crs.getString("categoryName");
                    String userTags = crs.getString("questionTags");
                    String[] usertagsArray = userTags.split(",");

            %>
                tagslist.push("<%=tag%>");

            <% for (int j = 0; j < usertagsArray.length; j++) {%>
                tagslist.push("<%= usertagsArray[j]%>");
            <%  }
                }

            %>

                $.each(tagslist, function (i, el) {
                    if ($.inArray(el, uniqTags) === -1)
                        uniqTags.push(el);
                });

                var $qtag = $('#qtag');
                $qtag.tagEditor({

                    autocomplete: {delay: 0, position: {collision: 'flip'},
                        source: uniqTags},
                    forceLowercase: false,
                    initialTags: $qtag.data("json").split(','),
                    placeholder: 'Filters ...',
                    maxTags: 4,
                    sortable: true
                });
            });
        </script>

    </body>
</html>

</body>
</html>
