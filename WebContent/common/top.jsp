<!-- 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%request.setCharacterEncoding("UTF-8"); %>
<body> 
  <c:set var="id" value="${sessionScope.id}"/> 
  <c:set var="grade" value="${sessionScope.grade}"/> 
    <!-- ***** Header Area Start ***** -->
    <header class="header_area" id="header">
        <div class="container-fluid h-100">
            <div class="row h-100">
                <div class="col-12 h-100">
                    <nav class="h-100 navbar navbar-expand-lg">
                        <a class="navbar-brand" href="index.jsp"><img src="img/core-img/15.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                        <!-- Nav -->
                        <div class="collapse navbar-collapse" id="dorneNav">
                            <ul class="navbar-nav mr-auto" id="dorneMenu">
                                <li class="nav-item">
                                    <a class="nav-link" href="GoMain.do">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="MainCampingview.do" >Search</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ReviewList.do?bcode=202&tcode=0&cp=1&ps=5" >Review</a>
                                </li>
                                 <li class="nav-item">
                                     <a class="nav-link" href="TradeList.do?bcode=102">Trade</a>
                                </li>
                                <li class="nav-item">
                                <a class="nav-link" href="boardList.do?bcode=303&cp=1&ps=10&zcode=0">Notice</a>
                                </li>
                                <li class="nav-item">
                                <a class="nav-link" href="boardList.do?bcode=401&cp=1&ps=10&zcode=0" >Q&A</a>
                                </li>
                                 <!-- <li>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 </li> -->
                                </ul>
                        </div>

                                     <div class="collapse navbar-collapse" id="dorneNav">
                                     <ul class="navbar-nav mr-auto" id="dorneMenu" style = "margin-left: 300px;">
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