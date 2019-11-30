<%@page import="kr.or.bit.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">

<!-- fontAwesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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

<!-- jquery 추가함 iy -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 

</head>

<jsp:include page="/common/top.jsp"></jsp:include>



<body>




	<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)">
		<!-- Start post Area -->



		<section class="post-area section-gap" style="padding-top: 10px;">

			<div class="section-heading text-center animated fadeInDown">
				<h2 class="h-bold">
					<i class="fas fa-campground"></i>&nbsp;&nbsp;Board Detail
				</h2>
			</div>

			<div style="text-align: center;">
				<a href="ShowReviewWrite.do?bcode=202&tcode=0" class="btn mini blue">

				</a>

				<c:set var="detail" value='${requestScope.boarddetail}'></c:set>
				
<script type="text/javascript">

//console.log('${detail.id}');


$(function(){
	//var temp = "ReviewEdit.do?bcode=202&tcode=0&cp=${requestScope.cp}&ps=${requestScope.ps}&idx=${requestScope.idx}";
	//var temp2 = "ReviewDelete.do?bcode=202&tcode=0&cp=${requestScope.cp}&ps=${requestScope.ps}&idx=${requestScope.idx}";
	//console.log(temp +"/" + temp2)
	if('${detail.id}' != '${sessionScope.id}') {
		if('${sessionScope.grade}'==2){
			return;
		}
		$('#editbtn').remove();
		$('#deletebtn').remove();

	}
if('${sessionScope.id}'==''){
	$('#replyButton').hide();

if('${sessionScope.grade}'  == '2' && '${detail.bcode}' == '401'){
		
		
		
			$('#replyButton').show();
		}else{
			$('#replyButton').hide();
		}
}	
});
</script>

				<section class="blog-posts-area section-gap">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 post-list blog-post-list">

								<div class="single-post">
									<div style="text-align: left">
									
									
										<button type="button" class="btn" value="List" style="margin: 2px" onclick="location.href='boardList.do?bcode=${detail.bcode }&tcode=0&cp=${detail.cp }&ps=${detail.ps}&zcode=0'">
											<i class="fas fa-undo-alt"></i>&nbsp;&nbsp;List
										</button>
										<button type="button" id="editbtn" class="btn" value="Edit" style="margin: 2px" onclick="location.href='boardDetail.do?bcode=${detail.bcode }&tcode=0&cp=${detail.cp}&ps=${detail.ps}&idx=${detail.idx}&edit=1&id=${sessionScope.id}&zcode=0'">
											<i class="far fa-edit"></i>&nbsp;&nbsp;Edit
										</button>
										<button type="button" id="deletebtn" class="btn" value="List" style="margin: 2px" onclick="location.href='boardDelete.do?bcode=${detail.bcode }&tcode=0&idx=${detail.idx }&cp=${detail.cp}&ps=${detail.ps}&zcode=0&id=${sessionScope.id}'">
											<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;Delete
										</button> 
									
										
									
									</div>
									<ul class="tags">

										<li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;아이디 |
											${detail.id}&nbsp;&nbsp;</li>
										<li>작성일 | ${detail.writedate}&nbsp;&nbsp;</li>
										<li>조회수 | ${detail.readnum}&nbsp;&nbsp;</li>
									</ul>

									<hr>
									<h1>
										<!-- 제목부분 -->
										${detail.title}
									</h1>
									



									<div class="content-wrap">
										<br>
										<p>
											<!-- 글내용 -->
											${detail.content}
										</p>
									</div>
									<div class="content-wrap">
									<form id="reply" action="gotoWrite.do" method="get" target="_blank">
                        <input type="hidden" name='idx' value='${detail.idx }' />
                        <input type="hidden" id = "myBcode" name="bcode" value='${detail.bcode}'>
                        <input type="hidden" name="tcode" value='${detail.tcode}'>
                        <input type="hidden" name="cp" value='${detail.cp}'>
                        <input type="hidden" name="ps" value='${detail.ps}'>
                        <input type="hidden" name="zcode" value='0'>
                       
        				 <button id="replyButton" type=submit  class="btn dorne-btn" style="width: 200px;"  >
                                 <i class="far fa-check-circle"></i>&nbsp;&nbsp;답글쓰기
                              </button>
      					</form>
									</div>


								
								</div>
							</div>

						</div>
					</div>
				</section>

			</div>
		</section>


		<!-- End footer Area -->

		<!-- 		<script src="js/vendor/jquery-2.2.4.min.js"></script> -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script src="js/vendor/bootstrap.min.js"></script>
		<!--    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
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


