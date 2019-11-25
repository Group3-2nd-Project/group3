<!-- 추가(양찬식)수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
       //세션을 무효화 시킴 
        session.invalidate();  
       response.sendRedirect("login.jsp");
     %>