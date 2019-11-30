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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>


<jsp:include page="/common/top.jsp"></jsp:include>
<body>

	<c:set var="detail" value="${requestScope.detailFileBoard}" />

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
});

</script>

	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/hero.jpg)">
		<!-- Start post Area -->



		<section class="post-area section-gap" style="padding-top: 10px;">

			<div class="section-heading text-center animated fadeInDown">
				<h2 class="h-bold">
					<!--  <i class="fas fa-campground"></i>&nbsp;&nbsp;Trade Detail -->
				</h2>
			</div>

			<div style="text-align: center;">
				<!-- <a href="ShowReviewWrite.do?bcode=102&tcode=0" class="btn mini blue">

            </a>
 -->


				<section class="blog-posts-area section-gap">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 post-list blog-post-list">

								<div class="single-post">
									<div style="text-align: left">
										<button type="button" class="btn" value="List"
											style="margin: 2px"
											onclick="location.href='TradeList.do?bcode=102&tcode=0&cp=${requestScope.cp}&ps=${requestScope.ps}'">
											<i class="fas fa-undo-alt"></i>&nbsp;&nbsp;List
										</button>

										<button type="button" id="editbtn" class="btn" value="Edit"
											style="margin: 2px"
											onclick="location.href='TradeEdit.do?bcode=102&tcode=0&cp=${requestScope.cp}&ps=${requestScope.ps}&idx=${requestScope.idx}&fidx=${detail.fidx}'">
											<i class="far fa-edit"></i>&nbsp;&nbsp;Edit
										</button>

										<button type="button" id="deletebtn" class="btn" value="Delete"
											style="margin: 2px"
											onclick="location.href='TradeDelete.do?bcode=102&tcode=0&cp=${requestScope.cp}&ps=${requestScope.ps}&idx=${requestScope.idx}&fidx=${detail.fidx}'">
											<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;Delete
										</button>
									</div>
									<ul class="tags">

										<li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;아이디
											|${detail.id}&nbsp;&nbsp;</li>
										<li>작성일 | ${detail.writedate}&nbsp;&nbsp;</li>
										<li>조회수 | ${detail.readnum}&nbsp;&nbsp;</li>
									</ul>

									<hr>
									<h1>
										<!-- 제목부분 -->
										제목: ${detail.title}
									</h1>
									<img class="img-fluid" src="upload/${detail.savename}"
										alt="후기사진입니다" style="width: 50%">



									<div class="content-wrap">
										<br>
										<p>
											<!-- 글내용 -->
											내용: ${detail.content}
										</p>
									</div>



									<!-- Start comment -->
									<section class="comment-sec-area pt-40 pb-40">
										<div class="container">
											<div class="row flex-column" style="text-align: left">
												<h5 class="text-uppercase pb-40">
													<span class="lnr lnr-bubble"></span> Comments
												</h5>

												<!-- 한개는 comment form으로 사용 -->
												<form name="reply"
													action="TradeReplyWrite.do?bcode=102&tcode=0" method="get">
													<div class="comment-list">
														<div class="single-comment justify-content-between d-flex">
															<div class="user justify-content-between d-flex">
																<div class="thumb" >

																	<i class="fab fa-replyd fa-5x"></i>

																</div>
																<div class="desc" style="text-align: left">

																	ID : ${sessionScope.id} <br>
																	<textarea id="replycontent" name="replycontent"
																		rows="3" cols="100" style="resize: none;"></textarea>
																</div>
															</div>
															<input type="hidden" id="idx" name="idx"
																value="${detail.idx}" /> <input type="hidden" id="id"
																name="id" value="${sessionScope.id}" /> <input
																type="button" id="reviewbtn" name="reviewbtn"
																class="btn-reply text-uppercase" value="reply"
																onclick="addreply()">

														</div>
													</div>
												</form>
												<c:set var="sid" value="${sessionScope.id}" />
												<div class="comment-list" id="replylist"></div>



												<script type="text/javascript">

                                       $(function() {
                                          getReplyList();
                                          //addreply();
                                          //deletereply();
                                       })


                                       var param1 = {
                                              "idx": ${detail.idx},
                                              
                                              "bcode": ${detail.bcode},
                                              
                                              "tcode": ${detail.tcode}
                                              
                                              
                                                };
                                       
                                        
                                          function getReplyList() {
                                              $.ajax({
                                                url:"TradeReplyList.do",
                                                dataType:"JSON",
                                                data: param1,
                                                type:"get",
                                                success: function(data){
                                                      //console.log(data);
                                                      //console.log(typeof(data));
                                                      $('#replylist').empty();
                                                         $.each(data, function(index, object) {
                                                            //console.log(object);
                                                            //console.log(object.replyid);
                                                            //console.log(object.replycontent);
                                                            let control = '<div class="single-comment justify-content-between d-flex" name='+object.replyid+' style="margin:2px"><div class="user justify-content-between d-flex">'
                                                                     + '<div class="thumb"><img src="img/avatar.png" alt="" width="50px" height="50px"></div><div class="desc">'
                                                                     + '<span><strong>'+object.replyid+'</strong></span>&nbsp;&nbsp;&nbsp;<span class="date">'+object.replydate+'</span>'
                                                                     + '<p class="comment">'+object.replycontent+'</p></div>'
                                                                     + '</div>'
                                                                     
                                                               //console.log($('#replyuser').text());
                                                               //console.log('${sessionScope.id}');
                                                            if(object.replyid == '${sessionScope.id}') {
                                                               control += '<input type="button" class="btn" id='+object.replyidx+' value="Delete" style="margin:2px">'
                                                            }
                                                            control += '</div>';
                                                            
                                                            
                                                            
                                                            //console.log(control);
                                                   
                                                            $('#replylist').append(control);

                                                            var replyidx = object.replyidx;
                                                            var replyid = object.replyid;
                                                            
                                                            var param3 = {"replyidx" : object.replyidx,
                                                                    "bcode" : ${detail.bcode},
                                                                     "tcode" : ${detail.tcode}
                                                                    };
                                                            //Reply delete
                                                            $('#'+object.replyidx).click(function(){  
                                                               console.log(replyidx);
                                                               console.log("텍스트" + '${sessionScope.id}');
                                                               console.log("유저아이디" + replyid);
                                                               if(object.replyid == '${sessionScope.id}'){
                                                                  console.log("여기들어오니?");
                                                                  console.log(replyid == '${sessionScope.id}');
                                                                  $.ajax({
                                                                     url:"DeleteReviewReply.do",
                                                                     data:param3,
                                                                     dataType:"text",
                                                                     success: function(data){
                                                                        console.log("댓글 삭제 data : " +data);
                                                                        alert('댓글이 삭제되었습니다.');
                                                                     }
                                                                  })
                                                                  $(this).parent().remove();
                                                               }else{
                                                                  alert('댓글삭제실패');
                                                                  
                                                               }
                                                            })
                                                         })
                                                }
                                             })
                                          }   
                                        
                                        
                                          function addreply(){
                                          //console.log("들어오니? 댓글아");
                                          //console.log("들어오니? 댓글아2"+ ${detail.bcode});
                                          //console.log("들어오니? 댓글아3"+ ${detail.tcode});
                                          
                                                var param = {
                                                             "idx":${detail.idx},
                                                            "replycontent":$('#replycontent').val(),
                                                            "bcode":${detail.bcode},
                                                            "tcode":${detail.tcode}
                                                          };
                                                
                                                $.ajax({
                                                   url:"TradeReplyWrite.do",
                                                   data:param,
                                                   success: function(data){
                                                      console.log("댓글 추가 data : " +data);
                                                       if(data.trim()=="success"){
                                                         alert("댓글등록성공");
                                                         getReplyList();
                                                         $('#replycontent').val("");
                                                      }else{
                                                         alert("댓글등록실패");
                                                      } 
                                                      
                                                   }
                                                   
                                                })
                                                return false;
                                          }
                                 
                                          

                                          
                                          
                                          
                                    </script>

											</div>
										</div>
									</section>
									<!-- End comment-sec Area -->
								</div>
							</div>

						</div>
					</div>
				</section>

			</div>
		</section>


		<!-- End footer Area -->

		<!--       <script src="js/vendor/jquery-2.2.4.min.js"></script> -->
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

