<%@page import="model.dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="templates/headerIncludes.jsp" /> 

    </head>
    <body>

        <%
            HttpSession se = request.getSession();

            if (se.getAttribute("user_Status") == null || !se.getAttribute("user_Status").equals(2)) {

                response.sendRedirect("../");
                return;
            }
        %>
        
        <div class="wrapper">

            <jsp:include page="templates/header.jsp" /> 

            <div class="main-panel">
                <div class="content">
                    <div class="panel-header bg-primary-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Admin-Dashboard</h2>
                                </div>
                                <div class="ml-md-auto py-2 py-md-0">
                                    <a href="students.jsp" class="btn btn-secondary btn-round">Add Admin</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">
                            <div class="col-md-6">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">Overall statistics</div>
                                        <div class="card-category">Daily information about statistics in system</div>
                                        <div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
                                            <%                                                
                                                int studentCount = dao.studentsCount();
                                                
                                                int questionCount = dao.questionCount();
                                            %>

                                            <div class="px-2 pb-2 pb-md-0 text-center">
                                                <div id="circles-1" class="<%=studentCount%>"></div>
                                                <h6 class="fw-bold mt-3 mb-0">All Students</h6>
                                            </div>
                                            
                                            <div class="px-2 pb-2 pb-md-0 text-center">
                                                <div id="circles-3" class="<%=questionCount%>"></div>
                                                <h6 class="fw-bold mt-3 mb-0">All Questions</h6>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">Total income & spend statistics</div>
                                        <div class="row py-3">
                                            <div class="col-md-4 d-flex flex-column justify-content-around">
                                                <div>
                                                    <h6 class="fw-bold text-uppercase text-success op-8">Total Income</h6>
                                                    <h3 class="fw-bold">$9.782</h3>
                                                </div>
                                                <div>
                                                    <h6 class="fw-bold text-uppercase text-danger op-8">Total Spend</h6>
                                                    <h3 class="fw-bold">$1,248</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div id="chart-container">
                                                    <canvas id="totalIncomeChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <iframe src="../index.jsp" width="100%" height="500px"></iframe> 
                    </div>

                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul class="nav">

                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        Help
                                    </a>
                                </li>

                            </ul>
                        </nav>
                        <div class="copyright ml-auto">
                            Copyright ©2019 All rights reserved
                        </div>				
                    </div>
                </footer>
            </div>
        </div>

        <jsp:include page="templates/jsIncludes.jsp" /> 

        <!-- Chart Circle -->
        <script src="js/circles.min.js"></script>


        <script>
            var studentsCount = document.getElementById('circles-1').className;
            
            var questionCount = document.getElementById('circles-3').className;
            Circles.create({
                id: 'circles-1',
                radius: 45,
                value: studentsCount,
                maxValue: 10000,
                width: 7,
                text: studentsCount,
                colors: ['#f1f1f1', '#FF9E27'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            })

            

            Circles.create({
                id: 'circles-3',
                radius: 45,
                value: questionCount,
                maxValue: 10000,
                width: 7,
                text: questionCount,
                colors: ['#f1f1f1', '#F25961'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            })
        </script>
    </body>
</html>
