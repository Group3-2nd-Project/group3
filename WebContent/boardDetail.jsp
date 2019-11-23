
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 	

<!DOCTYPE html>
<html lang="en">

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


	<script type="text/javascript" src="../ckeditor/ckeditor.js" ></script>
	<link rel="Stylesheet" href="../style/default.css" />
	
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>



	<SCRIPT type="text/javascript">
	
	//유저가 답글을 쓰는 버튼을 눌럿을 경우...   폼 태그에...  어느글에 답글을 쓰고 있는지... 답글을 쓰는 사람의 정보를 답글을 쓰는 뷰단으로 보내 줘야함다.
	// 요 폼태그의 액션값을 지정하는 것은  스크립트에서 처리 하면 되겠지... 현재 이 글을 보고 있는 유저의 아이디.. 그리고 이 글의 번호만 보내 주면.. 끝..
	// 아... 아이디는 구지 보낼 필요가 없겠는데... 로그인....하면.. 이민 세션 값에 저장이 되어 있을 테고.. 아이디 엑스만 보내면 되겠는데...
	
	
</SCRIPT>

	
<style type="text/css">
#notice1 {
display : none;
}

#file1 {
display : none;
}
#dataForM {
display : none;
}

</style>	
</head>
	 
<jsp:include page="/common/top.jsp"></jsp:include>
<body>

 <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)"> 
   <section style ="padding-top:50px; padding-bottom:150px;">  
    <div id="pageContainer">
  
        <div style="padding-top: 200px; padding-left : 100px; text-align: center">
        
           	 <!-- <div id="summernote">Hello Summernote</div> -->
            <!-- form 시작 ---------->
           
        
                <table width="95%" border="3" align="center">
                
                <c:set var="board" value='${requestScope.boarddetail}'></c:set>
                    <tr>
                        <td width="20%" align="center">제목</td>
                        <td width="80%" align="left"><input type="text" name="subject" size="40" value='${board.title}' readonly></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글쓴이</td>
                        <td width="80%" align="left"><input id="user" type="text" name="writer" size="40" value='${board.id}' readonly></td>
                    </tr>
                    
                    
                    <tr>
                        <td width="20%" align="center">글내용</td>
                        <td width="80%" align="left"><textarea id="summernote" rows="10" cols="60" name="content" readonly>${board.content} </textarea></td>
                    </tr>
                    
                    <tr id="file1">
                        <td width="20%" align="center">첨부파일</td>
                        <td width="80%" align="left"><input type="file" name="filename"></td>                       
                    </tr>
                    
                    <tr id="dataForM">
                        <td width="20%" align="center">게시판코드</td>
                        <td width="80%" align="left"><input id="bcode" type="text" name="bcode"></td>
                        <td width="20%" align="center">거래코드</td>
                        <td width="80%" align="left"><input id="tcode" type="text" name="tcode"></td>
                                               
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                        <form id="reply" method="get" target="_blank">
        				 <button type="submit">답글 쓰기</button>
      					</form>
      					
      					<form action="https://www.w3docs.com/" method="get" target="_blank">
        				 <button type="submit">목록</button>
      					</form>
                            
                            
                        </td>
                    </tr>
                </table>
             
        </div>
    </div>
    </section>

</body>
<jsp:include page="/common/bottom.jsp"></jsp:include>
</html>