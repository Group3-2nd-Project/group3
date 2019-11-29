
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
		
		
		
		//console.log(tableCode);
		console.log("이거 왜 안돼");
		
		//$('#myform').attr("action","boardList.do?bcode="+tableCode); //
		
		//$('#bcode').val(tableCode);
		//$('#tcode').val(tradeCode);
		
		//console.log($('#bcode').val());
		
		
		if(tableCode == 102) {
			$('#file1').css("display", "block");
			$('#tcode').val(0);
		}else if(tableCode == 201) {
			$('#tcode').val(1);
		}
		
		
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
            <form id="myform" action='boardEdit.do' name="bbs"  method="POST">
            
        		<c:set var="board" value="${requestScope.boarddetail }"> </c:set>
        		
        		
                <table width="95%" border="3" align="center">
                    <tr>
                        <td width="20%" align="center">제목</td>
                        <td width="80%" align="left"><input type="text" name="subject" size="40" value="${board.title }"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글쓴이</td>
                        <td width="80%" align="left"><input id="user" type="text" name="writer" size="40" value="${board.id }"  readonly></td>
                    </tr>
                    
                    
                    <tr>
                        <td width="20%" align="center">글내용</td>
                        <td width="80%" align="left"><textarea id="summernote" rows="10" cols="60" name="content">${board.content }</textarea></td>
                    </tr>
                    
                    <tr id="file1">
                        <td width="20%" align="center">첨부파일</td>
                        <td width="80%" align="left"><input type="file" name="filename"></td>                       
                    </tr>
                    
                    <tr id="dataForM">
                        <td width="20%" align="center">게시판코드</td>
                        <td width="80%" align="left"><input id="bcode" type="text" name="bcode" value='${board.bcode }'></td>
                        <td width="20%" align="center">거래코드</td>
                        <td width="80%" align="left"><input id="tcode" type="text" name="tcode" value='${board.tcode }'></td>
                        <td width="20%" align="center">답글 쓸 때 원본글 번호</td>
                        <td width="80%" align="left"><input id="tcode" type="text" name="idx" value='${board.idx }'></td>
                        <td>
                        <input id="bcode" type="hidden" name="ps" value='${board.ps }'>                        
                        <input id="tcode" type="hidden" name="cp" value='${board.cp }'>                       
                        <input id="tcode" type="hidden" name="zcode" value='0'> 
                        </td>                       
                    </tr>
                    <tr>
                     
                   
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" value="수정완료" onclick="check();" /> 
                            <input type="button"  value="목록" onclick="mylist();" />
                        </td>
                    </tr>
                    
                </table>
              </form>
        </div>
    </div>
    </section>

</body>
<script type="text/javascript">
function mylist(){
	
	document.location.href ='/CampingEasy/boardList.do?cp='+ ${board.cp}+'&ps='+ ${board.ps}+'&bcode=401&zcode=0';
}
</script>
<jsp:include page="/common/bottom.jsp"></jsp:include>
</html>