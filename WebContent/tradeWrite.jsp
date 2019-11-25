
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
<script>
function check(){
  /*   if(!bbs.title.value){
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
                  <i class="fas fa-edit"></i>&nbsp;&nbsp;Trade Write
               </h2>
            </div>
         </div>

         <div id="writeForm" class="col-sm-12" style="height: 80%;">
            <!-- <form role="form" action="TradeWrite.do" method="post" id="review"></form> -->


            <div class="row">
               <div class="col-md-2"></div>
               <div class="col-md-8">
                  <form action="TradeWrite.do" method="post" enctype="multipart/form-data">
                     <table class="table">
                      
                          <input type="hidden" class="form-control" name="bcode" value = "${param.bcode}">
                          <input type="hidden" class="form-control" name="tcode" value = "${param.tcode}">
                           
                           <tr>
                           <td><h6>Writer</h6></td>
                           <td><input type="text" class="form-control" id = "id" name="id" value = "${sessionScope.id}" readonly></td>
                           
                        </tr>
                        <tr>
                           <td><h6>Title</h6></td>
                           <td><input type="text" class="form-control" name="title"></td>
                           
                        </tr>

                        <tr>
                           <td><h6>Content</h6></td>
                           <td><textarea rows="200" cols="100" name="content" id="editor" class="form-control ckeditor" style ="height:500px;"></textarea></td>
                        </tr>

                        <tr>

                           <td><h6>File</h6></td>
                           <td><input type="file" name="filename"></td>
                        </tr>
                        <tr>

                           <td colspan="2" class="text-center">
                              <button type="submit" id="join-submit" onclick="click();" class="btn dorne-btn" style="width: 200px;">
                                                              판매등록하기<i class="far fa-check-circle"></i></button>
                              <button type="reset" class="btn dorne-btn" style="width: 200px;">
                                 <i class="far fa-times-circle"></i>&nbsp;초기화
                              </button>
                              <button type="button" class="btn dorne-btn">전체 판매글 보기</button>
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
 
   
       <script>
    ClassicEditor
        .create( document.querySelector('#editor'));
    </script>
      <jsp:include page="/common/bottom.jsp"></jsp:include>
</html>