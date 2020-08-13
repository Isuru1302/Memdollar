<%@page import="model.dao"%>
<%
    String URL = request.getRequestURL().toString();
    String path;
    if (URL.contains("Profile/") || URL.contains("Admin/")) {
        path = "../";
    } else {
        path = "";
    }
%>

<style>
    .menu2{
        display: none;
    }
    
    .menu2 .score li{
       
    }
</style>

<div class="top-header" style="background: transparent!important;">
    <div class="container h-100">
        <div class="row h-100">
            <div class="col-12 h-100">
                <div class="header-content h-100 d-flex align-items-center justify-content-between">
                    <div class="academy-logo">
                        <a href="<%=path%>index.jsp"><img src="<%=path%>images/logo_1.png" alt=""></a>
                    </div>
                    <div class="login-content">

                        <%
                            HttpSession se = request.getSession();
                            String picPath = "";
                            if (se.getAttribute("user_ID") != null) {
                                String fName = (String) se.getAttribute("u_FirstName");
                                int uStatus = (Integer) se.getAttribute("user_Status");
                                String profilePic = (String) se.getAttribute("user_ProfilePic");

                                if (se.getAttribute("google_logedUser") == "true") {
                                    picPath = "";
                                } else {
                                    picPath = "../";
                                }
                                
                        %>
                        
                        <div class="drop-down">
                            <a href="#" class="logged-user"><img class="profile-pic" src="<%=picPath%><%=profilePic%>">&nbsp;&nbsp;

                                <%=fName%>
                            </a>

                            <ul class="login-dropdown" style="width:36%;">
                                <% if (uStatus == 1) {%>
                                <li><a href="<%=path%>Profile/">
                                        <i class="fa fa-tachometer" aria-hidden="true">&nbsp;Dashboard</i>
                                    </a></li>
                                <li><a href="<%=path%>Profile/profile.jsp?stuId=<%=(Integer)se.getAttribute("user_ID")%>"><i class="fa fa-user" aria-hidden="true">&nbsp;Profile</i></a></li>
                                <li><a href="<%=path%>Profile/myQuestions.jsp"><i class="fa fa-question-circle-o" aria-hidden="true">&nbsp;My Questions</i></a></li>
                                <li><a href="<%=path%>Profile/myAnswers.jsp"><i class="fa fa-pencil-square-o" aria-hidden="true">&nbsp;My Answers</i></a></li>
                                <li><a href="<%=path%>Profile/askQuestion.jsp"><i class="fa fa-lightbulb-o" aria-hidden="true">&nbsp;Ask Question</i></a></li>
                                    <% } else {%>
                                <li><a href="<%=path%>Admin/">
                                        <i class="fa fa-tachometer" aria-hidden="true">&nbsp;Dashboard</i>
                                    </a></li>

                                <% }

                                    if (se.getAttribute("google_logedUser") == "true") {%>
                                <li style='border-top: 1px solid #ddd;'><a href='#' onclick='signOutfromGoogle()'><i class='fa fa-sign-out' aria-hidden='true'>&nbsp;Logout</i></a></li>

                                <% } else {%>
                                <li style='border-top: 1px solid #ddd;'><a href='<%=path%>logoutController'><i class='fa fa-sign-out' aria-hidden='true'>&nbsp;Logout</i></a></li>

                                <% } %>
                            </ul>

                        </div>

                        <% } else { %>
                        <a href="login.jsp"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;&nbsp;Login</a>
                        <% }%>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="website-main-menu">
    <div class="classy-nav-container breakpoint-off">
        <div class="container">

            <nav class="classy-navbar justify-content-between" id="webNav">

                <div class="classy-navbar-toggler ">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <div class="classy-menu">

                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>

                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="<%=path%>about-us.jsp">About Us</a></li>
                            <li><a href="<%=path%>contact.jsp">Contact</a></li>
                            <li><a href="<%=path%>faq.jsp">FAQ</a></li>
                        </ul>
                    </div>
                </div>

                <div class="calling-info view-disable">
                    <div class="call-center">
                        <a href="mailto:support@memdollar.com"><i class="fa fa-envelope"></i> <span>support@memdollar.com</span></a>
                    </div>
                </div>

                <div class="menu menu2">
                    
                </div>

                <div class="calling-info menu2 ">
                    <div class="call-center">
                        
                        <%
                            if (se.getAttribute("user_ID") != null) {
                            int uID = (Integer)se.getAttribute("user_ID");
                            int marks = dao.calculateMarks(uID);
                        %>
                        
                        <span></i>Score:&nbsp;<%=marks%></span>
                        <% }%>
                    </div>
                </div>

            </nav>

        </div>
    </div>
</div>