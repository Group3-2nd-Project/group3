/*추가(양찬식)수정*/
package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class LogoutService implements Action {
   //로그아웃
      public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
         //세션 얻어와서 삭제
         HttpSession session = request.getSession();
         session.invalidate();
         
         String board_msg = "로그아웃 되었습니다.";
         String board_url = request.getContextPath()+"/index.jsp";
         
         //결과값 저장
         request.setAttribute("board_msg", board_msg);
         request.setAttribute("board_url", board_url);
         
         ActionForward forward = new ActionForward();
         forward.setPath("/WEB-INF/redirect.jsp");
         
         return forward;
      }

   
   
   
   
   
}