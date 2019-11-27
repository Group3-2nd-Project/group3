package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class ReplyDeleteService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response){

      ActionForward forward = null;
      try {
      int replyidx = Integer.parseInt(request.getParameter("replyidx"));
      int bcode = Integer.parseInt(request.getParameter("bcode"));
      int tcode = Integer.parseInt(request.getParameter("tcode"));

      System.out.println("fidx 어떻게 찍히니?(여기는 댓글삭제서비스)" + replyidx);
      /*
       * HttpSession session = request.getSession(); String id =
       * (String)session.getAttribute("id");
       */
       
      BoardDao dao = new BoardDao();
      int result = dao.deleteReply(replyidx);

         String msg = "";
         String url = "";
         
          if(result > 0) {
             msg ="success";
            
          }else { 
             msg ="fail";
             
          }
          request.setAttribute("data", msg);
          
          forward = new ActionForward();
          forward.setPath("Campingdetail_json.jsp");
      }catch (Exception e) {
		// TODO: handle exception
	}
      return forward;
   }

}