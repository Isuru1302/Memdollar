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
                <h2>Report</h2>
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

                                        <form action="../handdleQuestion?action=report" method="POST" id="reportQ">

                                            <%
                                                int qID = Integer.parseInt(request.getParameter("qid"));
                                                int sID = (Integer) se.getAttribute("user_ID");
                                                users u = dao.getUserDetailsByID(sID);
                                                String fname = u.getuFirstName();
                                                String lname = u.getuLastName();
                                                String uemail = u.getuEmail();
                                            %>

                                            <input type="text" name="qid" id="qid" value="<%=qID%>" style="display: none;"> <br>
                                            Name:  
                                            <input type="text" name="sname" value="<%= fname %>&nbsp;<%= lname %>" id="sname" readonly> <br>

                                            Email:
                                            <input type="text" name="semail" value="<%= uemail %>" id="semail" readonly> <br>

                                            Reason:
                                            <textarea name="reason" id="reason" minlength="8" required></textarea>  <br>


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

        <!-- Question Marks -->
        <div class="modal fade" id="marksAnswer">
            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content">

                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                        <form action="../handdleQuestion?action=mark" method="POST" id="markQ">


                            <input type="number" min="0" max="10" id="marks" onkeypress="allowNumbersOnly(event)">

                            <button type="submit" class="subBtn btn btn-secondary" style="background:  lightgreen;border:1px solid green;"><b>Add</b></button>
                        </form>

                    </div>

                </div>
            </div>
        </div>


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

        <script>
            $(document).ready(function () {
                $("#marksAnswer").click(function () {
                    // currentMarks
                    var currentMark = document.getElementById("currentMarks").innerHTML;
                    window.alert(currentMark);
                });
            });
        </script>

    </body>
</html>
