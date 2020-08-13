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

                                        <form action="../handdleQuestion?action=answer" method="post" id="askqform">
                                            <%
                                                int qID = Integer.parseInt(request.getParameter("qid"));
                                                int stuID = (Integer) se.getAttribute("user_ID");
                                                ResultSet aresults = dao.questionByID(qID);
                                                
                                                if(aresults.next()){
                                                    String title = aresults.getString("questionTitle");
                                                    String question = aresults.getString("question");
                                            %>
                                            
                                            <input type="text" name="aqid" value="<%=qID%>" class="displaynone">
                                            <input type="text" name="stid" value="<%=stuID%>" class="displaynone">
                                            
                                            <h6><%=qID%>.&nbsp;<%=title%></h6>
                                            <p><i><%=question%></i></p>
                                            <textarea placeholder="Answer" name="qanswer" minlength="5" rows="10" id="answerQues"></textarea>
                                            
                                            <button class="btn page-btn mt-30" type="submit" >Submit</button>
                                            <% }%>
                                        </form>
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
