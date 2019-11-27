package kr.or.bit.service;

import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.BoardForReply;
import net.sf.json.JSONArray;

public class ReplyListService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
	   
      ActionForward forward = null;
      try {
      int bcode = Integer.parseInt(request.getParameter("bcode"));
      String cp = request.getParameter("cp");
      String ps = request.getParameter("ps");
      int idx = Integer.parseInt(request.getParameter("idx"));
      
      
      
      BoardDao dao = new BoardDao();

      List<BoardForReply> replylist = dao.showreply(idx);
      JSONArray jsonlist = JSONArray.fromObject(replylist);
      System.out.println(replylist);
      System.out.println(jsonlist);
      request.setAttribute("data", jsonlist);
      
          forward = new ActionForward();
          forward.setPath("Campingdetail_json.jsp");
      }catch (Exception e) {
		// TODO: handle exception
	}
      return forward;
   }

}