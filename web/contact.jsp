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
                <h2>Contact</h2>
            </div>
        </div>
        <!--Top Image end-->

        <!-- Contact Area Start -->
        <section class="contact-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="contact-content">
                            <div class="row">
                                <!-- Contact Information -->
                                <div class="col-12 col-lg-5">
                                    <div class="contact-information wow fadeInUp" data-wow-delay="400ms">
                                        <div class="section-heading text-left">
                                            <span>The Best</span>
                                            <h3>Contact Us</h3>
                                            <p class="mt-30">Lacinia, lacinia la cus non, fermen tum nisi. Donec et sollicitudin. Morbi vel arcu gravida, iaculis lacus vel, posuere ipsum. Sed faucibus mauris vitae urna consectetur, sit amet maximus nisl sagittis. Ut in iaculis enim, et pulvinar mauris.</p>
                                        </div>

                                        <!-- Contact Social Info -->
                                        <div class="contact-social-info d-flex mb-30">
                                            <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                        </div>

                                        <!-- Single Contact Info -->
                                        <div class="single-contact-info d-flex">
                                            <div class="contact-icon mr-15">
                                                <i class="icon-placeholder"></i>
                                            </div>
                                            <p>4127/ 5B-C Mislane Road,<br> Gibraltar, UK</p>
                                        </div>

                                        <!-- Single Contact Info -->
                                        <div class="single-contact-info d-flex">
                                            <div class="contact-icon mr-15">
                                                <i class="icon-telephone-1"></i>
                                            </div>
                                            <p>Main: 203-808-8613 <br> Office: 203-808-8648</p>
                                        </div>

                                        <!-- Single Contact Info -->
                                        <div class="single-contact-info d-flex">
                                            <div class="contact-icon mr-15">
                                                <i class="icon-contract"></i>
                                            </div>
                                            <p>memdollar@gmail.com</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Contact Form Area -->
                                <div class="col-12 col-lg-7">
                                    <div class="contact-form-area wow fadeInUp" data-wow-delay="500ms">
                                        <form action="userMessage" method="post">
                                            <input type="text" class="form-control" name="userMessage" id="name" placeholder="Name">
                                            <input type="email" class="form-control" name="email" id="email" placeholder="E-mail">
                                            <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                            <button class="btn page-btn mt-30" type="submit">Contact Us</button>
                                        </form>
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
