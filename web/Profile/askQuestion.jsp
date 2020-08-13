<%@page import="model.dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/headerIncludes.jsp" /> 
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
                <h2>Ask a Question</h2>
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
                                            <h3>Ask Question Form</h3>
                                        </div>

                                        <form action="../aQuestion" method="post" id="askqform">

                                            <input type="text" class="form-control" name="studID" id="studID" value="<%= (Integer) se.getAttribute("user_ID")%>" style="display: none;">
                                            <input type="text" class="form-control" name="qtitle" id="qtitle" placeholder="Question Title" required minlength="5">

                                            <textarea name="question" class="form-control" id="question" cols="30" rows="10" placeholder="Question" required minlength="10"></textarea>


                                            <input type="text" id="qtag" name="qtags" style="background: #eef3f6!important;" required>

                                            <button class="btn page-btn mt-30" type="submit" id="subBtn"  style="cursor: pointer;" >Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Web Details -->
        <jsp:include page="../templates/webDetails.jsp" /> 
        <!-- Web Details End -->

        <!--Footer-->
        <jsp:include page="../templates/footer.jsp" /> 
        <!--Footer End-->


        <jsp:include page="../templates/jsIncludes.jsp" /> 

        <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.min.js"></script>

        <script src="tageditor/jquery.caret.min.js"></script>
        <script src="tageditor/jquery.tag-editor.js"></script>



        <script>
            $(function () {
                var tagslist = [""];

            <%
                    ResultSet crs = dao.viewAllCategories();
                    while (crs.next()) {
                        String tag = crs.getString("categoryName");
            %>
                tagslist.push("<%=tag%>");
            <% }%>

                $('#qtag').tagEditor({

                    autocomplete: {delay: 0, position: {collision: 'flip'},
                        source: tagslist},
                    forceLowercase: false,
                    placeholder: 'Question Tags ...',
                    maxTags: 4,
                    sortable: true
                });
            });
        </script>

        

    </body>
</html>
