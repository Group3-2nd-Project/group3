/*추가(양찬식)수정*/

package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class SignUpService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
      //1. 데이터 받기
      ActionForward forward = null;
      
      try {
  
      Member member = new Member();
      
      member.setId(request.getParameter("id"));
      member.setPwd(request.getParameter("pwd"));
      member.setName(request.getParameter("name")); 
      member.setHp(request.getParameter("hp"));
      
      //3. 처리
      MemberDao memberdao = new MemberDao();
      int result = memberdao.memberInsert(member);
      
        String board_msg="";
        String board_url="";
        
        String tos1 = request.getParameter("tos1");
        String tos2 = request.getParameter("tos2");
        
        
        if(result > 0) {
           board_msg ="회원가입성공";
           board_url ="LogIn.do";
        }else { //-1 (제약, 컬럼길이 문제)
           board_msg ="회원가입실패";
           board_url ="SignUp.do";
        }
        request.setAttribute("board_msg", board_msg);
        request.setAttribute("board_url", board_url);
          
        forward = new ActionForward();
      //이동경로 설정
        forward.setPath("/WEB-INF/redirect.jsp");
        
        
    	  
      }catch (Exception e) {
        System.out.println(e.getMessage());
	}
      return forward;
   }
      
}