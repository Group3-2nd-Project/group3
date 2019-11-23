
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% session.setAttribute("id", "csy"); %>
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
	
	
	$(function(){
		
		var id = '<%= session.getAttribute("id") %>'; 
		console.log(id);
		$('#user').val(id);
		console.log($('#user').val());
		
		
		if(id == "admin") {
			$('#notice1').css("display", "block");
		}
		
		var tableCode = <%=request.getParameter("bcode")%>;
		var tradeCode = <%=request.getParameter("tcode")%>;
		
		console.log(tableCode);
		console.log("이거 왜 안돼");
		
		//$('#myform').attr("action","boardList.do?bcode="+tableCode); //
		
		$('#bcode').val(tableCode);
		$('#tcode').val(tradeCode);
		
		console.log($('#bcode').val());
		
		
		if(tableCode == 102) {
			$('#file1').css("display", "block");
			$('#tcode').val(0);
		}else if(tableCode == 201) {
			$('#tcode').val(1);
		}
		
		
	});
	
	
	
	
	
	$(document).ready(function() {
	    //$('#summernote').summernote();
	});
	
	function check(){
	    if(!bbs.subject.value){
	        alert("제목을 입력하세요");
	        bbs.subject.focus();
	        return false;
	    }
	    
     if(!bbs.content.value){            
        alert("글 내용을 입력하세요");
        bbs.content.focus();
        return false;
    } 
    
    document.bbs.submit();
}


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
            <form id="myform" action='boardWrite.do' name="bbs"  method="POST">
        
                <table width="95%" border="3" align="center">
                    <tr>
                        <td width="20%" align="center">제목</td>
                        <td width="80%" align="left"><input type="text" name="subject" size="40"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글쓴이</td>
                        <td width="80%" align="left"><input id="user" type="text" name="writer" size="40"   readonly></td>
                    </tr>
                    
                    
                    <tr>
                        <td width="20%" align="center">글내용</td>
                        <td width="80%" align="left"><textarea id="summernote" rows="10" cols="60" name="content"></textarea></td>
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
<jsp:include page="/common/bottom.jsp"></jsp:include>
</html>