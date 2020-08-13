<%@page import="java.sql.ResultSet"%>
<%@page import="model.dao"%>

<%
    HttpSession se = request.getSession();
    String fName = (String) se.getAttribute("u_FirstName");
    String profilePic = (String) se.getAttribute("user_ProfilePic");
%>

<div class="main-header">
    <!-- Logo Header -->
    <div class="logo-header" data-background-color="blue">

        <a href="../Admin/" class="logo">
            <img src="../images/logo_1.png" alt="navbar brand" class="navbar-brand" style="margin-top: -3.5em;margin-left: -0.8em;">
        </a>
        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
                <i class="icon-menu"></i>
            </span>
        </button>
        <button class="topbar-toggler more"><i class="fa fa-bars"></i></button>
        <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar">
                <i class="fa fa-bars"></i>
            </button>
        </div>
    </div>
    <!-- End Logo Header -->

    <!-- Navbar Header -->
    <nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">

        <div class="container-fluid">
            <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">

                <li class="nav-item dropdown hidden-caret">

                    <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-comments"></i>
                        <%
                            int rsCount = dao.messageCount();
                        %>
                        <span class="notification"><%=rsCount%></span>
                    </a>
                    <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                        <li>
                            <div class="dropdown-title">You have <%=rsCount%> new Messages</div>
                        </li>
                        <li>
                            <div class="notif-scroll scrollbar-outer">
                                <div class="notif-center">

                                    <%
                                        ResultSet rs = dao.getUsermessages();

                                        while (rs.next()) {
                                            int msgID = rs.getInt("messageID");
                                            String name = rs.getString("name");
                                            String message = rs.getString("message");
                                            int m_status = rs.getInt("status");

                                            if (m_status > 0) {
                                    %>
                                    <a href="../readMessage?id=<%=msgID%>">
                                        <div class="notif-icon notif-success"> <i class="fa fa-comment"></i> </div>
                                        <div class="notif-content">
                                            <span class="block">
                                                <%=name%>
                                            </span>
                                            <span class="time"><%=message%></span> 
                                        </div>
                                    </a>

                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a class="see-all" href="messages.jsp">See all messages<i class="fa fa-angle-right"></i> </a>
                        </li>
                    </ul>

                </li>
                
                

                <li class="nav-item dropdown hidden-caret">
                    <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
                        <div class="avatar-sm">
                            <img src="../<%= profilePic%>" alt="..." class="avatar-img rounded-circle">
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                        <div class="dropdown-user-scroll scrollbar-outer">
                            <li>
                                <div class="user-box">
                                    <div class="avatar-lg"><img src="../<%= profilePic%>" alt="image profile" class="avatar-img rounded"></div>
                                    <div class="u-text">
                                        <h4><%= fName%></h4>
                                        <p class="text-muted">Administrator</p><a href="../logoutController" class="btn btn-xs btn-secondary btn-sm">Logout</a>
                                    </div>
                                </div>
                            </li>

                        </div>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!-- End Navbar -->
</div>

<!-- Sidebar -->
<div class="sidebar sidebar-style-2">			
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="avatar-sm float-left mr-2">
                    <img src="../<%= profilePic%>" alt="..." class="avatar-img rounded-circle">
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
                        <span>
                            <%= fName%>
                            <span class="user-level">Administrator</span>
                            <span class="caret"></span>
                        </span>
                    </a>
                    <div class="clearfix"></div>

                    <div class="collapse in" id="collapseExample">
                        <ul class="nav">
                            <li>
                                <a href="edit.jsp">
                                    <span class="link-collapse">My Profile</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <ul class="nav nav-primary">

                <li class="nav-section">
                    <span class="sidebar-mini-icon">
                        <i class="fa fa-ellipsis-h"></i>
                    </span>
                    <h4 class="text-section">Components</h4>
                </li>
                <li class="nav-item">
                    <a href="students.jsp">
                        <i class="fa fa-graduation-cap"></i>
                        <p>Students</p>
                        <span class="caret"></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a data-toggle="" href="category.jsp">
                        <i class="fa fa-list-alt"></i>
                        <p>Categories</p>
                        <span class="caret"></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a  href="admins.jsp">
                        <i class="fa fa-lock"></i>
                        <p>Admins</p>
                        <span class="caret"></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a data-toggle="collapse" href="#tables">
                        <i class="fa fa-book"></i>
                        <p>Questions</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="tables">
                        <ul class="nav nav-collapse">
                            <li>
                                <a href="allQuestions.jsp">
                                    <span class="sub-item">All Questions</span>
                                </a>
                            </li>
                            <li style="display: none;">
                                <a href="#" data-toggle="modal" data-target="#newpaperDetails">
                                    <span class="sub-item">Add new Questions</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="nav-item">
                    <a data-toggle="" href="feedback.jsp">
                        <i class="fa fa-lightbulb-o"></i>
                        <p>Student Feedback</p>
                        <span class="caret"></span>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a data-toggle="" href="messages.jsp">
                        <i class="fa fa-commenting-o"></i>
                        <p>Messages</p>
                        <span class="caret"></span>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a data-toggle="" href="answers.jsp">
                        <i class="fa fa-pencil-square"></i>
                        <p>Answers</p>
                        <span class="caret"></span>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a data-toggle="" href="invitations.jsp">
                        <i class="fa fa-share"></i>
                        <p>Invitations</p>
                        <span class="caret"></span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>
<!-- End Sidebar -->


