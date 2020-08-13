
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
                    <form class="login100-form validate-form" method="POST" action="resetPassword2" id="loginForm">
                        <span class="login100-form-title p-b-26">
                            Welcome to memdollar.com
                        </span>
                        
                        <input class="input100" type="text" name="token" id="token" value="<%= request.getParameter("token") %>" style="display: none;">
                        
                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <span class="btn-show-pass">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </span>
                            <input class="input100" type="password" name="uPassword1" id="uPassword1" placeholder="New Password" required>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <span class="btn-show-pass">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </span>
                            <input class="input100" type="password" name="uPassword2" id="uPassword2" placeholder="New Password Again" required>
                        </div>
                        <span id="message"></span>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" id="changeBtn">
                                    Reset Password
                                </button>
                            </div>
                        </div>


                    </form>


                </div>
            </div>
        </div>

        <jsp:include page="templates/jsIncludes.jsp" /> 


        <script src="js/loginform.js"></script>

        <script>
            $('#changeBtn').prop('disabled', true);

            $('#uPassword2').on('keyup', function () {
                var password = $("#uPassword1").val();
                var confirmPassword = $("#uPassword2").val();

                if (password != confirmPassword) {
                    $("#message").html("Passwords are not matching!").css('color', 'red');
                    $('#changeBtn').prop('disabled', true);
                } else {
                    $("#message").html("Passwords are matching!").css('color', 'green');
                    $('#changeBtn').prop('disabled', false);
                }
            });
        </script>

    </body>
</html>
