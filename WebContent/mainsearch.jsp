<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Camping Easy</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">

</head>
<style>
.feature-content {
    padding: 40px 30px;
}

.feature-content .feature-title h5 {
    font-size: 18px;
    font-weight: 800;
    text-transform: uppercase;
    margin-bottom: 0;
    -webkit-transition-duration: 500ms;
            transition-duration: 500ms;
}

.feature-content .feature-title p {
    font-size: 14px;
    margin-bottom: 0;
    -webkit-transition-duration: 500ms;
            transition-duration: 500ms;
}

.feature-content,
.feature-favourite > a {
    background-color: #6b8e23;
}
 #pp {
 background-color: #6b8e23;

}

</style>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="dorne-load"></div>
    </div>

    <!-- ***** Search Form Area ***** -->
    <div class="dorne-search-form d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-close-btn" id="closeBtn">
                        <i class="pe-7s-close-circle" aria-hidden="true"></i>
                    </div>
                    <form action="#" method="get">
                        <input type="search" name="caviarSearch" id="search" placeholder="Search Your Desire Destinations or Events">
                        <input type="submit" class="d-none" value="submit">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Header Area Start ***** -->
<jsp:include page="/common/top.jsp"></jsp:include>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Welcome Area Start ***** -->
     <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)"> 
    <section class="dorne-welcome-area bg-img">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-md-10">
                    <div class="hero-content">
                        <h2>CAMPING EASY</h2>
                        <h4>Enjoy Your Camp</h4>
                    </div>
                    <!-- Hero Search Form -->
                    <div class="hero-search-form">
                        <!-- Tabs -->
                        <div class="nav nav-tabs" id="heroTab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true" style ="background-color:#6b8e23;">Places</a>
                          <!--   <a class="nav-item nav-link" id="nav-events-tab" data-toggle="tab" href="#nav-events" role="tab" aria-controls="nav-events" aria-selected="false">Events</a> -->
                        </div>
                        <!-- Tabs Content -->
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab" style ="background-color:#ffefd5; opacity:0.7">
                                <h6 style ="color:#6b8e23;">캠핑장을 검색해서 찾아보세요</h6>
                                <form action="#" method="get">
                                    <select class="custom-select" style ="width: 200px;">
                                        <option selected>지역 선택</option>
                                        <option value="1">서울시</option>
                                        <option value="2">경기도</option>
                                        <option value="3">강원도</option>
                                        <option value="4">충정도</option>
                                        <option value="5">전라도</option>
                                        <option value="5">경상도</option>
                                    </select>
                                    <select class="custom-select" style ="width: 200px;">
                                        <option selected>시/군 선택</option>
                                        <option value="1">블라블라</option>
                                        <option value="2">블라블라2</option>
                                        <option value="3">블라블라3</option>
                                    </select>
                                    <input type= "text" name="camping" id="camping" style ="width:200px; height:52px;">
                                    <button type="submit" class="btn dorne-btn" style ="width: 200px; background-color:#6b8e23;"><i class="fa fa-search pr-2" aria-hidden="true"></i> Search</button>
                                </form>
                            </div>
                        <!--     <div class="tab-pane fade" id="nav-events" role="tabpanel" aria-labelledby="nav-events-tab">
                                <h6>What are you looking for?</h6>
                                <form action="#" method="get">
                                    <select class="custom-select">
                                       <option selected>지역 선택</option>
                                        <option value="1">서울시</option>
                                        <option value="2">경기도</option>
                                        <option value="3">강원도</option>
                                        <option value="4">충정도</option>
                                        <option value="5">전라도</option>
                                        <option value="5">경상도</option>
                                    </select>
                                    <select class="custom-select">
                                        <option selected>시/군 선택</option>
                                        <option value="1">Catagories 1</option>
                                        <option value="2">Catagories 2</option>
                                        <option value="3">Catagories 3</option>
                                    </select>
                                    <select class="custom-select">
                                        <option selected>Price Range</option>
                                        <option value="1">$100 - $499</option>
                                        <option value="2">$500 - $999</option>
                                        <option value="3">$1000 - $4999</option>
                                    </select>
                                    <button type="submit" class="btn dorne-btn"><i class="fa fa-search pr-2" aria-hidden="true"></i> Search</button>
                                </form>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Social Btn -->
        <div class="hero-social-btn">
            <div class="social-title d-flex align-items-center">
                <h6>Follow us on Social Media</h6>
                <span></span>
            </div>
            <div class="social-btns">
                <a href="#"><i class="fa fa-linkedin" aria-haspopup="true"></i></a>
                <a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-haspopup="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-haspopup="true"></i></a>
            </div>
        </div>
    </section>
    <!-- ***** Welcome Area End ***** -->

    

    <!-- ****** Footer Area Start ****** -->
    <jsp:include page="/common/bottom.jsp"></jsp:include>
    <!-- ****** Footer Area End ****** -->
</body>

</html>