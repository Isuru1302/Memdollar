
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="templates/headerIncludes.jsp" /> 
        <link rel="stylesheet" type="text/css" href="css/loginCss.css">

    </head>
    <body style="background-image: url(images/background.jpg);">

        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form" method="POST" action="newMember">
                    <span class="login100-form-title p-b-26">
                        Welcome to memdollar.com
                    </span>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" id="userFirst" name="userFirst" placeholder="First Name" required minlength="3">
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" id="userLast" name="userLast" placeholder="Last Name" required minlength="3">
                    </div>

                    <div class="wrap-input100 validate-input" style="color:#999999;padding-left: 4px;">
                        <lable>Gender</lable>
                        <fieldset id="uGender" name="uGender" style="float: right;" >
                            Male:
                            <input type="radio" value="1" name="uGender">&nbsp;&nbsp;&nbsp;
                            Female:
                            <input type="radio" value="2" name="uGender">
                        </fieldset>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" id="cNumber" name="cNumber" placeholder="Contact Number" onkeypress="allowNumbersOnly(event)" required maxlength="10">
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="uDOB" id="date" placeholder="Birthday" onfocus="(this.type = 'date')" onblur="(this.type = 'text')" id="date" required>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" id="username" name="username" placeholder="Username" required minlength="5">
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="email" name="uEmail" id="uEmail" placeholder="Email" required>
                    </div>

                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn">
                                Sign Up
                            </button>
                        </div>
                    </div>

                    <div class="text-center p-t-115" style="margin-top: 1em;">
                        <span class="txt1">
                            Already member?
                        </span>

                        <a class="txt2" href="login.jsp">
                            Sign In
                        </a>
                    </div>
                </form>

            </div>
        </div>



        <jsp:include page="templates/jsIncludes.jsp" /> 

    </body>
</html>
