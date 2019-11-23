package kr.or.bit.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class BoardListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			      int bcode = Integer.parseInt((String) request.getParameter("bcode"));	
			      System.out.println("bcode 여기까지 올까??" + bcode);
  		  		  BoardDao dao = new BoardDao();
  		  		  ArrayList<Board> boardlist = dao.showBoard(bcode);
  		  		  request.setAttribute("boardlist",boardlist);
		  		  
  		  		  forward = new ActionForward();
  			  	  forward.setPath("/qna"+bcode+".jsp");
  			  	  System.out.println("디비에서 게시판 목록 뽑아오는 서비스 함수.. 과연 데이타는 여기까지 왔을까.. " + boardlist);
  			  	  System.out.println("보드리스트의 사이즈는?? " +boardlist.size());
	
		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}

}
