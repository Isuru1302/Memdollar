
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="templates/headerIncludes.jsp" /> 
        <link rel="stylesheet" type="text/css" href="css/loginCss.css">
    </head>
    <body style="background-image: url(images/background.jpg);">
        <div class="login_form" >

            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" method="POST" action="loginController" id="loginForm">
                        <span class="login100-form-title p-b-26">
                            Welcome to memdollar.com
                        </span>

                        <div class="wrap-input100 validate-input">
                            <input class="input100" type="text" id="username" name="username" placeholder="Username" required>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <span class="btn-show-pass">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </span>
                            <input class="input100" type="password" name="uPassword" id="uPassword" placeholder="Password" required>
                        </div>

                        <div class="forgot-pw" style="text-align: right;">
                            <a href="#" data-toggle="modal" data-target="#resetPassword"><i>Forgot password?</i></a>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">
                                    Login
                                </button>
                            </div>
                        </div>

                        <div class="text-center p-t-115" style="margin-top: 1em;">
                            <span class="txt1">
                                Don’t have an account?
                            </span>

                            <div class="container-login100-form-btn">
                                <div class="wrap-login100-form-btn">
                                    <div class="login100-form-bgbtn"></div>
                                    <button class="login100-form-btn" style="background: #e01035;" onclick="window.location='register.jsp'">
                                        Sign Up
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <p style="text-align: center;margin-top: 1em;">Or Sign up with</p>
                    <div class="d-flex justify-content-center">
                        <div class="g-signin2" data-onsuccess="onSignIn" style="margin-top: 1em;"></div>

                        <form style="display: none;" id="LoginByGoogle" method="POST" action="logByGoogle">
                            <input type="text" id="g_uName" name="g_uName" style="display: none;">
                            <input type="text" id="g_password" name="g_password" style="display: none;">
                            <input type="text" id="g_fName" name="g_fName" style="display: none;">
                            <input type="text" id="g_lName" name="g_lName" style="display: none;">
                            <input type="text" id="g_email" name="g_email" style="display: none;">
                            <input type="text" id="g_img" name="g_img" style="display: none;">
                            <button class="btn btn-info btn-block my-4" type="submit" style="display: none;">Login</button>
                        </form>
                    </div>


                </div>
            </div>

            <div class="d-flex justify-content-around " >

            </div>

        </div>


        <div class="modal fade" id="resetPassword" tabindex="-1" role="dialog" aria-labelledby="resetPassword"
             aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <form method="POST" action="resetPassword">
                        <div class="modal-header">
                            <h4 class="modal-title" id="exampleModalLabel"><b>Reset Password</b></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <b>Enter Your Email Address</b>
                            <input type="email" id="userEmailAddress" name="userEmailAddress" required style="width:100%;">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Reset Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                var imagurl = profile.getImageUrl();
                var fullname = profile.getName();
                var name = fullname.split(" ");
                var firstname = name[0];
                var lastname = name[1];
                var email = profile.getEmail();
                var id_token = googleUser.getAuthResponse().id_token;

                document.getElementById("g_uName").value = firstname;
                document.getElementById("g_password").value = id_token;
                document.getElementById("g_fName").value = firstname;
                document.getElementById("g_lName").value = lastname;
                document.getElementById("g_email").value = email;
                document.getElementById("g_img").value = imagurl;
                document.forms["LoginByGoogle"].submit();

            }
        </script>

        <jsp:include page="templates/jsIncludes.jsp" /> 

        <script src="js/loginform.js"></script>



    </body>
</html>
