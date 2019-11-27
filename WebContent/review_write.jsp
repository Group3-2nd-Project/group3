
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
  
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
   

   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 
   <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <SCRIPT type="text/javascript">
   function check(){
    if($('#title')==null){
        alert("제목을 입력하세요");
        $('#title').focus();
        return false;
    }
    if($('#content')==null){     
        alert("내용을 입력하세요");
        $('#content').focus();
        return false;
    }

    $('#reviewbtn').submit();
}

</SCRIPT>  
</HEAD>

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

.left {
   width: 20%;
}

.right {
   width: 80%;
}
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<body>


<jsp:include page="/common/top.jsp"></jsp:include>
<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)">

<script type="text/javascript">
/* console.log("콘솔에찍히니?" + ${sessionScope.id}); */

</script>
   <section>
      <article class="container" style="height: 90%;">
         <div class="animatedParent" id="myString">
            <div class="section-heading text-center animated fadeInDown">
               <h2 class="h-bold">
                  <i class="fas fa-edit"></i>&nbsp;&nbsp;Review Write
               </h2>
            </div>
         </div>

         <div id="writeForm" class="col-sm-12" style="height: 80%;">
           

            <div class="row">
               <div class="col-md-2"></div>
               <div class="col-md-8">
                  <form action="ReviewAdd.do" method="post" name="review" id="review" enctype="multipart/form-data">
                     <table class="table">
                        <tr>
                           <td><h6>Title</h6></td>
                           <td><input type="text" class="form-control" name="title" id="title"></td>
                        </tr>
                        
                          <tr>
                           <td><h6>Writer</h6></td>  <!-- hidden으로 숨길까? -->
                           <td><input type="text" class="form-control" name="id" id="id" value="${sessionScope.id}" readonly></td>
                        </tr>

                        <tr>
                           <td><h6>Content</h6></td>
                           <td><textarea rows="100" cols="100" name="content" id="content" class="form-control ckeditor" style="height:500; overflow:visible;"></textarea></td>
                        </tr>

                        <tr>
                           <td><h6>File</h6></td>
                           <td><input type="file" name="filename"></td>
                        </tr>
                        <tr>
                        
                    <tr id="dataForM">
                        <!-- 202 : 후기파일 게시판  -->
                        <td width="80%" align="left"><input type="hidden" id="bcode"  name="bcode" value='${param.bcode}'></td>
                        <!-- tcode : 0 거래없음 -->
                        <td width="80%" align="left"><input type="hidden" id="tcode" type="text" name="tcode" value='${param.tcode}'></td>                      
                    </tr>
                        
                  <tr>
                           <td colspan="2" class="text-center">
                              <button type=submit id="reviewbtn" class="btn dorne-btn" style="width: 200px;" onclick="check()" >
                                 <i class="far fa-check-circle"></i>&nbsp;&nbsp;글쓰기
                              </button>
                              <button type="reset" class="btn dorne-btn" style="width: 200px;">
                                 <i class="far fa-times-circle"></i>&nbsp;초기화
                              </button>
                              <a href="ReviewList.do?bcode=202&tcode=0">
                              
                              <button type="button" class="btn dorne-btn">전체 게시글보기</button></a>
                           </td>
                        </tr>

                     </table>
                  </form>
               </div>
            </div>

         </div>

      </article>
   </section>

   </body>
   <jsp:include page="/common/bottom.jsp"></jsp:include>
   
       <script>
    ClassicEditor
        .create( document.querySelector( '#content' ) );
       
    </script>
</html>