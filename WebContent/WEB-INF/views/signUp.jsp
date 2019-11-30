<!-- 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

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
    
    <!--  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript">

  
  
   $(function(){
    
     var getUser = new RegExp("^[a-zA-Z0-9]{3,16}$");
     var getpwd = new RegExp("^[a-zA-Z0-9]{8,16}$");
     var getPhone = new RegExp("^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$");
 
     var idCheck = false;
     var pwdCheck = false;
     var pwd2Check = false;
     var phoneCheck = false;
     var idDuCheck = false;
     var tos1 = false;
     var tos2 = false;
     var issubmit;
     //ID 유효성 검증
     $('#id').on(
         {
             keyup : function(){
                 if(getUser.test($('#id').val()) != true) {  
                     var ment = "잘못된 형식으로 입력하셨습니다.";
                         $('.ckid').text(ment);
                         $('#id').css("border","2px solid #F7819F");
                         idCheck = false;
                 } else {
                     var ment = "올바른 형식으로 입력하셨습니다.";
                        $('.ckid').text(ment);
                        $('#id').css("border","2px solid #9F81F7");
                        idCheck = true;
                 };
         }, 
           blur : function() {
               $('.ckid').empty();
           }
     });
     
     
     //PASSWORD 검증
     $('#pwd').on(
             {
                 keyup : function(){
                     
                     if(getpwd.test($(this).val()) != true) {  
                         var ment = "잘못된 형식으로 입력하셨습니다.";
                             $('.ckpwd').text(ment);
                             console.log($('#pwd').val());
                             $('#pwd').css("border","2px solid #F7819F");
                             pwdCheck=false;
                     } else {
                         var ment = "올바른 형식으로 입력하셨습니다.";
                            $('.ckpwd').text(ment);
                            $('#pwd').css("border","2px solid #9F81F7");
                            pwdCheck=true;
                     };
             },
               blur : function() {
                   $('.ckpwd').empty();
               }
 
     });
     
     
     //PASSWORD 일치여부 
     $('#pwdcheck').on(
             {
                 keyup : function(){ 
                        if($('#pwd').val() != $('#pwdcheck').val()){
                            $('.ckpwdcheck').text('암호가 일치하지 않습니다');
                            $('#pwdcheck').css("border","2px solid #F7819F");
                             pwd2Check = false;
                        }else{
                            $('.ckpwdcheck').text('암호가 일치합니다');
                            $('#pwdcheck').css("border","2px solid #9F81F7");
                             pwd2Check = true;
                        }
                        console.log(pwdCheck);
                        console.log(pwd2Check);
             }, 
                     blur : function() {
                   $('.ckpwdcheck').empty();
               }
     });
     
     
    
    //휴대폰 번호 검증 
     $('#hp').on(
             {
                 keyup : function(){    
                     if(getPhone.test($(this).val()) != true) {  
                         var ment = "잘못된 형식으로 입력하셨습니다.";
                             $('.ckhp').text(ment);
                             $('#hp').css("border","2px solid #F7819F");
                             phoneCheck = false;
                     } else {
                         var ment = "올바른 형식으로 입력하셨습니다.";
                            $('.ckhp').text(ment);
                            $('#hp').css("border","2px solid #9F81F7");
                            phoneCheck = true;
                     };
             },
                 blur : function() {
                 $('.ckhp').empty();
                    }
     });
    
    
      $('#join-submit').click(function(){
          if($("#tos1").is(":checked") == false){
              alert('이용약관에 동의하셔야 합니다');
              return false;      
          } else  if($("#tos2").is(":checked") == false){
              alert('개인정보 수집 및 활용이용에 동의하셔야 합니다');
              return false;      
          } else {
             tos1 = true;
             tos2 = true;
          }         
      });
      
      

     $('#message').click(function(){
      if($('#id').val() == ""){
         alert("ID 입력");
         $('#id').focus();
      }else{
      $.ajax(
            {
               url:"IdCheck.do", //Ex10_ok.jsp   
               data:{id:$('#id').val()}, //MemoId?id=aa
               dataType:"html", //xml , json , script , html , text
               success:function(responsedata){
                  console.log(responsedata);
                  if(responsedata.trim("true")=="true"){
                     alert("사용가능");
                     $('#pwd').focus();
                     idDuCheck = true;
                  }else if(responsedata.trim("false")=="false"){
                     alert("사용불가능");
                     $('#id').val("");
                     $('#id').focus();
                  }
                  console.log(issubmit);
                   console.log(pwdCheck);
                   console.log(pwd2Check);
               },
               error:function(){
               }
            }      
         );
      }
   });
  
 /* 
    $('input[type=submit]').click(function(){
       issubmit =idCheck && pwdCheck && pwd2Check && phoneCheck && tos1 && tos2 && idDuCheck;
       
       if(issubmit)
       {    
           return true;
       }else {
           alert('입력되지 않은 빈칸이있습니다. 확인해주세요.');
           return false;
       }
   }); 
  */ 
  /* issubmit =idCheck && pwdCheck && pwd2Check && phoneCheck && tos1 && tos2 && idDuCheck; */  
  $('#join-submit').click(function(){
     issubmit =idCheck && pwdCheck && pwd2Check && phoneCheck && tos1 && tos2 && idDuCheck;
     if(issubmit)
        {    
            return true;
        } else if(!idDuCheck) {
            alert('ID 증복체크 해주세요.');
            return false;
        } else {
            alert('올바르게 입력되지 않은 항목이 있습니다. 확인해주세요.');
            return false;
        }         
    });
    
    
});
   
   
   
</script>


</head>

<style>
   .container{
      text-align: center;
   
   }
   
   button{
     background-color: #341a79;
   
   }
   
   section {
   padding-top : 200px;
   
   }
   

   
    joinform {
     display: block;
     width: 10%;
   } 

   #agree1, #agree2{
  width: 100%;
  height: 300px;
  border: 1px solid #eee;
  overflow: scroll;
  
   } 

   #form1, #form2, #form-group{
      margin-left : auto;
      margin-right : auto;
   }
  

   .leftmove {  
   margin-left:20%;

   } 
   
   h5, h6{
   text-align: left;
   }

   .sizedown {
   width:80%;
   }
   
   p{
   text-align: left;
   }

   article {
   margin-bottom: 10%;
   }   
   

   
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
<jsp:include page="/common/top.jsp"></jsp:include>
 <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero.jpg)"></div> 

<section>
<article class="container" style=" height: 80%;">
         <div class="section-heading text-center animated fadeInDown">
            <h2 class="h-bold">Sign Up Page</h2>
         </div>
   <!--    form roll="form" 에서 속성들 role : 폼 양식이 있는 곳을 알려주거나 변경된 경우 joinok.jsp  -->
   
   <div id="joinform"class="col-sm-12" style=" height: 80%;">
      <form role="form" action="SingUpOk.do" method="post" name="SignUp" id="SignUp">
 
   <div id="form1">
         <h5><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;이용약관</h5>
<br>
         
         <div id="agree1">
         <jsp:include page="/join/joinAgree.html"></jsp:include>
         </div>
         <p style="text-align: left">
         <input type="checkbox" id="tos1" name="tos1" id="tos1" value="Y">
         <label style="font-size: 17px">이용약관 동의 (필수)</label>   <!-- terms of service = TOS -->
         </p>
      </div>         
      <span class="cktos1"></span>
         <br><br>
   <div id="form2" class="col-sm-12" style=" height: 80%;">
         <h5><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;개인정보 수집 및 활용이용</h5>
         
      <br>
         
         <div id="agree2">
         <jsp:include page="/join/joinAgree1.html"></jsp:include>
         </div>
         <p style="text-align: left">
         <input type="checkbox" id="tos2" name="tos2" id="tos2" value="Y">
         <label style="font-size: 17px">개인정보 수집 및 활용이용에 관한 동의 (필수)</label>
         </p>
      </div> 
      <span class="cktos2"></span>
        
<br><br><br>
         <div class="leftmove">
         <div class="form-group sizedown">
            <div class="input-group">
            <span class="input-group-addon" style="color:#125448; padding-left:2.2%; padding-right:2.2%;"><i class="fas fa-user-circle fa-2x"></i></span>
            <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요(한글, 영문  3~16자)">
            <input type = "button" id="message" value="중복확인">
            </div>
            <span class="ckid"></span>
         </div>
         
         <div class="form-group sizedown">
         <div class="input-group">
            <span class="input-group-addon" style="color:#125448; padding-left:2.4%; padding-right:2.4%;"><i class="fas fa-lock fa-2x"></i></span>
            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요(한글, 영문  8~16자)">
            <div class="ckpwd"></div>
         </div>
         </div>
         
         <div class="form-group sizedown">
         <div class="input-group">
            <span class="input-group-addon" style=" color:#125448; padding-left:2.4%; padding-right:2.4%;">
            <i class="fas fa-lock fa-2x"></i></span>
            <input type="password" class="form-control" name="pwdcheck" id="pwdcheck" placeholder="비밀번호를 한번 더 입력하세요.">
            <div class="ckpwdcheck"></div>
         </div>
         </div>
         
         <div class="form-group sizedown">
            <div class="input-group">
            <span class="input-group-addon" style="color:#125448;"><i class="far fa-id-card fa-2x"></i></span>
            <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요.">
            <div class="tdjob"></div>
            </div>
         </div>

         <div class="form-group sizedown">
            <div class="input-group">
            <span class="input-group-addon" style="color:#125448; padding-left:2.9%; padding-right:2.9%;">
            <i class="fas fa-mobile-alt fa-2x"></i></span>
            <input type="text" class="form-control" name="hp" id="hp" placeholder="핸드폰번호를  입력하세요">
            <div class="ckhp"></div>
            </div>
         </div>
</div>
<br>
       <div>
   <button type="submit" id="join-submit" class="btn dorne-btn" style ="width: 200px;"><i class="far fa-check-circle"></i>&nbsp;&nbsp;회원가입완료</button>
   <button type="reset" class="btn dorne-btn" style ="width: 200px;"><i class="far fa-times-circle"></i>&nbsp;초기화</button>
       </div>
      
      </form>
   </div>

</article>
</section>
    
</body>
<jsp:include page="/common/bottom.jsp"></jsp:include>
</html>