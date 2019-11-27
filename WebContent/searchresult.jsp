<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">					
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e68181a2b9091648525773b85953a2cc"></script>
<script type="text/javascript">
               $(function() {
            	   if($('#sigun').val()==""){
        			   $('#sigun').attr("value", "　");
        		   }else if($('#campgnm').val()==""){
        			   $('#campgnm').attr("value", "　");
        		   }
            		   $.ajax({          
            			   url: 'CampinglistCrossCK.do',
                           type: 'get',
                           dataType: 'json',
                           success: function(responsedata){
                        	   var val = responsedata.response.body.items.item; //rdnmadr
                        	   var front = new Set();
                        	   var full = new Set();
                        	   $.each(val,function(index, obj) {
                        		   front.add(obj.addr1.split(" ")[0]);
                        		   full.add(obj.addr1.split(" ")[0]+" "+obj.addr1.split(" ")[1]);
                        		   if(obj.addr1.match($('#sigun').val()+" "+$('#si').val())||obj.addr1.match($('#campgnm').val())||obj.title.match($('#campgnm').val())){ //match >> 문자열 일치여부?
                        			   $('#container').append("<div class='row' id=list"+index+"></div>")
                            		   $('#list'+index).append("<div class='col-sm-4' id=img"+index+"></div>")
                            		   $('#list'+index).append("<div class='col-sm-6' id=content"+index+"></div>")
                            		   $('#list'+index).append("<div class='col-sm-2' id=btt"+index+"></div>")
                            		   $.ajax({          
                        			   url: 'ZzimListSearch.do',
                        			   data : {contentId:obj.contentid},
                                       type: 'get',
                                       dataType: 'json',
                                       success: function(responsedata){
                                    	   if(responsedata.length==0){
                                    		   $('#btt'+index).prepend("<br><div style='text-align:center; margin:2px'><button class='offheart btn btn btn-outline-secondary' name=off id=heart"+obj.contentid+" background-color:white'><i class='far fa-heart fa-2x' style='color:red;'></i>찜하기</button></div>")
                                    	   }else{
                                    		   $('#btt'+index).prepend("<br><div style='text-align:center; margin:2px'><button class='onheart btn btn btn-outline-secondary' name=on id=heart"+obj.contentid+" background-color:white'><i class='fas fa-heart fa-2x' style='color:red;'></i>찜하기</button></div>")
                                    	   }
                                    	   $('#heart'+obj.contentid).click(function(){
                                     		   var tem = $(this).attr('id');
                                     		   var temp = $(this).attr('id').substr(5);
                                     		   var nam = $(this).attr('name');
                                                 	   if(nam=='off'){
                                                 		   alert("찜이 추가 되었습니다");
                                                 		   $.ajax({          
                                                 			   url: 'ZzimListInsert.do',
                                                 			   data : {contentId:temp},
                                                                type: 'get',
                                                                dataType: 'json',
                                                                success: function(responsedata){
                                                                }
                                                                });
                                                 		  $(this).children().attr('class', 'fas fa-heart fa-2x');
                                                 		  $(this).attr('name', 'on');
                                                            }else if(nam=='on'){
                                                            	alert("찜이 삭제 되었습니다");
                                                     	    	$.ajax({          
                                                      			   url: 'ZzimListDelete.do',
                                                      			   data : {contentId:temp},
                                                                     type: 'get',
                                                                     dataType: 'json',
                                                                     success: function(responsedata){
                                                                     }
                                                                 });
                                                     	    	$(this).children().attr('class', 'far fa-heart fa-2x');
                                                     	    	$(this).attr('name', 'off');
                                                            }
                                     	   });
                                       }
                            		   });
                        			   $('#img'+index).append("<img id="+obj.contentid+" name="+obj.contentid+">")
                        			    if(obj.firstimage==null){
                        		   			$('#'+obj.contentid).attr("src", "https://t1.daumcdn.net/cfile/tistory/991EC1495AB1EA9112");
                        		   			$('#'+obj.contentid).attr("width", "800px");
                        		   			$('#'+obj.contentid).attr("height", "600px");
                        		   		}else{
                        		   			$('#'+obj.contentid).attr("src", obj.firstimage);
                        		   			$('#'+obj.contentid).attr("width", "800px");
                        		   			$('#'+obj.contentid).attr("height", "600px");
                        		   		}
                               			$('#content'+index).append("<br>캠핑장명 : <b>"+obj.title+"<b><br>");
                               			$('#content'+index).append("주소 : "+obj.addr1+"<br>");
                               			if(obj.tel==null){
                               				$('#content'+index).append("전화번호 : <br>");
                               			}else{
                               				$('#content'+index).append("전화번호 : "+obj.tel+"<br>");
                               			}
                               			$('#btt'+index).append("<div style='text-align:center; margin:2px'><input type='button' class='detail btn btn btn-outline-secondary' id='"+obj.contentid+"' name='"+obj.contentid+"' value='상세보기' data-toggle='modal' data-target='#myModal"+obj.contentid+"'></div>")
                               			$('#btt'+index).append("<div style='text-align:center; margin:2px'><input type='button' class='kmap btn btn btn-outline-secondary' id='"+obj.mapx+"' name='"+obj.mapy+"' value='지도보기' data-toggle='modal' data-target='#mapModal"+obj.contentid+"'></div>")
                               			$('#btt'+index).append("<div class='modal' id=myModal"+obj.contentid+"><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><h4 class='modal-title'>상세보기</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div><div class='modal-body' id='de"+obj.contentid+"'></div><div class='modal-footer'><button type='button' class='btn dorne-btn' data-dismiss='modal'>Close</button></div></div></div></div>");
                               			$('#btt'+index).append("<div class='modal wook' id=mapModal"+obj.contentid+"><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><h4 class='modal-title'>지도보기</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div><div class='modal-body' id='map"+obj.contentid+"' style='width:500px; height:400px;'></div><div class='modal-footer'><button type='button' class='btn dorne-btn' data-dismiss='modal'>Close</button></div></div></div></div>");
                               			$('#mapModal'+obj.contentid).on('shown.bs.modal',function(){
                               				var container = document.getElementById('map'+obj.contentid);
                                			var options = {
                                				center: new kakao.maps.LatLng(obj.mapy, obj.mapx),
                                				level: 3
                                			};
                                			var map = new kakao.maps.Map(container, options);
                                			// 마커가 표시될 위치입니다 
                                			var markerPosition  = new kakao.maps.LatLng(obj.mapy, obj.mapx); 
                                			// 마커를 생성합니다
                                			var marker = new kakao.maps.Marker({
                                			    position: markerPosition
                                			});
                                			// 마커가 지도 위에 표시되도록 설정합니다
                                			marker.setMap(map);
                               			});
                               		}
                        	   });
                        	   var frontArr = [...front];
                        	   var fullArr = [...full];
                        	   for(var i=0; i<frontArr.length;i++){
                        		   $('#sigun2').append("<option id='"+frontArr[i]+"' value='"+frontArr[i]+"'>"+frontArr[i]+"</option>");
                        	   }
                        	   $('#sigun2').change(function() {
                        		   $('#si2').empty();
                    			   for(var i=0;i<fullArr.length;i++){
                    				   if($('#sigun2').val()==fullArr[i].split(" ")[0]){
                    					   $('#si2').append("<option value='"+fullArr[i].split(" ")[1]+"'>"+fullArr[i].split(" ")[1]+"</option>");
                    				   }
                    			   }
                        	   });
                        	   if($('#sigun').val()=="　"){
                    			   $('#sigun').attr("value", "");
                    		   }else if($('#campgnm').val()=="　"){
                    			   $('#campgnm').attr("value", "");
                    		   }
                        	   
                        	   $('.detail').click(function(){
                        		   var temp = $(this).attr('id');
                        		   $('#de'+temp).empty();
                        		   $.ajax({          
                        			   url: 'CampingDetailCrossCK.do',
                        			   data : {contentId:temp},
                                       type: 'get',
                                       dataType: 'json',
                                       success: function(responsedata){
                                    	   var val = responsedata.response.body.items.item; //rdnmadr
                                   			    $('#de'+temp).append("캠핑장명 : "+val.title+"<br><br>");
                                   			    $('#de'+temp).append("주소 : "+val.addr1+"<br><br>");
                                   			    $('#de'+temp).append("홈페이지 : "+val.homepage+"<br><br>");
                                      			$('#de'+temp).append(val.overview+"<br><br>");
                                       }
                                   });
                        	   });
                           }
                       });
               });
               
           </script>
</head>
<style>
.row{
margin-bottom:1%;
}
.col-sm-4{
padding-top:3%;
padding-left: 5%;
}
.col-sm-8{

}
</style>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
<!-- start -->
<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)"></div> 
<div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-md-10">
                    
                    <!-- Hero Search Form -->
 
 <section style= "height: 100%">
<input type="hidden" id="sigun" value="${param.sigun}">
<input type="hidden" id="si" value="${param.si}">


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
    <input type= "text" name="campgnm" id="campgnm" placeholder="검색어를 입력하세요" value="${param.campgnm }" style ="width:70%; height:52px;">
<button type="button" id="namebutton" name="namebutton" class="btn dorne-btn" style ="width: 200px; background-color:#6b8e23;"><i class="fa fa-search pr-2" aria-hidden="true"></i> Search</button>
<br><br>
    <select class="custom-select" id="sigun2" name="sigun2" style ="width: 34.8%;">
    <option value="${param.sigun}">선택하세요</option>
</select>
<select class="custom-select" id="si2" name="si2" style ="width: 34.8%;">
    <option value="${param.si}">선택하세요</option>
</select>
<button type="button" id="sibutton" name="sibutton" class="btn dorne-btn" style ="width: 200px; background-color:#6b8e23;"><i class="fa fa-search pr-2" aria-hidden="true"></i> Search</button>
        </div>
    </div>
</div>
<section class="post-area section-gap" style="padding-top:20px;">
<div class="container" id=container></div>
</section>
                </div>
            </div>
        </div>
<!-- end -->

<jsp:include page="/common/bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
$('#namebutton').click(function(){
	   $.ajax({          
		   url: 'CampinglistCrossCK.do',
           type: 'get',
           dataType: 'json',
           success: function(responsedata){
        	   $('#container').empty();
        	   $('#map').empty();
        	   var val = responsedata.response.body.items.item; //rdnmadr
        	   $.each(val,function(index, obj) {
        		   if(obj.addr1.match($('#campgnm').val())||obj.title.match($('#campgnm').val())){ //match >> 문자열 일치여부?
        			   $('#container').append("<div class='row' id=list"+index+"></div>")
            		   $('#list'+index).append("<div class='col-sm-4' id=img"+index+"></div>")
            		   $('#list'+index).append("<div class='col-sm-6' id=content"+index+"></div>")
            		   $('#list'+index).append("<div class='col-sm-2' id=btt"+index+"></div>")
            		   $.ajax({          
                        			   url: 'ZzimListSearch.do',
                        			   data : {contentId:obj.contentid},
                                       type: 'get',
                                       dataType: 'json',
                                       success: function(responsedata){
                                    	   if(responsedata.length==0){
                                    		   $('#btt'+index).prepend("<br><div style='text-align:center; margin:2px'><button class='offheart btn btn btn-outline-secondary' name=off id=heart"+obj.contentid+" background-color:white'><i class='far fa-heart fa-2x' style='color:red;'></i>찜하기</button></div>")
                                    	   }else{
                                    		   $('#btt'+index).prepend("<br><div style='text-align:center; margin:2px'><button class='onheart btn btn btn-outline-secondary' name=on id=heart"+obj.contentid+" background-color:white'><i class='fas fa-heart fa-2x' style='color:red;'></i>찜하기</button></div>")
                                    	   }
                                    	   $('#heart'+obj.contentid).click(function(){
                                     		   var tem = $(this).attr('id');
                                     		   var temp = $(this).attr('id').substr(5);
                                     		   var nam = $(this).attr('name');
                                                 	   if(nam=='off'){
                                                 		   alert("찜이 추가 되었습니다");
                                                 		   $.ajax({          
                                                 			   url: 'ZzimListInsert.do',
                                                 			   data : {contentId:temp},
                                                                type: 'get',
                                                                dataType: 'json',
                                                                success: function(responsedata){
                                                                }
                                                                });
                                                 		  $(this).children().attr('class', 'fas fa-heart fa-2x');
                                                 		  $(this).attr('name', 'on');
                                                            }else if(nam=='on'){
                                                            	alert("찜이 삭제 되었습니다");
                                                     	    	$.ajax({          
                                                      			   url: 'ZzimListDelete.do',
                                                      			   data : {contentId:temp},
                                                                     type: 'get',
                                                                     dataType: 'json',
                                                                     success: function(responsedata){
                                                                     }
                                                                 });
                                                     	    	$(this).children().attr('class', 'far fa-heart fa-2x');
                                                     	    	$(this).attr('name', 'off');
                                                            }
                                     	   });
                                       }
                            		   });
        			   $('#img'+index).append("<img id="+obj.contentid+" name="+obj.contentid+">");
        			    if(obj.firstimage==null){
        		   			$('#'+obj.contentid).attr("src", "https://t1.daumcdn.net/cfile/tistory/991EC1495AB1EA9112");
        		   			$('#'+obj.contentid).attr("width", "800px");
        		   			$('#'+obj.contentid).attr("height", "600px");
        		   		}else{
        		   			$('#'+obj.contentid).attr("src", obj.firstimage);
        		   			$('#'+obj.contentid).attr("width", "800px");
        		   			$('#'+obj.contentid).attr("height", "600px");
        		   		}
        			    $('#content'+index).append("<br>캠핑장명 : <b>"+obj.title+"<b><br>");
               			$('#content'+index).append("주소 : "+obj.addr1+"<br>");
               			if(obj.tel==null){
               				$('#content'+index).append("전화번호 : <br>");
               			}else{
               				$('#content'+index).append("전화번호 : "+obj.tel+"<br>");
               			}
               			$('#btt'+index).append("<div style='text-align:center; margin:2px'><input type='button' class='detail btn btn btn-outline-secondary' id='"+obj.contentid+"' name='"+obj.contentid+"' value='상세보기' data-toggle='modal' data-target='#myModal"+obj.contentid+"'></div>")
               			$('#btt'+index).append("<div style='text-align:center; margin:2px'><input type='button' class='kmap btn btn btn-outline-secondary' id='"+obj.mapx+"' name='"+obj.mapy+"' value='지도보기' data-toggle='modal' data-target='#mapModal"+obj.contentid+"'></div>")
               			$('#btt'+index).append("<div class='modal' id=myModal"+obj.contentid+"><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><h4 class='modal-title'>상세보기</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div><div class='modal-body' id='de"+obj.contentid+"'></div><div class='modal-footer'><button type='button' class='btn dorne-btn' data-dismiss='modal'>Close</button></div></div></div></div>");
               			$('#btt'+index).append("<div class='modal wook' id=mapModal"+obj.contentid+"><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><h4 class='modal-title'>지도보기</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div><div class='modal-body' id='map"+obj.contentid+"' style='width:500px; height:400px;'></div><div class='modal-footer'><button type='button' class='btn dorne-btn' data-dismiss='modal'>Close</button></div></div></div></div>");
               			$('#mapModal'+obj.contentid).on('shown.bs.modal',function(){
               				var container = document.getElementById('map'+obj.contentid);
                			var options = {
                				center: new kakao.maps.LatLng(obj.mapy, obj.mapx),
                				level: 3
                			};
                			var map = new kakao.maps.Map(container, options);
                			// 마커가 표시될 위치입니다 
                			var markerPosition  = new kakao.maps.LatLng(obj.mapy, obj.mapx); 
                			// 마커를 생성합니다
                			var marker = new kakao.maps.Marker({
                			    position: markerPosition
                			});
                			// 마커가 지도 위에 표시되도록 설정합니다
                			marker.setMap(map);
               			});
               		}
        	   });
        	   $('.detail').click(function(){
        		   var temp = $(this).attr('id');
        		   $('#de'+temp).empty();
        		   $.ajax({          
        			   url: 'CampingDetailCrossCK.do',
        			   data : {contentId:temp},
                       type: 'get',
                       dataType: 'json',
                       success: function(responsedata){
                    	   var val = responsedata.response.body.items.item; //rdnmadr
                   			    $('#de'+temp).append("캠핑장명 : "+val.title+"<br><br>");
                   			    $('#de'+temp).append("주소 : "+val.addr1+"<br><br>");
                   			    $('#de'+temp).append("홈페이지 : "+val.homepage+"<br><br>");
                      			$('#de'+temp).append(val.overview+"<br><br>");
                       }
                   });
        	   });
           }
       });
 });
 $('#sibutton').click(function(){
	   $.ajax({          
		   url: 'CampinglistCrossCK.do',
           type: 'get',
           dataType: 'json',
           success: function(responsedata){
        	   $('#container').empty();
        	   $('#map').empty();
        	   var val = responsedata.response.body.items.item; //rdnmadr
        	   var front = new Set();
        	   var full = new Set();
        	   $.each(val,function(index, obj) {
        		   front.add(obj.addr1.split(" ")[0]);
        		   full.add(obj.addr1.split(" ")[0]+" "+obj.addr1.split(" ")[1]);
        		   if(obj.addr1.match($('#sigun2').val()+" "+$('#si2').val())){ //match >> 문자열 일치여부?
        			   $('#container').append("<div class='row' id=list"+index+"></div>")
            		   $('#list'+index).append("<div class='col-sm-4' id=img"+index+"></div>")
            		   $('#list'+index).append("<div class='col-sm-6' id=content"+index+"></div>")
            		   $('#list'+index).append("<div class='col-sm-2' id=btt"+index+"></div>")
            		   $.ajax({          
                        			   url: 'ZzimListSearch.do',
                        			   data : {contentId:obj.contentid},
                                       type: 'get',
                                       dataType: 'json',
                                       success: function(responsedata){
                                    	   if(responsedata.length==0){
                                    		   $('#btt'+index).prepend("<br><div style='text-align:center; margin:2px'><button class='offheart btn btn btn-outline-secondary' name=off id=heart"+obj.contentid+" background-color:white'><i class='far fa-heart fa-2x' style='color:red;'></i>찜하기</button></div>")
                                    	   }else{
                                    		   $('#btt'+index).prepend("<br><div style='text-align:center; margin:2px'><button class='onheart btn btn btn-outline-secondary' name=on id=heart"+obj.contentid+" background-color:white'><i class='fas fa-heart fa-2x' style='color:red;'></i>찜하기</button></div>")
                                    	   }
                                    	   $('#heart'+obj.contentid).click(function(){
                                     		   var tem = $(this).attr('id');
                                     		   var temp = $(this).attr('id').substr(5);
                                     		   var nam = $(this).attr('name');
                                                 	   if(nam=='off'){
                                                 		   alert("찜이 추가 되었습니다");
                                                 		   $.ajax({          
                                                 			   url: 'ZzimListInsert.do',
                                                 			   data : {contentId:temp},
                                                                type: 'get',
                                                                dataType: 'json',
                                                                success: function(responsedata){
                                                                }
                                                                });
                                                 		  $(this).children().attr('class', 'fas fa-heart fa-2x');
                                                 		  $(this).attr('name', 'on');
                                                            }else if(nam=='on'){
                                                            	alert("찜이 삭제 되었습니다");
                                                     	    	$.ajax({          
                                                      			   url: 'ZzimListDelete.do',
                                                      			   data : {contentId:temp},
                                                                     type: 'get',
                                                                     dataType: 'json',
                                                                     success: function(responsedata){
                                                                     }
                                                                 });
                                                     	    	$(this).children().attr('class', 'far fa-heart fa-2x');
                                                     	    	$(this).attr('name', 'off');
                                                            }
                                     	   });
                                       }
                            		   });
        			    $('#img'+index).append("<img id="+obj.contentid+" name="+obj.contentid+">")
        			    if(obj.firstimage==null){
        		   			$('#'+obj.contentid).attr("src", "https://t1.daumcdn.net/cfile/tistory/991EC1495AB1EA9112");
        		   			$('#'+obj.contentid).attr("width", "800px");
        		   			$('#'+obj.contentid).attr("height", "600px");
        		   		}else{
        		   			$('#'+obj.contentid).attr("src", obj.firstimage);
        		   			$('#'+obj.contentid).attr("width", "800px");
        		   			$('#'+obj.contentid).attr("height", "600px");
        		   		}
        			    $('#content'+index).append("<br>캠핑장명 : <b>"+obj.title+"<b><br>");
               			$('#content'+index).append("주소 : "+obj.addr1+"<br>");
               			if(obj.tel==null){
               				$('#content'+index).append("전화번호 : <br>");
               			}else{
               				$('#content'+index).append("전화번호 : "+obj.tel+"<br>");
               			}
               			$('#btt'+index).append("<div style='text-align:center; margin:2px'><input type='button' class='detail btn btn btn-outline-secondary' id='"+obj.contentid+"' name='"+obj.contentid+"' value='상세보기' data-toggle='modal' data-target='#myModal"+obj.contentid+"'></div>")
               			$('#btt'+index).append("<div style='text-align:center; margin:2px'><input type='button' class='kmap btn btn btn-outline-secondary' id='"+obj.mapx+"' name='"+obj.mapy+"' value='지도보기' data-toggle='modal' data-target='#mapModal"+obj.contentid+"'></div>")
               			$('#btt'+index).append("<div class='modal' id=myModal"+obj.contentid+"><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><h4 class='modal-title'>상세보기</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div><div class='modal-body' id='de"+obj.contentid+"'></div><div class='modal-footer'><button type='button' class='btn dorne-btn' data-dismiss='modal'>Close</button></div></div></div></div>");
               			$('#btt'+index).append("<div class='modal wook' id=mapModal"+obj.contentid+"><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><h4 class='modal-title'>지도보기</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div><div class='modal-body' id='map"+obj.contentid+"' style='width:500px; height:400px;'></div><div class='modal-footer'><button type='button' class='btn dorne-btn' data-dismiss='modal'>Close</button></div></div></div></div>");
               			$('#mapModal'+obj.contentid).on('shown.bs.modal',function(){
               				var container = document.getElementById('map'+obj.contentid);
                			var options = {
                				center: new kakao.maps.LatLng(obj.mapy, obj.mapx),
                				level: 3
                			};
                			var map = new kakao.maps.Map(container, options);
                			// 마커가 표시될 위치입니다 
                			var markerPosition  = new kakao.maps.LatLng(obj.mapy, obj.mapx); 
                			// 마커를 생성합니다
                			var marker = new kakao.maps.Marker({
                			    position: markerPosition
                			});
                			// 마커가 지도 위에 표시되도록 설정합니다
                			marker.setMap(map);
               			});
               		}
        	   });
        	   var frontArr = [...front];
        	   var fullArr = [...full];
        	   for(var i=0; i<frontArr.length;i++){
        		   $('#sigun2').append("<option id='"+frontArr[i]+"' value='"+frontArr[i]+"'>"+frontArr[i]+"</option>");
        	   }
        	   $('#sigun2').change(function() {
        		   $('#si2').empty();
    			   for(var i=0;i<fullArr.length;i++){
    				   if($('#sigun2').val()==fullArr[i].split(" ")[0]){
    					   $('#si2').append("<option value='"+fullArr[i].split(" ")[1]+"'>"+fullArr[i].split(" ")[1]+"</option>");
    				   }
    			   }
        	   });
        	   if($('#sigun').val()=="　"){
    			   $('#sigun').attr("value", "");
    		   }else if($('#campgnm').val()=="　"){
    			   $('#campgnm').attr("value", "");
    		   }
        	   $('.detail').click(function(){
        		   var temp = $(this).attr('id');
        		   $('#de'+temp).empty();
        		   $.ajax({          
        			   url: 'CampingDetailCrossCK.do',
        			   data : {contentId:temp},
                       type: 'get',
                       dataType: 'json',
                       success: function(responsedata){
                    	   var val = responsedata.response.body.items.item; //rdnmadr
                   			    $('#de'+temp).append("캠핑장명 : "+val.title+"<br><br>");
                   			    $('#de'+temp).append("주소 : "+val.addr1+"<br><br>");
                   			    $('#de'+temp).append("홈페이지 : "+val.homepage+"<br><br>");
                      			$('#de'+temp).append(val.overview+"<br><br>");
                       }
                   });
        	   });
           }
       });
 });
</script>
</html>