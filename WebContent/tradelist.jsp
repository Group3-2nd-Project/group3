<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	    
	<head>
	
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="codepixer">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
		</head>
		
	<jsp:include page="/common/top.jsp"></jsp:include>
<script>
var tradelist = <%=request.getAttribute("tradelist") %>
console.log(tradelist);

</script>

		<body>

			<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)"> 
			<!-- Start post Area -->
			<section class="post-area section-gap" style="padding-top:200px;">
				<div class="container">
					<div class="row justify-content-center d-flex">
						<div class="col-lg-8 post-list">
							<div class="single-post d-flex flex-row">
								<div class="thumb">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5GFFn1AmfCSMjFI3JTaaZNIWZb_A8lpmofkzWwTq_uw3U16u9&s" alt="">
								<!-- 	<ul class="tags">
										<li>
											<a href="#">Art</a>
										</li>
										<li>
											<a href="#">Media</a>
										</li>
										<li>
											<a href="#">Design</a>					
										</li>
									</ul> -->
								</div>
								<div class="details">
									<div class="title d-flex flex-row justify-content-between">
										<div class="titles">
											<a href="single.html"><h4>&nbsp;&nbsp;Creative Art Designer</h4></a>
											<h6>&nbsp;&nbsp;Premium Labels Limited</h6>					
										</div>
										<ul class="btns">
											<li><a href="#"><span class="lnr lnr-heart"></span></a></li>
											<li><a href = "tradeWrite.jsp?bcode=102&tcode=0" class="btn mini blue">글쓰기</a></li>
										</ul>
									</div>
									<p>
										&nbsp;&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit,<br> &nbsp;&nbsp;sed do eiusmod temporinc ididunt ut dolore magna aliqua.
									</p>
								<!-- 	<h5>&nbsp;&nbsp; Job Nature: Full time</h5>
									<p class="address">&nbsp;&nbsp;<span class="lnr lnr-map"></span>&nbsp;&nbsp;  56/8, Panthapath Dhanmondi Dhaka</p>
									<p class="address">&nbsp;&nbsp;<span class="lnr lnr-database"></span>&nbsp;&nbsp;  15k - 25k</p> -->
								</div>
							</div>
							<div class="single-post d-flex flex-row">
								<div class="thumb">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsX2EbCJIRVm1ztlZfPmC1KthtW_ZOng-0UEdZ20OfEPqWzfZS&s" alt="">
							<!-- 		<ul class="tags">
										<li>
											<a href="#">Art</a>
										</li>
										<li>
											<a href="#">Media</a>
										</li>
										<li>
											<a href="#">Design</a>					
										</li>
									</ul> -->
								</div>
								<div class="details">
									<div class="title d-flex flex-row justify-content-between">
										<div class="titles">
											<a href="single.html"><h4>&nbsp;&nbsp;Creative Art Designer</h4></a>
											<h6>&nbsp;&nbsp;Premium Labels Limited</h6>					
										</div>
										<ul class="btns">
											<li><a href="#"><span class="lnr lnr-heart"></span></a></li>
											<li><a href="#">글번호</a></li>
										</ul>
									</div>
									<p>
										&nbsp;&nbsp;&nbsp; Lorem ipsum dolor sit amet, consectetur adipisicing elit,<br>&nbsp;&nbsp; sed do eiusmod temporinc ididunt ut dolore magna aliqua.
									</p>
								<!-- 	<h5>&nbsp;&nbsp;Job Nature: Full time</h5>
									<p class="address">&nbsp;&nbsp;<span class="lnr lnr-map"></span> &nbsp;&nbsp;56/8, Panthapath Dhanmondi Dhaka</p>
									<p class="address">&nbsp;&nbsp;<span class="lnr lnr-database"></span> &nbsp;&nbsp;15k - 25k</p>
								 --></div>
							</div>
							<div class="single-post d-flex flex-row">
								<div class="thumb">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRik6LGuQoxYg64ZxqCICC6cDDKnuCZiEMif-EsHkm1pxdO-4ct0A&s" alt="">
								<!-- 	<ul class="tags">
										<li>
											<a href="#">Art</a>
										</li>
										<li>
											<a href="#">Media</a>
										</li>
										<li>
											<a href="#">Design</a>					
										</li>
									</ul> -->
								</div>
								<div class="details">
									<div class="title d-flex flex-row justify-content-between">
										<div class="titles">
											<a href="single.html"><h4>&nbsp;&nbsp;Creative Art Designer</h4></a>
											<h6>&nbsp;&nbsp;Premium Labels Limited</h6>					
										</div>
										<ul class="btns">
											<li><a href="#"><span class="lnr lnr-heart"></span></a></li>
											<li><a href="#">글번호</a></li>
										</ul>
									</div>
									<p>
										&nbsp;&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit,<br> &nbsp;&nbsp;sed do eiusmod temporinc ididunt ut dolore magna aliqua.
									</p>
								<!-- 	<h5>&nbsp;&nbsp;Job Nature: Full time</h5>
									<p class="address"><span class="lnr lnr-map"></span>&nbsp;&nbsp; 56/8, Panthapath Dhanmondi Dhaka</p>
									<p class="address"><span class="lnr lnr-database"></span>&nbsp;&nbsp; 15k - 25k</p>
								 --></div>
							</div>		
							<div class="single-post d-flex flex-row">
								<div class="thumb">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwQm8UoKPEGkQKjIFevsPHgcxyekJPgmQYURnrsCMZ37h3wKwV&s" alt="">
							<!-- 		<ul class="tags">
										<li>
											<a href="#">Art</a>
										</li>
										<li>
											<a href="#">Media</a>
										</li>
										<li>
											<a href="#">Design</a>					
										</li>
									</ul> -->
								</div>
								<div class="details">
									<div class="title d-flex flex-row justify-content-between">
										<div class="titles">
											<a href="single.html"><h4>&nbsp;&nbsp;Creative Art Designer</h4></a>
											<h6>&nbsp;&nbsp;Premium Labels Limited</h6>					
										</div>
										<ul class="btns">
											<li><a href="#"><span class="lnr lnr-heart"></span></a></li>
											<li><a href="#">글번호</a></li>
										</ul>
									</div>
									<p>
										&nbsp;&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, &nbsp;&nbsp;<br>sed do eiusmod temporinc ididunt ut dolore magna aliqua.
									</p>
								<!-- 	<h5>Job Nature: Full time</h5>
									<p class="address"><span class="lnr lnr-map"></span> &nbsp;&nbsp;56/8, Panthapath Dhanmondi Dhaka</p>
									<p class="address"><span class="lnr lnr-database"></span> &nbsp;&nbsp;15k - 25k</p>
								 --></div>
							</div>
							<div class="single-post d-flex flex-row">
								<div class="thumb">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs1GVbSxW55YngfIaCqk6-hm5PzI7fLu6TTjtl3wrhbI6-ef5e7w&s" alt="">
							<!-- 		<ul class="tags">
										<li>
											<a href="#">Art</a>
										</li>
										<li>
											<a href="#">Media</a>
										</li>
										<li>
											<a href="#">Design</a>					
										</li>
									</ul> -->
								</div>
								<div class="details">
									<div class="title d-flex flex-row justify-content-between">
										<div class="titles">
											<a href="single.html"><h4>&nbsp;&nbsp;Creative Art Designer</h4></a>
											<h6>&nbsp;&nbsp;Premium Labels Limited</h6>					
										</div>
										<ul class="btns">
											<li><a href="#"><span class="lnr lnr-heart"></span></a></li>
											<li><a href="#">글번호</a></li>
										</ul>
									</div>
									<p>
										&nbsp;&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit,&nbsp;&nbsp;<br> sed do eiusmod temporinc ididunt ut dolore magna aliqua.
									</p>
									<!-- <h5>&nbsp;&nbsp;Job Nature: Full time</h5>
									<p class="address"><span class="lnr lnr-map"></span> &nbsp;&nbsp;56/8, Panthapath Dhanmondi Dhaka</p>
									<p class="address"><span class="lnr lnr-database"></span> &nbsp;&nbsp;15k - 25k</p>
								 --></div>
							</div>
							<div class="single-post d-flex flex-row">
								<div class="thumb">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu3jc8Gz1gGOZZ554_fTGxni0pWJKzIEv2s5WytzEMggwCg13d&s" alt="">
							<!-- 		<ul class="tags">
										<li>
											<a href="#">Art</a>
										</li>
										<li>
											<a href="#">Media</a>
										</li>
										<li>
											<a href="#">Design</a>					
										</li>
									</ul> -->
								</div>
								<div class="details">
									<div class="title d-flex flex-row justify-content-between">
										<div class="titles">
											<a href="single.html"><h4>&nbsp;&nbsp;Creative Art Designer</h4></a>
											<h6>&nbsp;&nbsp;Premium Labels Limited</h6>					
										</div>
										<ul class="btns">
											<li><a href="#"><span class="lnr lnr-heart"></span></a></li>
											<li><a href="#">글번호</a></li>
										</ul>
									</div>
									<p>
										&nbsp;&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, &nbsp;&nbsp;<br>sed do eiusmod temporinc ididunt ut dolore magna aliqua.
									</p>
								<!-- 	<h5>&nbsp;&nbsp;Job Nature: Full time</h5>
									<p class="address"><span class="lnr lnr-map"></span>&nbsp;&nbsp; 56/8, Panthapath Dhanmondi Dhaka</p>
									<p class="address"><span class="lnr lnr-database"></span> &nbsp;&nbsp;15k - 25k</p>
								 --></div>
							</div>															
							<div class="single-post d-flex flex-row">
								<div class="thumb">
									<img style = "width:210px; height:210px;"src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3G2LryihGMjc4ce8Ar5wA-wEShMygTe_5eU12AiqIJ-BQX1h0&s" alt="">
									<!-- <ul class="tags">
										<li>
											<a href="#">Art</a>
										</li>
										<li>
											<a href="#">Media</a>
										</li>
										<li>
											<a href="#">Design</a>					
										</li>
									</ul> -->
								</div>
								<div class="details">
									<div class="title d-flex flex-row justify-content-between">
										<div class="titles">
											<a href="single.html"><h4>&nbsp;&nbsp;Creative Art Designer</h4></a>
											<h6>&nbsp;&nbsp;Premium Labels Limited</h6>					
										</div>
									   <ul class="btns">
											<li><a href="#"><span class="lnr lnr-heart"></span></a></li>
											<li><a href="#">글번호</a></li>
										</ul> 
									</div>
									<p>
										&nbsp;&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit,&nbsp;&nbsp;<br> sed do eiusmod temporinc ididunt ut dolore magna aliqua.
									</p>
								<!-- 	<h5>&nbsp;&nbsp;Job Nature: Full time</h5>
									<p class="address"><span class="lnr lnr-map"></span> &nbsp;&nbsp;56/8, Panthapath Dhanmondi Dhaka</p>
									<p class="address"><span class="lnr lnr-database"></span>&nbsp;&nbsp; 15k - 25k</p>
								 --></div>
							</div>	

						</div>
				
						<div class="col-lg-4 sidebar">
							<div class="single-slidebar">
								<h4>중고 거래 순위 리스트</h4>
								<ul class="cat-list">
									<li><a class="justify-content-between d-flex" href="category.html"><p>텐트</p><span>37</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>캠핑 의자</p><span>57</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>캠핑 침낭</p><span>33</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>바베큐 장비</p><span>36</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>등산 장비</p><span>47</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>캠핑 그릇</p><span>27</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>캠핑 라이트</p><span>17</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>등산 장비</p><span>47</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>캠핑 그릇</p><span>27</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>캠핑 라이트</p><span>17</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>캠핑 라이트</p><span>17</span></a></li>
								</ul>
							</div>

							<div class="single-slidebar">
								<h4>Top rated job posts</h4>
								<div class="active-relatedjob-carusel">
									<div class="single-rated">
										<img class="img-fluid" src="https://t1.daumcdn.net/cfile/tistory/991EC1495AB1EA9112" alt="">
										<a href="single.html"><h4>Creative Art Designer</h4></a>
										<h6>Premium Labels Limited</h6>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
										</p>
										<h5>Job Nature: Full time</h5>
										<p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
										<p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
										<a href="#" class="btns text-uppercase">Apply job</a>
									</div>
									<div class="single-rated">
										<img class="img-fluid" src="http://www.earlyadopter.co.kr/wp-content/uploads/2014/06/1.jpg" alt="">
										<a href="single.html"><h4>Creative Art Designer</h4></a>
										<h6>Premium Labels Limited</h6>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
										</p>
										<h5>Job Nature: Full time</h5>
										<p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
										<p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
										<a href="#" class="btns text-uppercase">Apply job</a>
									</div>
									<div class="single-rated">
										<img class="img-fluid" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile9.uf.tistory.com%2Fimage%2F251F9E40552F7C4A17A4C3" alt="">
										<a href="single.html"><h4>Creative Art Designer</h4></a>
										<h6>Premium Labels Limited</h6>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
										</p>
										<h5>Job Nature: Full time</h5>
										<p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
										<p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
										<a href="#" class="btns text-uppercase">Apply job</a>
									</div>																		
								</div>
							</div>							

		<!-- 					<div class="single-slidebar">
								<h4>중고 거래 리스트</h4>
								<ul class="cat-list">
									<li><a class="justify-content-between d-flex" href="category.html"><p>Technology</p><span>37</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>Media & News</p><span>57</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>Goverment</p><span>33</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>Medical</p><span>36</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>Restaurants</p><span>47</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>Developer</p><span>27</span></a></li>
									<li><a class="justify-content-between d-flex" href="category.html"><p>Accounting</p><span>17</span></a></li>
								</ul>
							</div>
 -->
							

						</div>
					</div>
				</div>	
			</section>

		
			<!-- End footer Area -->		

			<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="js/vendor/bootstrap.min.js"></script>			
		<!-- 	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
  			<script src="js/easing.min.js"></script>			
			<script src="js/hoverIntent.js"></script>
			<script src="js/superfish.min.js"></script>	
			<script src="js/jquery.ajaxchimp.min.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>	
			<script src="js/owl.carousel.min.js"></script>			
			<script src="js/jquery.sticky.js"></script>
			<script src="js/jquery.nice-select.min.js"></script>			
			<script src="js/parallax.min.js"></script>		
			<script src="js/mail-script.js"></script>	
			<script src="js/main.js"></script>	
		<jsp:include page="/common/bottom.jsp"></jsp:include>
		</body>
		
	</html>



