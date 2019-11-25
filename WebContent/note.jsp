
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
<!--     <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script> 
 -->

	<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
	 </HEAD>
	 <BODY>
	    <!-- 2. TEXT 편집 툴을 사용할 textarea -->
	    
	 
<!-- 	/* $(function() {
	    $('#summernote').summernote();
	});
	
	function check(){
	    if(!bbs.subject.value){
	        alert("제목을 입력하세요");
	        bbs.subject.focus();
	        return false;
	    }
	    if(!bbs.writer.value){
	        
	        alert("이름을 입력하세요");
	        bbs.writer.focus();
	        return false;
	    }
  if(!bbs.content.value){            
        alert("글 내용을 입력하세요");
        bbs.content.focus();
        return false;
    }
    if(!bbs.pwd.value){            
        alert("비밀번호를 입력하세요");
        bbs.pwd.focus();
        return false;
    }
    document.bbs.submit();
} */ -->



</head>
	 
<jsp:include page="/common/top.jsp"></jsp:include>
<body>

 <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)"> 
   <section style ="padding-top:50px; padding-bottom:150px;">  
    <div id="pageContainer">
  
        <div style="padding-top: 200px; padding-left : 100px; text-align: center">
        
           	 <!-- <div id="summernote">Hello Summernote</div> -->
            <!-- form 시작 ---------->
            <form name="bbs" action="board_writeok.jsp" method="POST">
        
                <table width="95%" border="3" align="center">
                    <tr>
                        <td width="20%" align="center">제목</td>
                        <td width="80%" align="left"><input type="text" name="subject" size="40"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글쓴이</td>
                        <td width="80%" align="left"><input type="text" name="writer" size="40"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">이메일</td>
                        <td width="80%" align="left"><input type="text" name="email" size="40"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">홈페이지</td>
                        <td width="80%" align="left"><input type="text" name="homepage" size="40" value="http://"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글내용</td>
                        <td width="80%" align="left"><textarea id="editor" rows="10" cols="60" name="content" class="ckeditor"></textarea></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">비밀번호</td>
                        <td width="80%" align="left"><input type="password" name="pwd" size="20"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">첨부파일</td>
                        <td width="80%" align="left"><input type="file" name="filename"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" value="글쓰기" onclick="check();" /> 
                            <input type="reset"  value="다시쓰기" />
                        </td>
                    </tr>
                </table>
              </form>
        </div>
    </div>
    </section>

</body>
   <script>
	    // 3. CKEditor5를 생성할 textarea 지정
	    ClassicEditor
	        .create( document.querySelector( '#editor' ));
	         
	    </script>
	
<jsp:include page="common/bottom.jsp"></jsp:include>
</html>