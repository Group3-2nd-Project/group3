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
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
    <script type="text/javascript">
    function writeOk() {
    	   if('${sessionScope.id}'==''){
    	         alert('로그인이 필요합니다');
    	         return false;
    	      }
    	}
    
    </script>
	<script type="text/javascript">
$(function(){
	var q = ['seoul','incheon','daejeon','daegu','gwangju','ulsan','busan'];
	for(var i=0;i<q.length;i++){
		$.ajax({          
			 url: 'http://api.openweathermap.org/data/2.5/weather?appid=1e100d538271491ee3e454c5ea79c5a6&q='+q[i],
		     type: 'get',
		     dataType: 'json',
		     async: false,
		     success: function(responsedata){
		    	 console.log(responsedata);
		    	 $('#wcity').append("<th>"+responsedata.name+"</th>");
		    	 $('#wtem').append("<td>"+(responsedata.main.temp- 273.15).toFixed(1)+"°C</td>");
		    	 $('#wimg').append("<td>"+'<img id='+responsedata.name+'>'+"</td>");
		    	 var imgURL = "http://openweathermap.org/img/w/" + responsedata.weather[0].icon + ".png";
		    	 $('#'+responsedata.name).attr('src',imgURL);
		     }
		     });
	}
});
</script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
         var arr = new Array();
         var arr1 = new Array();
         $.ajax({          
         url: 'CampinglistCrossCK.do',
           type: 'get',
           dataType: 'json',
           success: function(responsedata){
              var val = responsedata.response.body.items.item; //rdnmadr obj.contentid
              var data = new google.visualization.DataTable();
               data.addColumn('string', '캠핑장 이름');
               data.addColumn('number', '조회수');
               
            $.each(val,function(index, obj) {
                var temp = ''+obj.readcount+'';
                var option = {v:obj.readcount, f:temp};
                var option2 = obj.title;
                arr[index] = [option2, option];
                
             });
            arr1[0]=arr;
            data.addRows(arr1[0]);
        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '500px', height: '100%',sortAscending:false, sortColumn:1});
        $('.google-visualization-table-tr-head').eq(0).html("");
        $('.google-visualization-table-tr-head').attr('style','height:50px;background-color: rgba(0,0,0,0.6); color: white;');
        $('.google-visualization-table-tr-head').append("<th>순위</th>");
        $('.google-visualization-table-tr-head').append("<th>캠핑장명</th>");
        $('.google-visualization-table-tr-head').append("<th>조회수</th>");
        $('.google-visualization-table-tr-odd').attr('style', 'text-align:center;background-color: rgba(0,0,0,0.6); color: white;');
        $('.google-visualization-table-tr-even').attr('style', 'text-align:center;background-color: rgba(0,0,0,0.6); color: white;');
        $('.google-visualization-table-td').attr('style', 'text-align:center;background-color: rgba(0,0,0,0.6); color: white;');
        //$('.google-visualization-table-tr-head').attr('class', '');
        $('.google-visualization-table-table').attr('class','table');
        $('.google-visualization-table-table').attr('style','border-collapse:collapse');
        for(var i=11; i<=60;i++){
           $('tr').eq(i).hide();
        }
           }
       })
       
      }
    </script>
<script type="text/javascript">
               $(function() {
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
                        		   });
                        	   var frontArr = [...front];
                        	   var fullArr = [...full];
                        	   for(var i=0; i<frontArr.length;i++){
                        		   $('#sigun').append("<option id='"+frontArr[i]+"' value='"+frontArr[i]+"'>"+frontArr[i]+"</option>");
                        	   }
                        	   $('#sigun').change(function() {
                        		   $('#si').empty();
                    			   for(var i=0;i<fullArr.length;i++){
                    				   if($('#sigun').val()==fullArr[i].split(" ")[0]){
                    					   $('#si').append("<option value='"+fullArr[i].split(" ")[1]+"'>"+fullArr[i].split(" ")[1]+"</option>");
                    				   }
                    			   }
                        	   });
                        		   
                        	   
                           }
                       });
               });      
           </script>
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
    background-color: #125448;
}
 #pp {
 background-color: #125448;

}

h2 {
 font-family : "Open Sans", Helvetica, "Arial", sans-serif;

}

</style>

<body>
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
    <section class="dorne-welcome-area bg-img" style="background-image:url(img/bg-img/back-img1.jpg)">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-md-10">
                    <div class="hero-content">
                        <h2>CAMPING EASY</h2>
                        <h4>Enjoy Your Camp</h4>
                    </div>
                    <!-- Hero Search Form -->
                    <div class="hero-search-form" >
                        <!-- Tabs -->
                        <div class="nav nav-tabs" id="heroTab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true" style ="background-color:#125448;">Places</a>
                          <!--   <a class="nav-item nav-link" id="nav-events-tab" data-toggle="tab" href="#nav-events" role="tab" aria-controls="nav-events" aria-selected="false">Events</a> -->
                        </div>
                        <!-- Tabs Content -->
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab" style ="background-color:#eaedea; opacity:0.95">
                                <h6 style ="color:#333333;">캠핑장을 검색해서 찾아보세요</h6>
                                <form action="MainCampingview.do">
                                    <input type= "text" name="campgnm" id="campgnm" placeholder="검색어를 입력하세요" style ="width:70%; height:52px; border:0;">
                                    <button type="submit" id="button" name="button" class="btn dorne-btn" style ="width: 200px; background-color:#125448;"><i class="fa fa-search pr-2" aria-hidden="true" style = "color:white;">Search</i></button>
                                </form>
                                <br>
                                <form action="MainCampingview.do">
                                    <select class="custom-select" id="sigun" name="sigun" style ="width: 33.87%;">
                                        <option value="서울시">서울시</option>
                                        <option value="경기도">경기도</option>
                                    </select>
                                    <select class="custom-select" id="si" name="si" style ="width: 33.87%;">
                                        <option value="강동구">강동구</option>
                                        <option value="마포구">마포구</option>
                                    </select>
                                    <button type="submit" id="button" name="button" class="btn dorne-btn" style ="width: 200px; background-color:#125448;"><i class="fa fa-search pr-2" aria-hidden="true" style = "color:white;"> Search</i></button>
                                </form>
                            </div>
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

       <!-- ***** Catagory Area Start ***** -->
    <section class="dorne-catagory-area" >
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="all-catagories">
                        <div class="row">
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md" >
                                <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.2s" style = "background-color: #125448; opacity:0.95">
                                    <div class="catagory-content">
                                        <img src="img/core-img/icon11.png" alt=""> 
                                        <a href="#">
                                            <h6>Tent</h6>
                                        </a>
                                    </div>
                                </div>
                            </div> 
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.4s" style = "background-color: #eaedea; opacity:0.95; font-color:#333333;">
                                    <div class="catagory-content">
                                        <img src="img/core-img/icon12.png" alt="">
                                        <a href="#">
                                            <h6 style ="color:#333333;">Map</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.6s" style = "background-color: #125448; opacity:0.95">
                                    <div class="catagory-content">
                                        <img src="img/core-img/icon13.png" alt="">
                                        <a href="#">
                                            <h6>CampFire</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-sm-6 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.8s" style = "background-color:  #eaedea; opacity:0.95;">
                                    <div class="catagory-content">
                                        <img src="img/core-img/icon14.png" alt="">
                                        <a href="#">
                                            <h6 style ="color:#333333;">Mountain</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Catagory Area -->
                            <div class="col-12 col-md">
                                <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="1s" style = "background-color:  #125448;opacity:0.95 ">
                                    <div class="catagory-content">
                                        <img src="img/core-img/icon15.png" alt="">
                                        <a href="#">
                                            <h6>Fishing</h6>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Catagory Area End ***** -->

   <!-- ***** About Area Start ***** -->
    <section class="dorne-about-area section-padding-0-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="about-content text-center">
                        <h2  style ="color:#125448;">CAMPING EASY? <br><span  style ="color:#906D3B;">캠핑이지!!!</span></h2>
                        <p>'캠핑이지'는 캠핑을 하려는 사람에게 캠핑을 쉽게 즐길 수 있도록 안내하는 사이트입니다. <br> 주요 기능은 캠핑지 정보제공, 날씨정보제공, 이용자들의 캠핑지 후기, 캠핑용품 중고거래 등이 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** About Area End ***** -->

    <!-- ***** 추천 캠핑장 & 공지사항 & 날씨 시작***** -->
    <section class="dorne-editors-pick-area bg-img section-padding-100" style="background-image:url(img/bg-img/back-img2.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center" style="margin-bottom: 2%">
                        <h1 style="color:white"><b>Contents</b></h1>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-5">
                    <div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.1s">
                    <h4 style="text-align: center; color: white"><b>캠핑장 조회순위</b></h4>
                        <div id="table_div"></div>
                    </div>
                </div>
                <div class="col-12 col-lg-7">
                    <div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.2s">
                    <h4 style="text-align: center; color: white"><b>공지사항</b></h4>
                        <table class="table" id="notice" style="background-color: rgba(0,0,0,0.7); color: white; font-size: 15px">
                        	<tr style="text-align: center;">
                        	<th><b>제목</b></th>
                        	<th><b>글쓴이</b></th>
                        	<th><b>작성일</b></th>
                        	</tr>
                        </table>
                    </div>
                    <div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.1s">
                    <h4 style="text-align: center; color: white"><b>오늘의 날씨</b></h4>
                       <table id=wtable class='table' style="background-color: rgba(0,0,0,0.7); color: white; height: 190px">
                       <tr id=wcity>
                       </tr>
                       <tr id=wtem>
                       </tr>
                       <tr id=wimg>
                       </tr>
                       </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** 추천 캠핑장 & 공지사항 & 날씨 끝 ***** -->




    <!-- ***** 메인페이지  : 후기 시작 ***** -->
    
    
    <script type="text/javascript">
    $(function(){
       console.log("여보세요?");
       $.ajax({
           url:"boardList.do",
          dataType:"JSON",
          data: {"bcode" : 303,
        		"ps" : 5,
        		"cp" : 1,
        		"zcode" : 1,
        		"edit" : 0
          },
          type:"get",
          success: function(data){
        	  console.log("햐햐햐햫햐"+data);
        	  $.each(data, function(index, obj){
        		  console.log(obj);
        		  var writedate = obj.writedate;
        		  $('#notice').append("<tr id='no"+index+"'></tr>");
        		  $('#no'+index).append("<td><a href='boardDetail.do?idx="+obj.idx+"&bcode=303&ps=5&cp=1&zcode=1&edit=0' style='color:white;'>"+obj.title+"</a></td>");
        		  $('#no'+index).append("<td style='text-align:center'>"+obj.id+"</td>");
        		  $('#no'+index).append("<td style='text-align:center'>"+writedate.substr(0, 10)+"</td>");
        	  });
          }
          });
       
       $.ajax({
          url:"RecentReview.do",
         dataType:"JSON",
         data: {"bcode" : 202},
         type:"get",
         success: function(data){
            console.log("데이터야 나오니?" +data);
            console.log(data);
            //console.log(data[0].id);
            $.each(data, function(index, object){
               console.log(object)
               console.log(object.idx);
               //console.log(object.savename);
               console.log('<div class="feature-title"><a href="ShowReviewDetail.do?idx='+object.idx+'"><h5>'+object.id+'님의 캠핑장 후기</h5></a>');
               
                  var page = '<div class="col-sm"><div class="single-features-area" ><img src="upload/'+object.savename+'" onerror="this.src='+'\'./img/bg-img/noimage.gif\''+'"style ="width:100%; height:300px;">'
                      // +'<div class="price-start"><p id ="pp"> ID :&nbsp;&nbsp;'+object.id+'</p></div>'
                       +'<div class="feature-content d-flex align-items-center justify-content-between">'
                       +'<div class="feature-title"><a href="ShowReviewDetail.do?idx='+object.idx+'" onclick="return writeOk()"><h5>'+object.id+'님의 캠핑장 후기</h5></a>'
                       +'<p>'+object.writedate+'</p></div><div class="feature-favourite"><a href="#">'
                       +'</a></div></div></div></div>';
                      console.log(page);
                      $('#review').append(page);
            });
         }
       });
    });
    </script>
    
    
   <section class="dorne-features-destinations-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading dark text-center">
                        <span></span>
                        <h4>Review</h4>
                        <p>캠핑장 최근 후기</p>
                    </div>
                </div>
            </div>


  <div class="container-fluid">
    <div class="row" >
      <div class="col-sm"></div>

    </div>  
  </div>
</div>



            <div class="row" id="review">
                <div class="col-12" >
                    <div class="features-slides owl-carousel" >
                    </div>
                </div>
            </div>
        
    </section>

    <!-- ****** Footer Area Start ****** -->
    <jsp:include page="/common/bottom.jsp"></jsp:include>
    <!-- ****** Footer Area End ****** -->
</body>

</html>