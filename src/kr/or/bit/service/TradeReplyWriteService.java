package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.BoardForReply;

public class TradeReplyWriteService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
	    
	    ActionForward forward = null;   
	    try {
   
        System.out.println("여기까지 오니? 여기는 댓글 추가 서비스 ");
        int idx = Integer.parseInt(request.getParameter("idx"));

        String replycontent = request.getParameter("replycontent");

        int bcode = Integer.parseInt(request.getParameter("bcode"));
         int tcode = Integer.parseInt(request.getParameter("tcode"));
         
         System.out.println("******************댓글내용넘어오니?" + replycontent);
         HttpSession session = request.getSession();
         String id = (String)session.getAttribute("id");
         //System.out.println("세션아이디가 뭘까? " +id);
      
        System.out.println("여기는 댓글칸 idx야 오니?" + idx  +"id는뭘까?" + id+ "replycontent"+replycontent+"비코드: "+bcode +"티코드" + tcode);
        
         BoardForReply reply = new BoardForReply();
         reply.setIdx(idx);
         reply.setReplyid(id);
         reply.setReplycontent(replycontent);
         
         System.out.println("댓글은? " + reply);
         System.out.println("idx/id/replycontent/bcode/tcode" +idx +id + "content는요?" +replycontent + bcode + tcode);
         
         BoardDao dao = new BoardDao();
         int result = dao.replyInsert(reply);
         
         String msg = "";
         String url = "";
         
          if(result > 0) {
             msg ="success";
          }else { 
             msg ="fail";
          }
          request.setAttribute("tradedata", msg);
     
          forward = new ActionForward();
          forward.setPath("Campingtradedetail_json.jsp");
          
	    }catch (Exception e) {
			// TODO: handle exception
		}

      return forward;
   }

}