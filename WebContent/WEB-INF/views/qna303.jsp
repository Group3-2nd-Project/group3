<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->



<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link href="style.css" rel="stylesheet">

<!-- Responsive CSS -->
<link href="css/responsive/responsive.css" rel="stylesheet">


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>




</head>
<!------ Include the above in your HEAD tag ---------->

<style type="text/css">
.mail-box {
	border-collapse: collapse;
	border-spacing: 0;
	display: table;
	table-layout: fixed;
	width: 100%;
}

.mail-box aside {
	display: table-cell;
	float: none;
	height: 100%;
	padding: 0;
	vertical-align: top;
}

.mail-box .sm-side {
	background: none repeat scroll 0 0 #e5e8ef;
	border-radius: 4px 0 0 4px;
	width: 25%;
}

.mail-box .lg-side {
	background: none repeat scroll 0 0 #fff;
	border-radius: 0 4px 4px 0;
	width: 75%;
}

.mail-box .sm-side .user-head {
	background: none repeat scroll 0 0 #125448;
	border-radius: 4px 0 0;
	color: #fff;
	min-height: 80px;
	padding: 10px;
}

.user-head .inbox-avatar {
	float: left;
	width: 65px;
}

.user-head .inbox-avatar img {
	border-radius: 4px;
}

.user-head .user-name {
	display: inline-block;
	margin: 0 0 0 10px;
}

.user-head .user-name h5 {
	font-size: 14px;
	font-weight: 300;
	margin-bottom: 0;
	margin-top: 15px;
}

.user-head .user-name h5 a {
	color: #fff;
}

.user-head .user-name span a {
	color: #87e2e7;
	font-size: 12px;
}

a.mail-dropdown {
	background: none repeat scroll 0 0 #80d3d9;
	border-radius: 2px;
	color: #01a7b3;
	font-size: 10px;
	margin-top: 20px;
	padding: 3px 5px;
}

.inbox-body {
	padding: 20px;
}

.btn-compose {
	background: none repeat scroll 0 0 #ff6c60;
	color: #fff;
	padding: 12px 0;
	text-align: center;
	width: 100%;
}

.btn-compose:hover {
	background: none repeat scroll 0 0 #f5675c;
	color: #fff;
}

ul.inbox-nav {
	display: inline-block;
	margin: 0;
	padding: 0;
	width: 100%;
}

.inbox-divider {
	border-bottom: 1px solid #d5d8df;
}

ul.inbox-nav li {
	display: inline-block;
	line-height: 45px;
	width: 100%;
}

ul.inbox-nav li a {
	color: #6a6a6a;
	display: inline-block;
	line-height: 45px;
	padding: 0 20px;
	width: 100%;
}

ul.inbox-nav li a:hover, ul.inbox-nav li.active a, ul.inbox-nav li a:focus
	{
	background: none repeat scroll 0 0 #d5d7de;
	color: #6a6a6a;
}

ul.inbox-nav li a i {
	color: #6a6a6a;
	font-size: 16px;
	padding-right: 10px;
}

ul.inbox-nav li a span.label {
	margin-top: 13px;
}

ul.labels-info li h4 {
	color: #5c5c5e;
	font-size: 13px;
	padding-left: 15px;
	padding-right: 15px;
	padding-top: 5px;
	text-transform: uppercase;
}

ul.labels-info li {
	margin: 0;
}

ul.labels-info li a {
	border-radius: 0;
	color: #341a79;
}

ul.labels-info li a:hover, ul.labels-info li a:focus {
	background: none repeat scroll 0 0 #d5d7de;
	color: #6a6a6a;
}

ul.labels-info li a i {
	padding-right: 10px;
}

.nav.nav-pills.nav-stacked.labels-info p {
	color: #341a79;
	font-size: 11px;
	margin-bottom: 0;
	padding: 0 22px;
}

.inbox-head {
	background: none repeat scroll 0 0 #eaedea;
	border-radius: 0 4px 0 0;
	color: #fff;
	min-height: 80px;
	padding: 20px;
}

.inbox-head h3 {
	display: inline-block;
	font-weight: 300;
	margin: 0;
	padding-top: 6px;
}

.inbox-head .sr-input {
	border: medium none;
	border-radius: 4px 0 0 4px;
	box-shadow: none;
	color: #341a79;
	float: left;
	height: 40px;
	padding: 0 10px;
}

.inbox-head .sr-btn {
	background: none repeat scroll 0 0 #125448;
	border: medium none;
	border-radius: 0 4px 4px 0;
	color: #fff;
	height: 40px;
	padding: 0 20px;
}

.table-inbox {
	border: 1px solid #d3d3d3;
	margin-bottom: 0;
}

.table-inbox tr td {
	padding: 12px !important;
}

.table-inbox tr td:hover {
	cursor: pointer;
}

.table-inbox tr td .fa-star.inbox-started, .table-inbox tr td .fa-star:hover
	{
	color: #f78a09;
}

.table-inbox tr td .fa-star {
	color: #d5d5d5;
}

.table-inbox tr.unread td {
	background: none repeat scroll 0 0 #f7f7f7;
	font-weight: 600;
}

ul.inbox-pagination {
	float: right;
}

ul.inbox-pagination li {
	float: left;
}

.mail-option {
	display: inline-block;
	margin-bottom: 10px;
	width: 100%;
}

.mail-option .chk-all, .mail-option .btn-group {
	margin-right: 5px;
}

.mail-option .chk-all, .mail-option .btn-group a.btn {
	background: none repeat scroll 0 0 #fcfcfc;
	border: 1px solid #e7e7e7;
	border-radius: 3px !important;
	color: #afafaf;
	display: inline-block;
	padding: 5px 10px;
}

.inbox-pagination a.np-btn {
	background: none repeat scroll 0 0 #fcfcfc;
	border: 1px solid #e7e7e7;
	border-radius: 3px !important;
	color: #afafaf;
	display: inline-block;
	padding: 5px 15px;
}

.mail-option .chk-all input[type="checkbox"] {
	margin-top: 0;
}

.mail-option .btn-group a.all {
	border: medium none;
	padding: 0;
}

.inbox-pagination a.np-btn {
	margin-left: 5px;
}

.inbox-pagination li span {
	display: inline-block;
	margin-right: 5px;
	margin-top: 7px;
}

.fileinput-button {
	background: none repeat scroll 0 0 #eeeeee;
	border: 1px solid #e6e6e6;
}

.inbox-body .modal .modal-body input, .inbox-body .modal .modal-body textarea
	{
	border: 1px solid #e6e6e6;
	box-shadow: none;
}

.btn-send, .btn-send:hover {
	background: none repeat scroll 0 0 #00a8b3;
	color: #fff;
}

.btn-send:hover {
	background: none repeat scroll 0 0 #009da7;
}

.modal-header h4.modal-title {
	font-family: "Open Sans", sans-serif;
	font-weight: 300;
}

.modal-body label {
	font-family: "Open Sans", sans-serif;
	font-weight: 400;
}

.heading-inbox h4 {
	border-bottom: 1px solid #ddd;
	color: #444;
	font-size: 18px;
	margin-top: 20px;
	padding-bottom: 10px;
}

.sender-info {
	margin-bottom: 20px;
}

.sender-info img {
	height: 30px;
	width: 30px;
}

.sender-dropdown {
	background: none repeat scroll 0 0 #eaeaea;
	color: #777;
	font-size: 10px;
	padding: 0 3px;
}

.view-mail a {
	color: #ff6c60;
}

.attachment-mail {
	margin-top: 30px;
}

.attachment-mail ul {
	display: inline-block;
	margin-bottom: 30px;
	width: 100%;
}

.attachment-mail ul li {
	float: left;
	margin-bottom: 10px;
	margin-right: 10px;
	width: 150px;
}

.attachment-mail ul li img {
	width: 100%;
}

.attachment-mail ul li span {
	float: right;
}

.attachment-mail .file-name {
	float: left;
}

.attachment-mail .links {
	display: inline-block;
	width: 100%;
}

.fileinput-button {
	float: left;
	margin-right: 4px;
	overflow: hidden;
	position: relative;
}

.fileinput-button input {
	cursor: pointer;
	direction: ltr;
	font-size: 23px;
	margin: 0;
	opacity: 0;
	position: absolute;
	right: 0;
	top: 0;
	transform: translate(-300px, 0px) scale(4);
}

.fileupload-buttonbar .btn, .fileupload-buttonbar .toggle {
	margin-bottom: 5px;
}

.files .progress {
	width: 200px;
}

.fileupload-processing .fileupload-loading {
	display: block;
}

* html .fileinput-button {
	line-height: 24px;
	margin: 1px -3px 0 0;
}

*+html .fileinput-button {
	margin: 1px 0 0;
	padding: 2px 15px;
}

@media ( max-width : 767px) {
	.files .btn span {
		display: none;
	}
	.files .preview * {
		width: 40px;
	}
	.files .name * {
		display: inline-block;
		width: 80px;
		word-wrap: break-word;
	}
	.files .progress {
		width: 20px;
	}
	.files .delete {
		width: 60px;
	}
}

ul {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
}
</style>
<script type="text/javascript">

$(function() {	
	var pagesize = $('#pagesize :selected').val();
	var currentpage = Math.ceil($('#indexend').text() / pagesize);
	
	console.log("온로드 하면 실행 되는 함수" + pagesize);
	console.log(currentpage);
	
	var page_data = {"ps" : pagesize, "cp" : currentpage, "bcode" : 303, "zcode" : 2}
	var mytbc;
	$.ajax({
				url:"boardList.do",
				data:page_data,
				type:"POST",       //httpReq.open("post")
				dataType:"json", //서버가 응답하는 데이터 형식(Text(json,script,txt,html) , xml) 
				
				success :function(responsedata){
					console.log(responsedata);
					$('#tbc').text(responsedata);
	
		
				},
				error:function(xhr){
					alert("토탈 카운트 비동기 처리 실패~~~~~" + xhr.status + " / " + xhr.statusText);
				}
	
			});	
	
});









function showlist() {
	
	
	var pagesize = $('#pagesize :selected').val();
	var currentpage = 1;
	var tbc = $('#tbc').text();
	
	
	//ps(cp-1)+1 - cp*ps(페이징 처리 공식)
	$('#indexend').empty();
	if(pagesize*currentpage > tbc){
		$('#indexend').text(tbc );
	}else{
		$('#indexend').text(pagesize*currentpage );
	}
	
	
	$('#indexstart').text(pagesize*(currentpage-1)+1 );
	//var gg = ${requestScope.tbc};
	var page_data = {"ps" : pagesize, "cp" : currentpage, "bcode" : 303, "zcode" : 1}
	//console.log(gg);
	$.ajax(
			{
				url:"boardList.do",
				data:page_data,
				type:"POST",       //httpReq.open("post")
				dataType:"json", //서버가 응답하는 데이터 형식(Text(json,script,txt,html) , xml) 
				
				success :function(responsedata){
					console.log(responsedata);
					$("tr:has(td)").remove();
					//console.log(">"+responsedata+"<"); 공백이 있는지 없는지 확인 할 수 있는 트릭 ~~~~~~~~~~~~~~~~~~~~~~~!!!!!!
					var mytable;
					$.each(responsedata,function(index, obj){
				
				
						mytable+= "<tr class='unread'>"+
                        "<td class='inbox-small-cells'>"+
                        "<input type='checkbox' class='mail-checkbox'>"+
                        "</td>"+
                        "<td class='inbox-small-cells'><i class='fa fa-star'></i></td>"+
                        "<td class='view-message  dont-show'>";
                        mytable+= obj.id;
                        mytable+= "</td>"; 
                        mytable += "<td class='view-message'>";
                        for(var i=1; i<= obj.dept; i++){
                        	mytable +="&nbsp;&nbsp;&nbsp";
                        }
                        if(obj.dept > 0){
                        	mytable += "<img src='img/re.gif' />";
                        }
                        if(obj.cocode == 1) {
                        	mytable += "<b>**삭제된 글입니다**</b>"
                        }else{
                        	mytable += "<a href='boardDetail.do?edit=0&idx="+ obj.idx+ "&bcode="+ obj.bcode+"&cp=" + obj.cp + "&ps="+ obj.ps + "&zcode=0'>"+ obj.title + "</a>";
                        }
                        
                        mytable += "</td>";
                        mytable += "<td class='view-message  inbox-small-cells'><i class='fa fa-paperclip'></i></td>";
                        mytable += "<td class='view-message'>" + obj.writedate.substr(0,10) + "</td>";
                        mytable += "<td class='view-message  text-right'>" +   obj.readnum + "</td>";
                        if(obj.cocode ==1){
                        	mytable += "<td class='view-message  text-right'></td>";
    						mytable += "<td class='view-message  text-right'></td>";
                        }else{
                        	mytable += "<td class='view-message  text-right'><a href='boardDetail.do?bcode="+ obj.bcode+"&edit=1&tcode=0&idx="+ obj.idx+ "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0&id=${sessionScope.id}' class='btn mini blue'>수정</a> </td>";
                            mytable += "<td class='view-message  text-right'><a href='boardDelete.do?bcode="+ obj.bcode+"&tcode=0&idx="+ obj.idx + "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0&id=${sessionScope.id}' class='btn mini blue' onclick='return confirm(message())'>삭제 </a> </td>";
                        }
                        
                        mytable += " </tr>";
					});
					$('#mytable').append(mytable);
				
					
					
				},
				error:function(xhr){
					alert("비동기 처리 실패~~~~~" + xhr.status + " / " + xhr.statusText);
				}
				
				
				
			}		
				
	);
	
	
	
	
	
}






function downpage() {
	
	
	var pagesize = $('#pagesize :selected').val();
	var indexend = $('#indexend').text();
	var currentpage =Math.ceil($('#indexend').text() / pagesize);
	
	
	
	console.log(currentpage);
	
	var mytbc2 = $('#tbc').text();
	
	//ps(cp-1)+1 - cp*ps(페이징 처리 공식)
	if(currentpage > 1){
		currentpage = currentpage -1;
		$('#indexstart').text(pagesize*(currentpage-1)+1);
		
		if(pagesize*currentpage > mytbc2){
			$('#indexend').text(mytbc2 );
		}else{
			$('#indexend').text(pagesize*currentpage );
		}
		
		
	
		
		console.log(pagesize);
		console.log(currentpage);
		
		/* $('#indexend').empty();
		$('#indexend').text(pagesize*currentpage ); */
		//var gg = ${requestScope.tbc};
		var page_data = {"ps" : pagesize, "cp" : currentpage, "bcode" : 303, "zcode" : 1}
		//console.log(gg);
		$.ajax(
				{
					url:"boardList.do",
					data:page_data,
					type:"POST",       //httpReq.open("post")
					dataType:"json", //서버가 응답하는 데이터 형식(Text(json,script,txt,html) , xml) 
					
					success :function(responsedata){
						console.log(responsedata);
						$("tr:has(td)").remove();
						//console.log(">"+responsedata+"<"); 공백이 있는지 없는지 확인 할 수 있는 트릭 ~~~~~~~~~~~~~~~~~~~~~~~!!!!!!
						var mytable;
						$.each(responsedata,function(index, obj){
					
					
							mytable+= "<tr class='unread'>"+
	                        "<td class='inbox-small-cells'>"+
	                        "<input type='checkbox' class='mail-checkbox'>"+
	                        "</td>"+
	                        "<td class='inbox-small-cells'><i class='fa fa-star'></i></td>"+
	                        "<td class='view-message  dont-show'>";
	                        mytable+= obj.id;
	                        mytable+= "</td>"; 
	                        mytable += "<td class='view-message'>";
	                        for(var i=1; i<= obj.dept; i++){
	                        	mytable +="&nbsp;&nbsp;&nbsp";
	                        }
	                        if(obj.dept > 0){
	                        	mytable += "<img src='img/re.gif' />";
	                        }
	                        if(obj.cocode == 1) {
	                        	mytable += "<b>**삭제된 글입니다**</b>"
	                        }else{
	                        	mytable += "<a href='boardDetail.do?edit=0&idx="+ obj.idx+ "&bcode="+ obj.bcode+"&cp=" + obj.cp + "&ps="+ obj.ps + "&zcode=0&id=${sessionScope.id}'>"+ obj.title + "</a>";
	                        }
	                        mytable += "</td>";
	                        mytable += "<td class='view-message  inbox-small-cells'><i class='fa fa-paperclip'></i></td>";
	                        mytable += "<td class='view-message'>" + obj.writedate.substr(0,10) + "</td>";
	                        mytable += "<td class='view-message  text-right'>" +   obj.readnum + "</td>";
	                        if(obj.cocode ==1){
	                        	mytable += "<td class='view-message  text-right'></td>";
	    						mytable += "<td class='view-message  text-right'></td>";
	                        }else{
	                        	mytable += "<td class='view-message  text-right'><a href='boardDetail.do?bcode="+ obj.bcode+"&edit=1&tcode=0&idx="+ obj.idx+ "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0&id=${sessionScope.id}' class='btn mini blue'>수정</a> </td>";
	                            mytable += "<td class='view-message  text-right'><a href='boardDelete.do?bcode="+ obj.bcode+"&tcode=0&idx="+ obj.idx + "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0&id=${sessionScope.id}' class='btn mini blue' onclick='return confirm(message())'>삭제 </a> </td>";
	                        }
	                        mytable += " </tr>";
						});
						$('#mytable').append(mytable);
					
						
						
						
						
						/* if(responsedata.trim() == "success") {
							$('#message').html('<p>로그인 성공</p>');
							$('#form1').slideUp();
						}else{
							$('#message').html('<p>로그인 실패</p>');
						} */
						
					},
					error:function(xhr){
						alert(" 다운 페이지 비동기 처리 실패~~~~~" + xhr.status + " / " + xhr.statusText);
					}
					
					
					
				});		
					
	}
	
	
}	
	
	
	


function uppage() {
	var pagesize = $('#pagesize :selected').val();
	var currentpage = $('#indexend').text() / pagesize;
	var mytbc2 = $('#tbc').text();
	var maxcp = (mytbc2 / pagesize) ;
	
	
	console.log(maxcp);
	console.log(pagesize);
	console.log(currentpage);
	
	
	
	//ps(cp-1)+1 - cp*ps(페이징 처리 공식)
	if(currentpage < maxcp){
		currentpage = currentpage +1;
		$('#indexstart').text(pagesize*(currentpage-1)+1);
		if(pagesize*currentpage > mytbc2){
			$('#indexend').text(mytbc2 );
		}else{
			$('#indexend').text(pagesize*currentpage );
		}
		
		
		
		/* $('#indexend').empty();
		$('#indexend').text(pagesize*currentpage ); */
		//var gg = ${requestScope.tbc};
		var page_data = {"ps" : pagesize, "cp" : currentpage, "bcode" : 303, "zcode" : 1}
		//console.log(gg);
		$.ajax(
				{
					url:"boardList.do",
					data:page_data,
					type:"POST",       //httpReq.open("post")
					dataType:"json", //서버가 응답하는 데이터 형식(Text(json,script,txt,html) , xml) 
					
					success :function(responsedata){
						console.log(responsedata);
						$("tr:has(td)").remove();
						//console.log(">"+responsedata+"<"); 공백이 있는지 없는지 확인 할 수 있는 트릭 ~~~~~~~~~~~~~~~~~~~~~~~!!!!!!
						var mytable;
						var dele
						$.each(responsedata,function(index, obj){
					
					
							mytable+= "<tr class='unread'>"+
	                        "<td class='inbox-small-cells'>"+
	                        "<input type='checkbox' class='mail-checkbox'>"+
	                        "</td>"+
	                        "<td class='inbox-small-cells'><i class='fa fa-star'></i></td>"+
	                        "<td class='view-message  dont-show'>";
	                        mytable+= obj.id;
	                        mytable+= "</td>"; 
	                        mytable += "<td class='view-message'>";
	                        for(var i=1; i<= obj.dept; i++){
	                        	mytable +="&nbsp;&nbsp;&nbsp";
	                        }
	                        if(obj.dept > 0){
	                        	mytable += "<img src='img/re.gif' />";
	                        }
	                        if(obj.cocode == 1) {
	                        	mytable += "<b>**삭제된 글입니다**</b>"
	                        }else{
	                        	mytable += "<a href='boardDetail.do?edit=0&idx="+ obj.idx+ "&bcode="+ obj.bcode+"&cp=" + obj.cp + "&ps="+ obj.ps + "&zcode=0&id=${sessionScope.id}'>"+ obj.title + "</a>";
	                        }
	                        mytable += "</td>";
	                        mytable += "<td class='view-message  inbox-small-cells'><i class='fa fa-paperclip'></i></td>";
	                        mytable += "<td class='view-message'>" + obj.writedate.substr(0,10) + "</td>";
	                        mytable += "<td class='view-message  text-right'>" +   obj.readnum + "</td>";
	                        if(obj.cocode ==1){
	                        	mytable += "<td class='view-message  text-right'></td>";
	    						mytable += "<td class='view-message  text-right'></td>";
	                        }else{
	                        	mytable += "<td class='view-message  text-right'><a href='boardDetail.do?bcode="+ obj.bcode+"&edit=1&tcode=0&idx="+ obj.idx+ "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0&id=${sessionScope.id}' class='btn mini blue'>수정</a> </td>";
	                            mytable += "<td class='view-message  text-right'><a href='boardDelete.do?bcode="+ obj.bcode+"&tcode=0&idx="+ obj.idx + "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0&id=${sessionScope.id}' class='btn mini blue' onclick='return confirm(message())'>삭제 </a> </td>";
	                        }
	                        
	                        mytable += " </tr>";
						});
						$('#mytable').append(mytable);
					
						 
						
						
						
						/* if(responsedata.trim() == "success") {
							$('#message').html('<p>로그인 성공</p>');
							$('#form1').slideUp();
						}else{
							$('#message').html('<p>로그인 실패</p>');
						} */
						
					},
					error:function(xhr){
						alert(" 다운 페이지 비동기 처리 실패~~~~~" + xhr.status + " / " + xhr.statusText);
					}
					
					
					
				});		
					
	}
	
	
	
	
}


function message() {
	return "Are you fucking sure? There is no way back!!!!";
}


function search() {
	event.preventDefault();
	var searchword = $('#searchword').val();
	console.log(searchword);
	var pagesize = $('#pagesize :selected').val();
	var currentpage = 1;
	var tbc = $('#tbc').text();
	
	
	if(searchword != null){
		
		var page_data = {"ps" : pagesize, "cp" : currentpage, "bcode" : 303, "zcode" : 1, "sw" : searchword}
	
		$.ajax(
				{
					url:"boardList.do",
					data:page_data,
					type:"POST",       //httpReq.open("post")
					dataType:"json", //서버가 응답하는 데이터 형식(Text(json,script,txt,html) , xml) 
					
					success :function(responsedata){
						console.log(responsedata);
						$("tr:has(td)").remove();
						//console.log(">"+responsedata+"<"); 공백이 있는지 없는지 확인 할 수 있는 트릭 ~~~~~~~~~~~~~~~~~~~~~~~!!!!!!
						var mytable;
						var dele
						$.each(responsedata,function(index, obj){
					
					
							mytable+= "<tr class='unread'>"+
	                        "<td class='inbox-small-cells'>"+
	                        "<input type='checkbox' class='mail-checkbox'>"+
	                        "</td>"+
	                        "<td class='inbox-small-cells'><i class='fa fa-star'></i></td>"+
	                        "<td class='view-message  dont-show'>";
	                        mytable+= obj.id;
	                        mytable+= "</td>"; 
	                        mytable += "<td class='view-message'>";
	                        for(var i=1; i<= obj.dept; i++){
	                        	mytable +="&nbsp;&nbsp;&nbsp";
	                        }
	                        if(obj.dept > 0){
	                        	mytable += "<img src='img/re.gif' />";
	                        }
	                        if(obj.cocode == 1) {
	                        	mytable += "<b>**삭제된 글입니다**</b>"
	                        }else{
	                        	mytable += "<a href='boardDetail.do?edit=0&idx="+ obj.idx+ "&bcode=401&cp=" + obj.cp + "&ps="+ obj.ps + "&zcode=0' onclick='return writeOk()'>"+ obj.title + "</a>";
	                        }
	                        mytable += "</td>";
	                        mytable += "<td class='view-message  inbox-small-cells'><i class='fa fa-paperclip'></i></td>";
	                        mytable += "<td class='view-message'>" + obj.writedate.substr(0,10) + "</td>";
	                        mytable += "<td class='view-message  text-right'>" +   obj.readnum + "</td>";
	                        if(obj.cocode ==1){
	                        	mytable += "<td class='view-message  text-right'></td>";
	    						mytable += "<td class='view-message  text-right'></td>";
	                        }else{
	                        	mytable += "<td class='view-message  text-right'><a href='boardDetail.do?bcode=401&edit=1&tcode=0&idx="+ obj.idx+ "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0' class='btn mini blue'>수정</a> </td>";
	                            mytable += "<td class='view-message  text-right'><a href='boardDelete.do?bcode=401&tcode=0&idx="+ obj.idx + "&cp="+obj.cp+"&ps="+ obj.ps+"&zcode=0' class='btn mini blue' onclick='return confirm(message())'>삭제 </a> </td>";
	                        }
	                        
	                        mytable += " </tr>";
						});
						$('#mytable').append(mytable);
					
						 
						
						
						
					},
					error:function(xhr){
						alert(" 다운 페이지 비동기 처리 실패~~~~~" + xhr.status + " / " + xhr.statusText);
					}
					
					
					
				});		
					
	}
	
	
	
}

function writeOk() {
	if('${sessionScope.id}'==''){
		   alert('로그인이 필요합니다');
		   return false;
	   }
}


$(function(){
	console.log("세션에 저장된 회원등급보기" +${sessionScope.grade});
	if(${sessionScope.grade} == 2) {
		$('#writeButton').show();
		$('#editHd').show();
	}else{
		$('#writeButton').hide();
		$('#editHd').hide();
	}
});
</script>

<jsp:include page="/common/top.jsp"></jsp:include>
<body>
	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/hero.jpg)">
		<section style='padding-top: 200px; padding-bottom: 100px'>
			<div class="container">

				<div>
					


					<aside class="lg-side">
						<div class="inbox-head">
							<h3 style = "color: #125448;">Notice Board</h3>
							<form action="#" class="pull-right position">
								<div class="input-append">
									<input type="text" class="sr-input" placeholder="게시판 검색">
									<button class="btn sr-btn" type="button" onclick="search()">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</form>
						</div>
						<div class="inbox-body">
							<div class="mail-option">
								<!-- <div class="chk-all">
									<input type="checkbox"
										class="mail-checkbox mail-group-checkbox">
									<div class="btn-group">
										<a data-toggle="dropdown" href="#" class="btn mini all"
											aria-expanded="false"> All <i class="fa fa-angle-down "></i>
										</a>
										<ul class="dropdown-menu">
											<li><a href="#"> None</a></li>
											<li><a href="#"> Read</a></li>
											<li><a href="#"> Unread</a></li>
										</ul>
									</div>
								</div>
 -->
						<!-- 		<div class="btn-group">
									<a data-original-title="Refresh" data-placement="top"
										data-toggle="dropdown" href="#" class="btn mini tooltips">
										<i class=" fa fa-refresh"></i>
									</a>
								</div> -->
						<!-- 		<div class="btn-group hidden-phone">
									<a data-toggle="dropdown" href="#" class="btn mini blue"
										aria-expanded="false"> More <i class="fa fa-angle-down "></i>
									</a>
									<ul class="dropdown-menu">
										<li><a href="#"><i class="fa fa-pencil"></i> Mark as
												Read</a></li>
										<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
										<li class="divider"></li>
										<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
									</ul>
								</div> -->
								<!-- <div class="btn-group">
									<a data-toggle="dropdown" href="#" class="btn mini blue">
										Move to <i class="fa fa-angle-down "></i>
									</a>
									<ul class="dropdown-menu">
										<li><a href="#"><i class="fa fa-pencil"></i> Mark as
												Read</a></li>
										<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
										<li class="divider"></li>
										<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
									</ul>
								</div> -->
								    <div class="btn-group">
                           <a href="boardList.do?zcode=0&bcode=401&tcode=0&cp=1&ps=${requestScope.ps }&idx=0&id=${sessionScope.id}" class="btn mini blue">
                              	전체글 보기 
                           </a>
                           
                        </div> 

								<div class="btn-group">
									<a
										href="gotoWrite.do?zcode=0&bcode=303&tcode=0&cp=1&ps=5&idx=0&id=${sessionScope.id }"
										class="btn mini blue">글쓰기</a>
								</div>
								<c:set var="pagesize" value="${param.ps }"></c:set>
								<div class="btn-group">
									<select id="pagesize" name="ps" onchange="showlist()">
										<c:forEach var="i" begin="5" end="20" step="5">
											<c:choose>
												<c:when test="${pagesize == i}">
													<option value="${i}" selected>${i}건</option>
												</c:when>
												<c:otherwise>
													<option value="${i}">${i}건</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>


								<!-- 페이징 처리  ps(cp-1)+1 - cp*ps -->
								<c:set var="ps" value="${requestScope.ps }"></c:set>
								<c:set var="cp" value="${requestScope.cp }"></c:set>
								<c:set var="tbc" value="${requestScope.totalboardcount}"></c:set>
								<c:set var="bcode" value="${requestScope.bcode}"></c:set>
								<ul class="unstyled inbox-pagination">
									<!-- 페이징 처리 인덱스 끝 번호가 토탈 카운트 보다 큰경우 처리 해주기 -->
									<li><span id="indexstart">${ps*(cp-1)+1}</span><span>-</span>
										<span id="indexend"> <c:choose>
												<c:when test="${ps*cp > tbc }">${tbc}</c:when>
												<c:otherwise>${ps*cp}</c:otherwise>
											</c:choose>
									</span> of <span id="tbc">${tbc}</span></li>
									<li style="cursor: pointer"><a class="np-btn"
										onclick="downpage()"><i
											class="fa fa-angle-left  pagination-left"></i></a></li>
									<li style="cursor: pointer"><a class="np-btn"
										onclick="uppage()"><i
											class="fa fa-angle-right pagination-right"></i></a></li>
								</ul>
							</div>

							<table class="table table-inbox table-hover">
								<tbody id="mytable">
									<tr class="unread">
										<th class="inbox-small-cells"><input type="checkbox"
											class="mail-checkbox"></th>
										<th class="inbox-small-cells"><i class="fa fa-star"></i></th>
										<th class="view-message dont-show">글쓴이</th>
										<th class="view-message">제목
										</td>
										<th class="view-message inbox-small-cells"></th>
										<th class="view-message">작성일
										</td>
										<th class="view-message">조회수</th>
										<th id="editHd1" class="view-message  text-right">수정</th>
										<th id="editHd1" class="view-message  text-right">삭제</th>

									</tr>

									<c:forEach var="blist" items='${requestScope.boardlist}'>
										<tr class="unread">
											<td class="inbox-small-cells"><input type="checkbox"
												class="mail-checkbox"></td>
											<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
											<td class="view-message  dont-show">${blist.id}</td>



											<!-- 타이트 처리 티디 -->
											<td class="view-message "><c:forEach var="i" begin="1"
													end="${blist.dept}" step="1">
									&nbsp;&nbsp;&nbsp;
									</c:forEach> <c:if test="${blist.dept > 0}">
													<img src="img/re.gif" />
												</c:if> 
												<!-- 삭제된 글 처리 -->
												<c:choose>
													<c:when test="${blist.cocode == 1 }">
														<b>**삭제된 글입니다**</b>
													</c:when>
													<c:otherwise>
														<a href="boardDetail.do?edit=0&idx=${blist.idx}&bcode=${blist.bcode}&cp=${cp}&ps=${ps}&zcode=0&id=${sessionScope.id}">  ${blist.title}</a>
													</c:otherwise>
												</c:choose></td>

											<td class="view-message  inbox-small-cells"><i
												class="fa fa-paperclip"></i></td>
												<c:set var="writedate" value="${blist.writedate}" />
											<td class="view-message">${fn:substring(writedate, 0, 10)}</td>
											<td class="view-message  text-right">${blist.readnum}</td>

											<c:choose>
											<c:when test="${blist.id == sessionScope.id}">
											<c:choose>
													<c:when test="${blist.cocode == 1 }">
														<td class="view-message  text-right"></td>
															
														<td class="view-message  text-right"></td>
													</c:when>
													<c:otherwise>
														<td class="view-message  text-right"><a
															href="boardDetail.do?bcode=${blist.bcode }&edit=1&tcode=0&idx=${blist.idx }&cp=${cp}&ps=${ps}&zcode=0&id=${sessionScope.id}"
															class="btn mini blue">수정</a></td>
														<td class="view-message  text-right"><a
															href="boardDelete.do?bcode=${blist.bcode }&tcode=0&idx=${blist.idx }&cp=${cp}&ps=${ps}&zcode=0&id=${sessionScope.id}"
															class="btn mini blue" onclick="return confirm(message())">삭제</a>
														</td>
													</c:otherwise>
												</c:choose>
											
											</c:when>
											<c:otherwise>
											<td class="view-message  text-right"></td>
															
														<td class="view-message  text-right"></td>
											</c:otherwise>
											</c:choose>


										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</aside>
				</div>
			</div>
		</section>
</body>

<jsp:include page="/common/bottom.jsp"></jsp:include>

</html>