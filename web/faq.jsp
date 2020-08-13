<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="templates/headerIncludes.jsp" /> 
    </head>
    <body>

        <!-- Preloader -->
        <div id="preloader">
            <i class="circle-preloader"></i>
        </div>
        <!-- Preloader End -->


        <!--Header -->
        <header class="header-area">
            <jsp:include page="templates/topheader.jsp" />
        </header>
        <!--Header End-->

        <!--Top Image-->
        <div class="topimage bg-img" style="background-image: url(images/topimage.jpg);">
            <div class="topimageContent">
                <h2>FAQ</h2>
            </div>
        </div>
        <!--Top Image end-->

        <!-- Contact Area Start -->
        <section class="FAQ-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="contact-content">
                            <div class="row">
                                <!-- Contact Information -->
                                <div class="col-12 col-lg-12">
                                    <div class="contact-information wow fadeInUp" data-wow-delay="400ms">
                                        <div class="section-heading text-left">
                                            <h3>Frequently Asked Questions</h3>
                                        </div>

                                        <div id="accordion">
                                            <div class="card">
                                                <div class="card-header">
                                                    <a class="card-link" data-toggle="collapse" href="#collapseOne">
                                                        Question 1 
                                                        <span class="card-plus">
                                                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                                <div id="collapseOne" class="collapse" data-parent="#accordion">
                                                    <div class="card-body">
                                                        Answer 1
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card">
                                                <div class="card-header">
                                                    <a class="card-link" data-toggle="collapse" href="#collapseTwo">
                                                        Question 2
                                                        <span class="card-plus">
                                                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                                <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                                    <div class="card-body">
                                                        Answer 2
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card">
                                                <div class="card-header">
                                                    <a class="card-link" data-toggle="collapse" href="#collapseThree">
                                                        Question 3
                                                        <span class="card-plus">
                                                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                                <div id="collapseThree" class="collapse" data-parent="#accordion">
                                                    <div class="card-body">
                                                        Answer 3
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card">
                                                <div class="card-header">
                                                    <a class="card-link" data-toggle="collapse" href="#collapseFour">
                                                        Question 4
                                                        <span class="card-plus">
                                                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                                <div id="collapseFour" class="collapse" data-parent="#accordion">
                                                    <div class="card-body">
                                                        Answer 4
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card">
                                                <div class="card-header">
                                                    <a class="card-link" data-toggle="collapse" href="#collapseFive">
                                                        Question 5
                                                        <span class="card-plus">
                                                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                                <div id="collapseFive" class="collapse" data-parent="#accordion">
                                                    <div class="card-body">
                                                        Answer 5
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact Area End -->

        <!-- Web Details -->
        <jsp:include page="templates/webDetails.jsp" /> 
        <!-- Web Details End -->

        <!--Footer-->
        <jsp:include page="templates/footer.jsp" /> 
        <!--Footer End-->


        <jsp:include page="templates/jsIncludes.jsp" /> 

    </body>
</html>
