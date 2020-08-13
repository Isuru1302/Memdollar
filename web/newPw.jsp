
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="templates/headerIncludes.jsp" /> 
        <link rel="stylesheet" type="text/css" href="css/loginCss.css">

    </head>
    <body style="background-image: url(images/background.jpg);">

        <div class="container h-100">
            <div class="row">
                <div class="login_form center">
                    <form class="text-center  p-5" method="POST" action="registerUser">
                        <p class="h4 mb-4">Enter the new password here</p>

                        <%
                            String userName = request.getParameter("un");
                            String token = request.getParameter("token");
                        %>
                        <input type="text" name="uname" value="<%= userName%>" style="display:none">
                        <input type="text" name="token" value="<%= token%>" style="display:none">

                        <div class="form-group row">
                            <div class="col-sm-12">
                                <input type="password" class="form-control" name="u_password1" id="u_password1" placeholder="New Password" required minlength="5">

                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-12">
                                <input type="password" class="form-control" name="u_password2" id="u_password2" placeholder="New Password(Again)" required minlength="5"
                                       onChange="isPasswordMatch();">
                            </div>
                        </div>
                        <span id="message"></span>

                        <button class="btn btn-info btn-block my-4" type="submit" id="changeBtn">Change</button>


                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="templates/jsIncludes.jsp" /> 

        <script>
            $('#changeBtn').prop('disabled', true);

            $('#u_password2').on('keyup', function () {
                var password = $("#u_password1").val();
                var confirmPassword = $("#u_password2").val();

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
