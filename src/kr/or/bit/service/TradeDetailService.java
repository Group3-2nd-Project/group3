package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;



public class TradeDetailService implements Action{ //수여닝

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			int idx  = Integer.parseInt((String) request.getParameter("idx"));
			System.out.println("idx로 글 상세보기" + idx);
			BoardDao dao = new BoardDao();
		    Board tradedetail = dao.detailBoard(idx);
		    request.setAttribute("tradedetail", tradedetail);
		    
		    forward = new ActionForward();
		    forward.setPath("/tradedetail.jsp");
		    System.out.println("거래 상세 내역 들어옴?" + tradedetail);		
			
		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}
}
