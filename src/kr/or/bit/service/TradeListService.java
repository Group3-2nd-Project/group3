package kr.or.bit.service;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.File;


public class TradeListService implements Action { //수여닝

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null; 
		System.out.println("됐다 안됐다 그래~~ ");
		try {
			
			int bcode = Integer.parseInt((String) request.getParameter("bcode"));
			System.out.println("bcode 왜 여기로 안 들어와?/?/?//");
			BoardDao dao = new BoardDao();
			ArrayList<File> boardfile  = dao.showBoardFile(bcode);
			request.setAttribute("boardfile", boardfile);
			
			forward = new ActionForward();
			forward.setPath("/tradelist.jsp");
			
			System.out.println("디비에서 게시판 목록 불러오는 함수 " + boardfile);
			System.out.println("boardfile size" + boardfile.size());
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}

}