<%@page import="java.sql.*"%>
<%@page import="model.*"%>
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
            int userID = (Integer) se.getAttribute("user_ID");
            int aID = Integer.parseInt(request.getParameter("aid"));

            users u = history.checkUserForMarking(aID);

            if (se.getAttribute("user_Status") == null || !se.getAttribute("user_Status").equals(1)) {

                response.sendRedirect("../");
                return;
            } else if (userID != u.getUserID()) {
                response.sendRedirect("myQuestions.jsp");
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
                                        <%
                                            ResultSet rs = history.checkUserForMarkin2g(aID);
                                            while (rs.next()) {
                                                String title = rs.getString("questionTitle");
                                                String question = rs.getString("question");
                                                String answer = rs.getString("answer");
                                                int mark = rs.getInt("marks");
                                                String review = rs.getString("answerFeedback");
                                                
                                                int stuID = rs.getInt("stuID");
                                                int qID = rs.getInt("qID");
                                        %>
                                        <form action="../handdleQuestion?action=mark&stuID=<%=stuID%>&qID=<%=qID%>&aID=<%=aID%>" method="post" id="markqform">



                                            <h6><%=title%></h6>
                                            <p><b><%=question%></b></p>
                                            <p><i><%=answer%></i></p>
                                            Mark:
                                            <input type="number" name="qmark" value="<%=mark%>" min="0" max="10" onkeypress="allowNumbersOnly(event)">
                                            <textarea rows="10" name="answerFeedback"><%=review%></textarea>



                                            <button class="btn page-btn mt-30" type="submit" >Submit</button>
                                        </form>

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



    </body>
</html>
