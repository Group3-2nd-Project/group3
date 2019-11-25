/*추가(양찬식)1fd1수정*/
package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;

public class LoginService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
      
	   ActionForward forward = null;
	   
	   try{//1. 데이터 받기
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
            
      //2. 데이터 확인
      //System.out.println(userid + " / " + pwd);
      
      //3. 처리
      MemberDao memberdao = new MemberDao();
      Boolean isLogin = memberdao.Login(id, pwd);
         
      String board_msg = "";
      String board_url = "";
         
      if(isLogin) { //id와 pwd가 맞으면..
         //세션 가져와서 login 정보 저장
         HttpSession session = request.getSession();
         session.setAttribute("id",id);
         
         board_msg = "로그인 성공";
         board_url = request.getContextPath()+"/index.jsp";
      }else {
         board_msg = "로그인 실패, 다시 시도해 주세요.";
         board_url = "LogIn.do";
      }
      
      //4. 결과저장
      request.setAttribute("board_msg",board_msg);
      request.setAttribute("board_url",board_url);
      
     
      //5. 객체생성
      forward = new ActionForward();
      forward.setPath("/WEB-INF/redirect.jsp");
      
      
	   }catch (Exception e) {
		// TODO: handle exception
	}
      return forward;
            
            
            
      
   }
   
   
}
