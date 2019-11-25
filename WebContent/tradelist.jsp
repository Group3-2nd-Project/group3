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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>

	$(document).ready(function() {
	    $('.modal').show();
	});

	

</script>
</head>

<jsp:include page="/common/top.jsp"></jsp:include>
<body>
   <%
      /*     
           String ps = request.getParameter("ps"); //pagesize
         String cp = request.getParameter("cp");    //current page
        
        
           if(ps == null || ps.trim().equals("")){
            //default 값 설정
            ps = "5";
         }
         if(cp == null || cp.trim().equals("")){
            //default 값 설정
            cp = "1";
         }
         
         int pagesize = Integer.parseInt(ps);
         int cpage = Integer.parseInt(cp);
         int pagecount = 0;
         
         if(totalboardcount % pagesize == 0){  // 전체게시물 % 한목록에 보이는 게시물을 나눴을때 딱떨어지면 그게 페이지 수 . 
            pagecount = totalboardcount / pagesize;
         }else{  // 전체게시물 % 한목록에 보이는 게시물을 나눴을때 딱떨어지면 그게 페이지 수 +1  = 나머지도 페이지로 처리해줘야하니까 
            pagecount = (totalboardcount / pagesize) +1;
         } */
   %>



   <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)">
      <!-- Start post Area -->



      <section class="post-area section-gap" style="padding-top: 200px;">

         <div class="section-heading text-center animated fadeInDown">
            <h2 class="h-bold">
               <i class="far fa-list-alt"></i>&nbsp;&nbsp; Trade List
            </h2>
         </div>

         <div style="text-align: center;">
            
            <button type="submit" id="reviewbtn" class="btn dorne-btn" style="width: 200px;" onclick="check()">
            <a href = "tradeWrite.jsp?bcode=102&tcode=0" class="btn mini black">Write</a></button>
            

            <c:forEach var="list" items="${requestScope.boardfile}" varStatus="status">
               <div class="container">

                  <div class="row justify-content-center d-flex"></div>
                  <div class="col-lg-12 post-list">

                     <br>

                     <div class="single-post d-flex flex-row">
                        <div class="thumb">
                        
                        <img src="upload/${list.savename}" alt="후기사진입니다." style="width: 400px">
                        </div>
                        <div class="details">
                           <div class="title d-flex flex-row justify-content-between">
                              <div class="titles"><!-- 제목 -->
                              <br>
                                 <a href="single.html"><h4>&nbsp;&nbsp; ${list.title}</h4></a> 
                              </div>

                           </div>
                           <p style="text-align: left"> <!-- 글내용 -->
                              &nbsp;&nbsp;&nbsp;&nbsp; ${list.content}  
                           </p>
                           <p class="address">
                              &nbsp;&nbsp;&nbsp;<i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;
                                                         장소를 여기에 적을거예요.
                           </p>
                           <p class="address" style="text-align: left">
                              &nbsp;&nbsp;&nbsp;<i class="fas fa-user"></i>&nbsp;&nbsp;
                              ${list.id}
                           </p>
                           <p class="address" style="text-align: left"><!-- 작성일 -->
                              &nbsp;&nbsp;&nbsp;<i class="far fa-calendar-check"></i>&nbsp;&nbsp;
                              ${list.writedate}
                           </p>
                              <p class="address" style="text-align: left"><!-- 조회수 -->
                              &nbsp;&nbsp;&nbsp;<i class="far fa-eye"></i>&nbsp;&nbsp;
                              ${list.readnum}
                           </p>
                           <p>${status.count}</p>





             <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="modal">Detail View</button>

                        </div>
                     </div>

                  </div>

               </div>
            </c:forEach>
         </div>
      </section>


      <!-- End footer Area -->

       <script src="js/vendor/jquery-2.2.4.min.js"></script>
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

