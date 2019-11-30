
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico"> 

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">


    <!-- <script type="text/javascript" src="../ckeditor/ckeditor.js" ></script>
   <link rel="Stylesheet" href="../style/default.css" /> -->
   
   
   <!-- include libraries(jQuery, bootstrap) -->
   <!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
   
   <!-- include summernote css/js -->
   <!--<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
   <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>  -->
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>


<style>

button {
   background-color: #341a79;
}

section {
   padding-top: 200px;
}


h5, h6 {
   text-align: left;
}


p {
   text-align: left;
}

article {
   margin-bottom: 10%;
}
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script type ="text/javascript">

$(document).ready(function(){ //판매중 1 판매완료 2 라디오 버튼 바뀌는 코드 
	
	var tcode = $('#tcodeselect :checked').val();
	console.log(tcode);
	
	$("input[type ='radio']").click(function(){
		var tcode = $('#tcodeselect :checked').val();
		console.log(tcode);
		
		    if ($('#tcodeselect :checked').val() != "2"){
		 		console.log($('#tcodeselect :checked').val());
		 		console.log("판매중");
		 	}else {($('#tcodeselect :checked').val() == "1")
		 		console.log("판매완료");	
		 	}
	});

 });
 

 
function check(){
/*   /*   if(!bbs.title.value){
        alert("제목을 입력하세요");
        bbs.title.focus();
        return false;
    }
    if(!bbs.writer.value){
        
        alert("이름을 입력하세요");
        bbs.writer.focus();
        return false;
    }

    if(!bbs.content.value){            
        alert("내용을 입력하세요");
        bbs.content.focus();
        return false;
    }
 
    document.bbs.submit();
  */ 
}


</script>
<body>

<jsp:include page="/common/top.jsp"></jsp:include>

<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)">

   <section>
      <article class="container" style="height: 90%;">
         <div class="animatedParent" id="myString">
            <div class="section-heading text-center animated fadeInDown">
               <h2 class="h-bold">
                  <i class="fas fa-edit"></i>&nbsp;&nbsp;Trade Edit
               </h2>
            </div>
         </div>

         <div id="writeForm" class="col-sm-12" style="height: 80%;">
            <!-- <form role="form" action="TradeWrite.do" method="post" id="review"></form> -->


            <div class="row">
               <div class="col-md-2"></div>
               <div class="col-md-8">
                 
                     <table class="table">
                      
                      
                           <c:set var = "edit" value = "${requestScope.detailBoard}"></c:set>
                           <c:set var = "edit2" value = "${requestScope.detailFile}"></c:set>
                           <form action="TradeEditOk.do" method="post" enctype="multipart/form-data">
                          <input type="hidden" class="form-control" name="idx" value = "${edit.idx}">
                          <input type="hidden" class="form-control" name="fidx" value = "${edit2.fidx}">
                          <input type="hidden" class="form-control" name="bcode" value = "${edit.bcode}">
                          <input type="hidden" class="form-control" name="tcode" value = "${edit.tcode}">
                            
                           <tr>
                           <td><h6>Writer</h6></td>
                           <td><input type="text" class="form-control" id = "id" name="id" value = "${sessionScope.id}" readonly></td>
                           
                        </tr>
                        <tr>
                           <td><h6>Title</h6></td>
                           <td><input type="text" class="form-control" name="title" value = "${edit.title}"></td>
                           
                        </tr>

                        <tr>
                           <td><h6>Content</h6></td>
                           <td><textarea rows="200" cols="100" name="content" id="editor"class="form-control ckeditor" style ="height:500px;">${edit.content}</textarea></td>
                        </tr>

                        <tr>

                           <td><h6>File</h6></td>
                     
                           <td>  <img src ="upload/${edit2.oriname}" alt =""/>
                           <input type="file" name="filename" value ="${edit2.savename}"> </td>
                           
                           <input type = "hidden" name = "savename" value = "${edit2.savename}">
                           <input type = "hidden" name ="oriname" value ="${edit2.oriname}">
                        </tr>
                           <tr>
                           <td><h6>Trading status</h6></td>
                    
                           <td id = "tcodeselect">
                               <input type="radio" class="form-control" name="tcode" id = "tcode" value = "1">판매중 <br>
                               <input type="radio" class="form-control" name="tcode" id= "tcode"  value = "2">판매완료 <br>
                           </td>
                    
                           
                        </tr>
                        
                    
                        <tr>

                           <td colspan="2" class="text-center">
                              <button type="submit" id="join-submit" onclick="click();" class="btn dorne-btn" style="width: 200px;">
                                                               수정하기<i class="far fa-check-circle"></i></button>
                                 <a href="ReviewList.do?bcode=102&tcode=0"><button type="button" class="btn dorne-btn">목록으로</button></a>
                           </td>
                        </tr>
                    </form>
                     </table>
                
               </div>
            </div>

         </div>

      </article>
   </section>

   </body>
 
   
       <script>
    ClassicEditor
        .create( document.querySelector('#editor'));
    </script>
      <jsp:include page="/common/bottom.jsp"></jsp:include>
</html>