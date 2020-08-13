<%
    String URL = request.getRequestURL().toString();
    String path;
    if (URL.contains("Profile/") || URL.contains("Admin/")) {
        path = "../";
    } else {
        path = "";
    }
%>

<title>MemDollar</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>css/style.css">
<link rel="stylesheet" type="text/css" href="<%=path%>css/classy-nav.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>css/animate.css">
<link rel="stylesheet" type="text/css" href="<%=path%>css/custom-icon.css">
<link rel="stylesheet" type="text/css" href="<%=path%>css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=path%>css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=path%>css/owl.theme.default.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="<%=path%>/js/onLoad.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<meta name="google-signin-client_id" content="349499008524-7rqm7sccghre2mnsndpkvu17vicmvtvg.apps.googleusercontent.com">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="<%=path%>/js/Script.js"></script>

<link rel="icon" type="image/png" href="<%=path%>images/favicon.png" />




