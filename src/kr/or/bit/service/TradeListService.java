package kr.or.bit.service;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;


public class TradeListService implements Action { //수여닝

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null; 

		try {
			
			int bcode = Integer.parseInt((String) request.getParameter("bcode"));
			System.out.println("bcode 왜 여기로 안 들어와?/?/?//");
			BoardDao dao = new BoardDao();
			ArrayList<Board> tradelist = dao.showBoard(bcode);
			request.setAttribute("tradelist", tradelist);
			
			forward = new ActionForward();
			forward.setPath("tradelist.jsp");
			System.out.println("디비에서 게시판 목록 불러오는 함수 " + tradelist);
			System.out.println("tradelist size" + tradelist.size());
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}

}