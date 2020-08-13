<%@page import="model.dao"%>
<%@page import="model.users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/headerIncludes.jsp" /> 

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

        <!--Get User Details By ID-->

        <%
            
            int uID = (Integer) se.getAttribute("user_ID");

            users userDetails = dao.getUserDetailsByID(uID);

            String uFname = userDetails.getuFirstName();
            String uLname = userDetails.getuLastName();
            String uEmail = userDetails.getuEmail();
            String uDOB = userDetails.getUserDOB();
            String gender = userDetails.getGender();
            int cNum = userDetails.getContactNo();
            String uCity = "", uCountry = "";
            String password = userDetails.getUserPassword();
            if (userDetails.getUserCity() != null) {
                uCity = userDetails.getUserCity();
            } else {
                uCity = "";
            }

            if (userDetails.getUserCountry() != null) {
                uCountry = userDetails.getUserCountry();
            } else {
                uCountry = "";
            }

            String uDP = (String) se.getAttribute("user_ProfilePic");
            String Picpath = "";
            if (se.getAttribute("google_logedUser") == "true") {
                Picpath = "";
            } else {
                Picpath = "../";
            }
        %>

        <!--Get User Details By ID End-->

        <!-- Edit Profile -->
        <div class="edit-profile">
            <div class="container">
                <form class="up-profile-form" method="POST" action="../updateUdetails">
                    <h5>Update Account</h5><br>
                    <input style="display: none;" type="text" class="form-control" name="u_ID" id="u_ID" value="<%=uID%>">

                    <div class="form-group row">
                        <label for="new_dp" class="col-sm-2 col-form-label"><img style="height: 100px;width: 100px;" src="<%=Picpath%><%=uDP%>"></label>
                        <input type="text" name="old_dp" value="<%=Picpath%><%=uDP%>" style="display: none;">
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
                            <select name="u_gender" style="width: 100%;padding: 0.6em;border:1px solid #ddd;border-radius: 5px;">
                                <% if(gender.equals("")){  %><option value="0"  selected >Select</option><% } %>
                                <option value="1" <% if(gender.equals("Male")){  %> selected <% } %> >Male</option>
                                <option value="2" <% if(gender.equals("Female")){  %> selected <% } %>>Female</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="u_birthday" class="col-sm-2 col-form-label">Contact Number</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="u_cnumber" id="u_cnumber" value="<%=cNum%>" onkeypress="allowNumbersOnly(event)" required minlength="9" maxlength="10">
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
                <% if (se.getAttribute("google_logedUser") != "true") {%>
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
                <% }%>
            </div>
        </div>
        <!-- Edit Profile End -->

        <!--Footer-->
        <jsp:include page="../templates/footer.jsp" /> 
        <!--Footer End-->

        <jsp:include page="../templates/jsIncludes.jsp" /> 


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
