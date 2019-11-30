<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.dto.Member"%>
<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%request.setCharacterEncoding("UTF-8"); %>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Camping Easy</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="icon" href="img/core-img/favicon.ico">
    <link href="style.css" rel="stylesheet">
    <link href="css/responsive/responsive.css" rel="stylesheet">

</head>

<jsp:include page="/common/top.jsp"></jsp:include>


<style type="text/css">

section{
   text-align: center;

}
#mydiv {
   margin-top: 10px;
   margin-bottom: 110px;
   padding: 1px;
}

#loginboxdiv {
   position: relative;
   margin: 5px;
   padding: 1px;
   height: 350px;
}

#loginboxinnerbox {
   position: absolute;
   left: 40%;
   top: 10px;
   width: 300px;
   margin: 2px;
}

#footer2 {
   positon: fixed;
   bottom: 1px;
   margin: 1px;
}

#formBtn {
   text-align: center;
}

#myString {
   margin-top: 50px;
   margin-bottom: 1px;
}

button{
     background-color: #6b8e23;
     width: 100px;
     height: 50px;
     text-color: white;
     hover : #deb887;
   }
   th {
   text-align: center;
}

#div2 {
   width: auto;
   text-align: center;
   top: 10%;
   left: 10%;
}
   
</style>

<script type="text/javascript">
 $(document).ready(function(){
   
   //사번으로 검색
   $('#idsearch').click(function(){
      
      if($('#id').val() == ""){
         alert("아이디를 입력해주세요.");
         $('#id').focus();
      }else{
      
         $.ajax(
            {
               url:"idsearch.do", //Ex10_ok.jsp   
               data:{id:$('#id').val()}, //MemoId?id=aa
               dataType:"json", //xml , json , script , html , text
               success:function(responsedata){
                 // $('#empsearch').empty();
                  $('#tbody').empty();
                  console.log(responsedata);
                  console.log(responsedata.id);
                  var str = "";
                  str += "<tr>";
                  str += "<td align='center'><a href='MemberDetail.do?id="+responsedata.id+"'>" + responsedata.id + "</a></td>";
                  str += "<td align='center'>" + responsedata.pwd + "</td>";
                  str += "<td align='center'>" + responsedata.name + "</td>";
                  str += "<td align='center'>" + responsedata.hp + "</td>";
                  str += "<td align='center'>" + responsedata.grade + "</td>";
                  /* str += "<td colspan='2'><a href='MemberEdit.do?id=" */
                  str += "<td colspan='2' align='center'><a href='MemberEdit.do?id="
                  str += responsedata.id +"'"; 
                  str += "class='btn'; style='height: 35; width:60; background-color:#125448; color: white'>수정 </a>&nbsp;&nbsp";
                  str += "<a href='MemberDelete.do?id="
                  str += responsedata.id+"'"; 
                  str += "class='btn'; style='height: 35; width:60; background-color:#125448; color: white'>삭제</a>";
                  str += "</td></tr>";
                  console.log(str);
                    $('#tbody').append(str);
               },
               error:function(){
               }
            }      
         );
      };
   });

         

   // 부서번호로 검색
   $('#namesearch').click(function(){
      //console.log($('#deptno').val());
      
      if($('#name').val() == ""){
         alert("이름을 입력하세요");
         $('#name').focus();
      }else{
      // empno ,ename , sal , job, comm, deptno
         $.ajax(
            {
               url:"namesearch.do", //Ex10_ok.jsp   
               data:{name:$('#name').val()}, //MemoId?id=aa
               dataType:"json", //xml , json , script , html , text
               type:"get",
               success:function(responsedata){
                  console.log(responsedata);
                  //$('#empsearch').empty();
                  $('#tbody').empty();
                  
                   $.each(responsedata,function(index, obj) {
                     console.log(obj.name);
                     var str = "";
                     str += "<tr>";
                           str += "<td align='center'><a href='MemberDetail.do?id="+obj.id+"'>" + obj.id + "</a></td>";
                           str += "<td align='center'>" + obj.pwd + "</td>";
                           str += "<td align='center'>" + obj.name + "</td>";
                           str += "<td align='center'>" + obj.hp + "</td>";
                           str += "<td align='center'>" + obj.grade + "</td>";
                           str += "<td colspan='2' align='center'><a href='MemberEdit.do?id="
                           str += obj.id +"'"; 
                           str += "class='btn'; style='height: 35; width:60; background-color:#125448; color: white'>수정 </a>&nbsp;&nbsp";
                           str += "<a href='EmpDelete.do?id="
                           str += obj.id +"'"; 
                           str += "class='btn'; style='height: 35; width:60; background-color:#125448; color: white'>삭제</a>";
                           str += "</td></tr>";
                           
                             $('#tbody').append(str);
   
                  });
               },
               error:function(xhr){
                  alert(xhr.status);
               }
            }      
         );
   
   
}
   });
});
      

</script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
    
   <c:set var="pagesize" value="${requestScope.pagesize }" />
   <c:set var="cpage" value="${requestScope.cpage }" />
   <c:set var="pagecount" value="${requestScope.pagecount }" />
   <c:set var="list2" value="${requestScope.list2 }"/>
   <c:set var="totalboardCount" value="${requestScope.totalboardCount }"/>

 <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)"> 
 <section  style="padding-top: 200px;">
   ID : 
   
    <input type="text" size="20" id="id" name="id" style="height: 33; width:185">
    <input class="btn" type="button" value="검색" id="idsearch" style="height: 35; width:60; background-color:#125448; color: white">
    <!--  <input type="button" value="검색" id="idsearch" class="btn dorne-btn"> --> 
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        이름 : 
      <input type="text" size="20" id="name" name="name" style="height: 33; width:185">
      <input class="btn" type="button" value="검색" id="namesearch" style="height: 35; width:60; background-color:#125448; color: white">
     <br>
<br>
<br>


            <h3 style="text-align: center">Member List</h3>
      <table id = "membersearch" class="table table-hover" style="width: 1000px; height: 100%;  margin-left: auto; margin-right: auto;">
         <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>회원등급</th>
         <th colspan="2">회원정보 수정 및 삭제</th>
         </tr>
         
         <tbody id="tbody" style="height:100%">
         <c:forEach var="list" items="${requestScope.list2}"> 
         <tr>
         <td align="center">
            <a href='MemberDetail.do?id=${list.id}'>${list.id}</a>
         </td>
         <td align="center">${list.pwd}</td>
         <td align="center">${list.name}</td>
         <td align="center">${list.hp}</td>
         <td align="center">${list.grade}</td>
         <td colspan="2" align="center">     
   <a href="MemberEdit.do?id=${list.id}" class="btn" style="height: 35; width:60; background-color:#125448; color:white">수정 </a>&nbsp;&nbsp;
        <a href="MemberDelete.do?id=${list.id}" class="btn" style="height: 35; width:60; background-color:#125448; color:white">삭제</a>
         </td>
         </tr>
         
         </c:forEach>
          </tbody>
             <tr>
                <td colspan="2">
      <form name="list2">
         <select class="form-control" style="width:80px" name="ps" onchange="submit()">
               <c:forEach var="i" begin="5" end="20" step="5">
                  <c:choose>
                  <c:when test="${pagesize == i}">
                            <option value='${i}' selected>${i}건</option>
                        </c:when>
               <c:otherwise>
                       <option value='${i}'>${i}건</option>
                  </c:otherwise>
            </c:choose>
            </c:forEach>
       </select>
      </form>
         </td>
               <td colspan="4" align="center">
                  <!--이전 링크 --> 
                  <c:if test="${cpage>1}">
                     <a href="GetMemberList.do?cp=${cpage-1}&ps=${pagesize}">이전</a>
                     <!--페이지 리스트 구현  -->
                  </c:if> 
                  <c:forEach var="i" begin="1" end="${pagecount}" step="1">
                     <c:choose>
                        <c:when test="${cpage==i}">
                           <font color='red'>[${i}]</font>
                        </c:when>
                        <c:otherwise>
                           <a href="GetMemberList.do?cp=${i}&ps=${pagesize}">[${i}]</a>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach> 
                  <!--다음 링크 --> 
                  <c:if test="${cpage<pagecount}">
                     <a href="GetMemberList.do?cp=${cpage+1}&ps=${pagesize}">다음</a>
                  </c:if>
               </td>
               <td colspan="1" align="center" style="text-align: right;">총 회원수 :${requestScope.totalboardCount }
               </td>
            </tr>
</table>
<!--      
   <div class="" id="mydiv">
      <div class="" id="loginboxdiv">
         <div class="login-box well" id="loginboxinnerbox">
         </div>
      </div>

   </div>
 -->   </section>

   <jsp:include page="/common/bottom.jsp"></jsp:include>
   </div>
</body>
</html>