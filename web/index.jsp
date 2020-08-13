<%@page import="model.*"%>
<%@page import="java.sql.ResultSet"%>
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


        <!--Main Slide-->
        <section class="main-slide">
            <div class="main-slides owl-carousel owl-theme">

                <!-- Single Hero Slide -->
                <div class="single-main-slide bg-img" style="background-image: url(images/bg-1.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="main-slides-content" style="margin-left: 3em;">
                                    <h4 data-animation="fadeInUp" data-delay="100ms" style="color:#000;"><b><i>Challenge your self</i></b></h4>
                                    <h2 data-animation="fadeInUp" data-delay="400ms" style="color:#000;">Welcome to  <br>MemDollar.Com</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Hero Slide -->
                <div class="single-main-slide bg-img" style="background-image: url(images/bg-2.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="main-slides-content" style="margin-left: 3em;">
                                    <h4 data-animation="fadeInUp" data-delay="100ms"><b><i>Challenge your self</i></b></h4>
                                    <h2 data-animation="fadeInUp" data-delay="400ms">Welcome to  <br>MemDollar.Com</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Main Slide End-->

        <!--Top Features -->
        <div class="top-features-area wow fadeInUp" data-wow-delay="150ms" >
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="features-content">
                            <div class="row no-gutters">

                                <div class="col-12 col-md-4">
                                    <div class="single-top-features d-flex align-items-center justify-content-center">
                                        <i class="fa fa-question-circle-o"></i>
                                        <h5>Ask a Question</h5>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4">
                                    <div class="single-top-features d-flex align-items-center justify-content-center">
                                        <i class="fa fa-pencil-square-o"></i>
                                        <h5>Answer</h5>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4">
                                    <div class="single-top-features d-flex align-items-center justify-content-center">
                                        <i class="fa fa-star-o"></i>
                                        <h5>Gift prizes and compliments</h5>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Top Features End-->

        <!--Courses Area -->
        <div class="courses-area section-padding-100-0">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="course-area d-flex align-items-center mb-100 wow fadeInUp" data-wow-delay="300ms">
                            <div class="course-icon">
                                <i class="fa fa-address-card"></i>
                            </div>
                            <div class="course-content">
                                <h4>Business School</h4>
                                <p>Enrol And Receive Free German Language Support And Free Executive Education Course. </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="course-area d-flex align-items-center mb-100 wow fadeInUp" data-wow-delay="300ms">
                            <div class="course-icon">
                                <i class="fa fa-globe"></i>
                            </div>
                            <div class="course-content">
                                <h4>Marketing</h4>
                                <p>Marketing refers to activities undertaken by a company to promote the buying or selling of a product or service. </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="course-area d-flex align-items-center mb-100 wow fadeInUp" data-wow-delay="500ms">
                            <div class="course-icon">
                                <i class="fa fa-image"></i>
                            </div>
                            <div class="course-content">
                                <h4>Photography</h4>
                                <p>Photography is the art, application and practice of creating durable images.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="course-area d-flex align-items-center mb-100 wow fadeInUp" data-wow-delay="600ms">
                            <div class="course-icon">
                                <i class="fa fa-thumbs-up"></i>
                            </div>
                            <div class="course-content">
                                <h4>Social Media</h4>
                                <p>Social media are interactive computer-mediated technologies.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="course-area d-flex align-items-center mb-100 wow fadeInUp" data-wow-delay="700ms">
                            <div class="course-icon">
                                <i class="fa fa-wrench"></i>
                            </div>
                            <div class="course-content">
                                <h4>Development</h4>
                                <p>The process of developing or being developed.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="course-area d-flex align-items-center mb-100 wow fadeInUp" data-wow-delay="800ms">
                            <div class="course-icon">
                                <i class="fa fa-code"></i>
                            </div>
                            <div class="course-content">
                                <h4>Design</h4>
                                <p>A design is a plan or specification for the construction.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Courses Area End -->

        <!-- Testimonials -->
        <div class="testimonials-area section-padding-100 bg-img bg-overlay" style="background-image: url(images/bg-2.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading text-center mx-auto white wow fadeInUp" data-wow-delay="300ms">
                            <span>our testimonials</span>
                            <h3>See what our satisfied customers are saying about us</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Single Testimonials Area -->
                    <div class="col-12 col-md-6">
                        <div class="single-testimonial-area mb-100 d-flex wow fadeInUp" data-wow-delay="400ms">
                            <div class="testimonial-thumb">
                                <img src="images/t1.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <h5>Great teachers</h5>
                                <p>Parenting » Education trends, Find a school skills » What makes a great teacher? ... Study after study shows the single most important factor determining the quality of the education a child receives is the quality of his teacher. ... They expect that all students can and will achieve.</p>
                                <h6><span>Maria Smith,</span> Student</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Single Testimonials Area -->
                    <div class="col-12 col-md-6">
                        <div class="single-testimonial-area mb-100 d-flex wow fadeInUp" data-wow-delay="500ms">
                            <div class="testimonial-thumb">
                                <img src="images/t2.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <h5>Easy and user friendly courses</h5>
                                <p>Tips Towards Α User-Friendly eLearning Course. Provide Detailed Instructions. Keep Text Short And Succinct. Test Out Your eLearning Course Navigation. Opt For Brief Bursts Of Information. Include Optional Tips And Tricks. Create An Effective eLearning Course Menu. Integrate Supplemental Links.</p>
                                <h6><span>Shawn Gaines,</span> Student</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Single Testimonials Area -->
                    <div class="col-12 col-md-6">
                        <div class="single-testimonial-area mb-100 d-flex wow fadeInUp" data-wow-delay="600ms">
                            <div class="testimonial-thumb">
                                <img src="images/t3.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <h5>I just love the courses here</h5>
                                <p>Udemy is an online learning and teaching marketplace with over 100000 courses and 24 million students. Learn ... My goal is to become a freelance web developer, and thanks to Udemy, I'm really close. Borivoje ... Teach what you love.</p>
                                <h6><span>Ross Cooper,</span> Student</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Single Testimonials Area -->
                    <div class="col-12 col-md-6">
                        <div class="single-testimonial-area mb-100 d-flex wow fadeInUp" data-wow-delay="700ms">
                            <div class="testimonial-thumb">
                                <img src="images/t4.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <h5>One good academy</h5>
                                <p>I felt I made good progress, the teachers are great and I really enjoyed the variety.' Jakob Germany ... I will strongly recommend your school to all my friends.</p>
                                <h6><span>James Williams,</span> Student</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="load-more-btn text-center wow fadeInUp" data-wow-delay="800ms">
                            <a href="#" class="btn page-btn see-more">See More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonials End -->

        <!-- Top Popular Courses -->
        <div class="popular-courses-area section-padding-100">
            <div class="container">
                <div class="row">
                    <div class="section-heading text-center mx-auto wow fadeInUp" data-wow-delay="300ms">
                        <span>The Best</span>
                        <h3>Top Popular Courses</h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-6">
                        <div class="popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="400ms">

                            <div class="popular-course-content">
                                <h5>Business for begginers</h5>
                                <span>By Simon Smith   |  March 18, 2018</span>
                                <div class="course-ratings">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <p>Web development is the work involved in developing a web site for the Internet or an intranet.</p>
                                <a href="#" class="btn page-btn btn-sm">See More</a>

                            </div>
                            <div class="popular-course-thumb bg-img" style="background-image: url(images/bg-2.jpg);">
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-6">
                        <div class="popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="400ms">

                            <div class="popular-course-content">
                                <h5>Business for begginers</h5>
                                <span>By Simon Smith   |  March 18, 2018</span>
                                <div class="course-ratings">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <p>Web development is the work involved in developing a web site for the Internet or an intranet.</p>
                                <a href="#" class="btn page-btn btn-sm">See More</a>

                            </div>
                            <div class="popular-course-thumb bg-img" style="background-image: url(images/pc-2.jpg);">
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-6">
                        <div class="popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="400ms">

                            <div class="popular-course-content">
                                <h5>Business for begginers</h5>
                                <span>By Simon Smith   |  March 18, 2018</span>
                                <div class="course-ratings">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <p>Web development is the work involved in developing a web site for the Internet or an intranet.</p>
                                <a href="#" class="btn page-btn btn-sm">See More</a>

                            </div>
                            <div class="popular-course-thumb bg-img" style="background-image: url(images/pc-3.jpg);">
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-6">
                        <div class="popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="400ms">

                            <div class="popular-course-content">
                                <h5>Business for begginers</h5>
                                <span>By Simon Smith   |  March 18, 2018</span>
                                <div class="course-ratings">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <p>Web development is the work involved in developing a web site for the Internet or an intranet.</p>
                                <a href="#" class="btn page-btn btn-sm">See More</a>

                            </div>
                            <div class="popular-course-thumb bg-img" style="background-image: url(images/pc-4.jpg);">
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- Top Popular Courses End -->	

        <!-- Partners -->
        <div class="partner-area section-padding-0-100 ">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="partners-logo d-flex align-items-center justify-content-between flex-wrap">
                            <a href="#"><img src="images/partner-1.png" class="img-fluid" alt=""></a>
                            <a href="#"><img src="images/partner-2.png" class="img-fluid" alt=""></a>
                            <a href="#"><img src="images/partner-3.png" class="img-fluid" alt=""></a>
                            <a href="#"><img src="images/partner-4.png" class="img-fluid" alt=""></a>
                            <a href="#"><img src="images/partner-5.png" class="img-fluid" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Partners End -->

        <!-- Invite Friends -->
        <div class="invite-friends">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="invite-friends-content d-flex align-items-center justify-content-between flex-wrap">
                            <h3>Invite Your Friends To Follow This Page!</h3>
                            <button type="button" class="btn invite-btn page-btn" data-toggle="modal" data-target="#invite_friend">Invite</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Invite Friends End -->

        <!-- Web Details -->
        <jsp:include page="templates/webDetails.jsp" /> 
        <!-- Web Details End -->

        <!-- Modal -->
        <div class="modal fade" id="invite_friend" tabindex="-1" role="dialog" aria-labelledby="inviteFriends"
             aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <form method="POST" action="inviteFriends">
                        <div class="modal-header">
                            <h4 class="modal-title" id="exampleModalLabel"><b>Invite Friends</b></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <b>Friend's Email Address</b>

                            <%
                                HttpSession se = request.getSession();
                                String loggedUser;
                                if (se.getAttribute("user_Status") != null) {
                                    loggedUser = (String) se.getAttribute("u_FirstName");
                                } else {
                                    loggedUser = "QuiZ-Master";
                                }
                            %>

                            <input type="text" id="user_name" name="user_name" value="<%= loggedUser%>" required style="display: none;">
                            <input type="email" id="friendEmail" name="friendEmail" required style="width:100%;">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Invite</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Footer-->
        <jsp:include page="templates/footer.jsp" /> 
        <!--Footer End-->


        <jsp:include page="templates/jsIncludes.jsp" /> 

        <script>
            (function ($) {
            'use strict';
                    var browserWindow = $(window);
                    // :: 3.0 Sliders Active Code
                    if ($.fn.owlCarousel) {
            var welcomeSlide = $('.main-slides');
                    var aboutSlide = $('.about-slides');
                    welcomeSlide.owlCarousel({
                    items: 1,
                            margin: 0,
                            loop: true,
                            nav: true,
                            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
                            dots: true,
                            autoplay: true,
                            autoplayTimeout: 7000,
                            smartSpeed: 2000
                    });
                    welcomeSlide.on('translate.owl.carousel', function () {
                    var slideLayer = $("[data-animation]");
                            slideLayer.each(function () {
                            var anim_name = $(this).data('animation');
                                    $(this).removeClass('animated ' + anim_name).css('opacity', '0');
                            });
                    });
                    welcomeSlide.on('translated.owl.carousel', function () {
                    var slideLayer = welcomeSlide.find('.owl-item.active').find("[data-animation]");
                            slideLayer.each(function () {
                            var anim_name = $(this).data('animation');
                                    $(this).addClass('animated ' + anim_name).css('opacity', '1');
                            });
                    });
                    $("[data-delay]").each(function () {
            var anim_del = $(this).data('delay');
                    $(this).css('animation-delay', anim_del);
            });
                    $("[data-duration]").each(function () {
            var anim_dur = $(this).data('duration');
                    $(this).css('animation-duration', anim_dur);
            });
                    aboutSlide.owlCarousel({
                    items: 1,
                            margin: 0,
                            loop: true,
                            nav: true,
                            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
                            dots: true,
                            autoplay: true,
                            autoplayTimeout: 7000,
                            smartSpeed: 2000
                    });
            }
            })(jQuery);
        </script>
    </body>
</html>

