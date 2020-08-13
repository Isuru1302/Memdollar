<%@page import="model.dao"%>
<%@page import="model.users"%>
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
            <!-- Preloader -->
            <div id="preloader">
                <i class="circle-preloader"></i>
            </div>
            <!-- Preloader End -->
            <jsp:include page="templates/header.jsp" /> 

            <div class="main-panel">
                <div class="content">

                    <!--Get User Details By ID-->


                    <%                        HttpSession se = request.getSession();

                        int uID = (Integer) se.getAttribute("user_ID");

                        users userDetails = dao.getUserDetailsByID(uID);

                        String uFname = userDetails.getuFirstName();
                        String uLname = userDetails.getuLastName();
                        String uEmail = userDetails.getuEmail();
                        String uDOB = userDetails.getUserDOB();
                        String Gender = userDetails.getGender();
                        int cNum = userDetails.getContactNo();
                        String uCity = userDetails.getUserCity();
                        String uCountry = userDetails.getUserCountry();
                        String uDP = userDetails.getProfilePic();
                    %>

                    <!--Get User Details By ID End-->

                    <!-- Edit Profile -->
                    <div class="edit-profile" style="margin-top: 0!important">
                        <div class="container">
                            <form class="up-profile-form" method="POST" action="../updateUdetails" >
                                <h5>Update Account</h5><br>
                                <input style="display: none;" type="text" class="form-control" name="u_ID" id="u_ID" value="<%=uID%>">

                                <div class="form-group row">
                                    <label for="new_dp" class="col-sm-2 col-form-label"><img style="height: 100px;width: 100px;" src="../<%=uDP%>"></label>
                                    <input type="text" name="old_dp" value="<%=uDP%>" style="display: none;">
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" name="new_dp" id="new_dp" accept="image/*">
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="f_name" class="col-sm-2 col-form-label">First Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="f_name" id="f_name" value="<%=uFname%>" required minlength="3">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="l_name" class="col-sm-2 col-form-label">Last Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="l_name" id="l_name" value="<%=uLname%>" required minlength="3">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="u_email" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" name="u_email" id="u_email" value="<%=uEmail%>" required minlength="3">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="u_birthday" class="col-sm-2 col-form-label">Birthday</label>
                                    <div class="col-sm-10">
                                        <input type="DATE" class="form-control" name="u_birthday" id="u_birthday" value="<%=uDOB%>" required minlength="3">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="u_gender" class="col-sm-2 col-form-label">Gender</label>
                                    <div class="col-sm-10">
                                        <select required name="u_gender" style="width: 100%;height: 3em;padding-left: 1em;border-radius:5px;border:1px solid #ddd; ">
                                            <option value="1" <%if (Gender.equals("Male")) {%> selected <%} %>>Male</option>
                                            <option value="2" <%if (Gender.equals("Female")) {%> selected <%}%>>Female</option>
                                        </select>
                                    </div>
                                </div>  

                                <div class="form-group row">
                                    <label for="u_cnumber" class="col-sm-2 col-form-label">Contact Number</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="u_cnumber" id="u_cnumber" value="<%=cNum%>" maxlength="10">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="u_city" class="col-sm-2 col-form-label">City/Town</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="u_city" id="u_city" value="<%=uCity%>" minlength="3">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="u_country" class="col-sm-2 col-form-label">Country</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="u_country" id="u_country" value="<%=uCountry%>" minlength="3">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-10 edit-submit">
                                        <input type="submit" class="form-control" name="submit" id="submit" value="Update">
                                    </div>
                                </div>

                            </form>

                            <form action="../updatePassword" method="POST">
                                <h5>Update Password</h5>
                                <input style="display: none;" type="text" class="form-control" name="uid" id="uid" value="<%=uID%>">
                                <div class="form-group row">
                                    <label for="c_password" class="col-sm-2 col-form-label">Current Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="c_password" id="c_password" placeholder="Current Password" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="u_password1" class="col-sm-2 col-form-label">New Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="u_password1" id="u_password1" placeholder="New Password" required minlength="5">

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="u_password2" class="col-sm-2 col-form-label">New Password Again</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="u_password2" id="u_password2" placeholder="New Password(Again)" required minlength="5">
                                        <span id="message"></span>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-10 edit-submit">
                                        <input style="cursor: not-allowed!important" type="submit" class="form-control" name="submit" id="submitPWForm" value="Update Password">
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                    <!-- Edit Profile End -->

                    <!--Footer-->
                    <div class="bottom-footer-area">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <p>Copyright ©2019 All rights reserved</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Footer End-->
                </div>
            </div>
        </div>
        <jsp:include page="templates/jsIncludes.jsp" /> 

        <script>
            $('form').validate();

            $('#u_password1, #u_password2').on('keyup', function () {
                if ($('#u_password1').val() == $('#u_password2').val()) {
                    $('#message').html('Passwords are Matching').css('color', 'green');
                    $('#submitPWForm').prop('disabled', false).css('cursor', 'pointer');
                } else {
                    $('#message').html('Passwords are not Matching').css('color', 'red');
                    $('#submitPWForm').prop('disabled', true).css('cursor', 'not-allowed!important');
                }
            });
        </script>

    </body>
</html>
