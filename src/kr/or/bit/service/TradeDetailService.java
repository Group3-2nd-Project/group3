package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.File;

public class TradeDetailService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
      ActionForward forward = null;

      try {
    	  //request.setAttribute("ps", 5);
         int idx = Integer.parseInt(request.getParameter("idx"));
         //int ps = Integer.parseInt(request.getParameter("ps"));
         //int cp = Integer.parseInt(request.getParameter("cp"));
         //System.out.println("idx 목록에서 가져오니?" + idx);
         BoardDao dao = new BoardDao();
         File detailFileBoard= dao.detailFileBoard(idx);
         //System.out.println("리뷰 디테일 서비스에서 나오니?" + reviewdetail);
         request.setAttribute("detailFileBoard", detailFileBoard);
         request.setAttribute("idx", idx);
         //request.setAttribute("ps", ps);
         //request.setAttribute("cp", cp);


         //System.out.println(reviewdetail);
             forward = new ActionForward();
             forward.setPath("/WEB-INF/views/tradedetail.jsp");
      } catch (Exception e) {
         
         e.printStackTrace();
      }
      
      return forward;
   }
}

