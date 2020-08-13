$(document).ready(function () {
    if (window.location.href.indexOf("login=fail") > -1) {
        swal({title: "Login Failed!!",
            text: "Check your username and password again",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "login.jsp";
        });
    } else if (window.location.href.indexOf("invitation=success") > -1) {
        swal({title: "Invitation Sent successfully!!",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "index.jsp";
        });
    } else if (window.location.href.indexOf("invitation=fail") > -1) {
        swal({title: "Invitation Sent fail!!",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "index.jsp";
        });
    } else if (window.location.href.indexOf("newcourse=success") > -1) {
        swal({title: "New Course Add successfully!!",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "courses.jsp";
        });
    } else if (window.location.href.indexOf("newcourse=fail") > -1) {
        swal({title: "New Course Add Failed!!",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "courses.jsp";
        });
    } else if (window.location.href.indexOf("register=success") > -1) {
        swal({title: "Registration Success!!",
            text: "Please verify your email before login.",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "index.jsp";
        });
    } else if (window.location.href.indexOf("register=fail") > -1) {
        swal({title: "Registration Failed!!",
            text: "Your Email Or Username is already in use!! Try another username.",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "register.jsp";
        });
    } else if (window.location.href.indexOf("reset=success") > -1) {
        swal({title: "Reset email sent to your email!!",
            text: "Please check your email.",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "login.jsp";
        });
    } else if (window.location.href.indexOf("reset=fail") > -1) {
        swal({title: "Please check your email!!",
            text: "There is no account to this email.",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "login.jsp";
        });
    } else if (window.location.href.indexOf("pwreset=success") > -1) {
        swal({title: "Password Changed successfully",
            text: "User your new password for login",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "login.jsp";
        });
    } else if (window.location.href.indexOf("pwreset=fail") > -1) {
        swal({title: "Password Changing failed",
            text: "Try again",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "login.jsp";
        });
    } else if (window.location.href.indexOf("edit=success") > -1) {
        swal({title: "Changes updated successfully",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "edit.jsp";
        });
    } else if (window.location.href.indexOf("edit=fail") > -1) {
        swal({title: "Changes updating failed",
            text: "Try again",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "edit.jsp";
        });
    } else if (window.location.href.indexOf("authentication=fail") > -1) {
        swal({title: "Authentication failed",
            text: "Try again",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"});
    } else if (window.location.href.indexOf("message=success") > -1) {
        swal({title: "Message sent successfully!!",
            text: "We got your message. We will contact you soon.",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"});
    } else if (window.location.href.indexOf("message=fail") > -1) {
        swal({title: "Message sending failed",
            text: "Try again!!",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"});
    } else if (window.location.href.indexOf("status=success") > -1) {
        swal({title: "Your question added successfully!!",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "askQuestion.jsp";
        });
    } else if (window.location.href.indexOf("status=fail") > -1) {
        swal({title: "Question adding failed",
            text: "Try again!!",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "askQuestion.jsp";
        });

    } else if (window.location.href.indexOf("report=success") > -1) {
        swal({title: "Your Report added successfully!!",
            text: "We will contact you soon",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "../Profile/";
        });

    } else if (window.location.href.indexOf("report=fail") > -1) {
        swal({title: "Report adding failed",
            text: "Try again!!",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "../Profile/";
        });

    } else if (window.location.href.indexOf("answer=success") > -1) {
        swal({title: "Your answer submitted successfully!!",
            type: "success",
            icon: "success",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "../Profile/";
        });

    } else if (window.location.href.indexOf("answer=fail") > -1) {
        swal({title: "Answer submitting failed",
            text: "Try again!!",
            type: "warning",
            icon: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            closeOnConfirm: false,
            confirmButtonText: "OK!"}).then(function () {
            window.location = "../Profile/";
        });

    }
});