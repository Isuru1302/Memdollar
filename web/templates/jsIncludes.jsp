<%
    String URL = request.getRequestURL().toString();
    String path;
    if (URL.contains("Profile/") || URL.contains("Admin/")) {
        path = "../";
    } else {
        path = "";
    }
%>

<!-- jQuery-2.2.4 js -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Popper js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script src="js/sweetalearts.js"></script>
<!-- All Plugins js -->
<script src="<%=path%>js/plugins.js"></script>
<!-- Active js -->
<script src="<%=path%>js/active.js"></script>

<!-- Owl Carousel Js -->
<script src="<%=path%>js/owl.carousel.js"></script>
<script src="<%=path%>js/sweetalearts.js"></script>

<script src="<%=path%>js/onLoad.js"></script>

<script src='//cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js'></script>
<script src="//cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>