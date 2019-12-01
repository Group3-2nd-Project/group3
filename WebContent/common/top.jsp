<!-- 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%request.setCharacterEncoding("UTF-8"); %>
<body> 
  <c:set var="id" value="${sessionScope.id}"/> 
  <c:set var="grade" value="${sessionScope.grade}"/> 
    <!-- ***** Header Area Start ***** -->
    <header class="header_area" id="header" style= "padding:0 0 0 0; margin:0 0 0 0;">
        <div class="container-fluid h-100" style= "padding:0 0 0 0; margin:0 0 0 0;">
            <div class="row h-100" style= "padding:0 0 0 0; margin:0 0 0 0;">
                <div class="col-12 h-100"  style= "padding:0 0 0 0; margin:0 0 0 0;">
                    <nav class="h-100 navbar navbar-expand-lg" style= "padding:0 0 0 0; margin:0 0 0 0;">
                        <a class="navbar-brand" href="index.jsp" style= "padding:0 0 0 0; margin:0 0 0 0;"><img src="img/main.png" alt="" style= "padding:0 0 0 0; margin:0 0 0 0;"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation" style= "padding:0 0 0 0; margin:0 0 0 0;"><span class="fa fa-bars" style= "padding:0 0 0 0; margin:0 0 0 0;"></span></button>
                        <!-- Nav -->
                        <div class="collapse navbar-collapse" id="dorneNav">
                            <ul class="navbar-nav mr-auto" id="dorneMenu">
                                <li class="nav-item">
                                    <a class="nav-link" href="GoMain.do" style= "padding:20 20 20 20; margin:0 0 0 0;">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="MainCampingview.do"style= "padding:20 20 20 20; margin:0 0 0 0;" >Search</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ReviewList.do?bcode=202&tcode=0&cp=1&ps=5"style= "padding:20 20 20 20; margin:0 0 0 0;" >Review</a>
                                </li>
                                 <li class="nav-item">
                                     <a class="nav-link" href="TradeList.do?bcode=102" style= "padding:20 20 20 20; margin:0 0 0 0;">Trade</a>
                                </li>
                                <li class="nav-item">
                                <a class="nav-link" href="boardList.do?bcode=303&cp=1&ps=10&zcode=0" style= "padding:20 20 20 20; margin:0 0 0 0;">Notice</a>
                                </li>
                                <li class="nav-item">
                                <a class="nav-link" href="boardList.do?bcode=401&cp=1&ps=10&zcode=0" style= "padding:20 20 20 20; margin:0 0 0 0;">Q&A</a>
                                </li>
                                 <!-- <li>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 </li> -->
                                </ul>
                        </div>

                                     <div class="collapse navbar-collapse" id="dorneNav">
                                     <ul class="navbar-nav mr-auto" id="dorneMenu" style = "margin-left: 50%;">
                                   <c:choose>
                               <c:when test="${id!=null && grade == '2'}">
                               <li class="nav-item">
                               <a class="nav-link" href="LogOut.do" >Logout</a>
                               </li>
                               <li class="nav-item">
                               <a class="nav-link" href="GetMemberList.do" >Memberlist</a>
                               </li>
                                   </c:when>  
                                    <c:when test="${id!=null && grade == '1'}">
                                    <li class="nav-item">
                                    <a class="nav-link" href="LogOut.do" >Logout</a>
                                    </li>
                                    <li class="nav-item">
                                    <a class="nav-link" href="MyPage.do">Mypage</a>
                                    </li>
                                       </c:when> 
                                 <c:otherwise>
                                 <li class="nav-item">
                                 <a class="nav-link" href="LogIn.do" >Login</a>
                                 </li>
                                 <li class="nav-item">
                                 <a class="nav-link" href="SignUp.do" >Signup</a>
                                 </li>
                                 </c:otherwise>
                        </c:choose>
                              </ul>
                              </div>
                              
                              
                       
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
</body>