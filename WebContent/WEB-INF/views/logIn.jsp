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

    <!-- Title -->
    <title>Camping Easy</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
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
	text-align:center;
	margin: 5px;
	padding: 1px;
	height: 350px;
}

#loginboxinnerbox {
	display:inline-block;
	top: 10px;
	width: 50%;
	margin: 2px;
}

#footer2 {
	positon: fixed;
	bottom: 1px;
	margin: 1px;
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
#container{
   min-width: 600px;
   }
</style>
</head>
<body>
 <div class="breadcumb-area bg-img bg-overlay" id='container' style="background-image: url(img/bg-img/hero.jpg)"> 
 <section  style="padding-top: 200px;">
	<div class="" id="mydiv">

		<div class="animatedParent" id="myString">
			<div class="section-heading text-center animated fadeInDown">
			</div>
		</div>
		<div class="" id="loginboxdiv">
			<div class="login-box well" id="loginboxinnerbox">
				<h2 class="h-bold">Login Page</h2>
				<form action="LoginOk.do" name="loginForm" id="loginForm"
					role="form" method="post" style="width: 50%; margin-left: 25%">

					<div class="form-group">
						<label for="id">ID</label> 
						<input type="text" name="id" id="id" placeholder="ID" class="form-control" />
					</div>
					<div class="form-group">
						<label for="pwd">Password</label> 
						<input type="password" name="pwd" id="pwd" placeholder="Password" class="form-control" />
					</div>
					<hr>
					
					<div>
						<input type="submit" class="btn dorne-btn" style ="width: 50px;" value="로그인">
                        <input type="button" id='comeback' class="btn dorne-btn" style ="width: 50px;" value="돌아가기">
				   </div>
					
				</form>
			</div>
		</div>

	</div>
	</section>

	<jsp:include page="/common/bottom.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
$('#comeback').click(function(){
	history.back();
})
</script>
</html>