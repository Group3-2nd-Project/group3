package kr.or.bit.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class BoardDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		try {
			      int idx = Integer.parseInt((String) request.getParameter("idx"));	
			      System.out.println("bcode 여기까지 올까??" + idx);
  		  		  BoardDao dao = new BoardDao();
  		  		  Board boarddetail = dao.detailBoard(idx);
  		  		  request.setAttribute("boarddetail",boarddetail);
		  		  
  		  		  forward = new ActionForward();
  			  	  forward.setPath("/boardDetail.jsp");
  			  	  System.out.println("디비에서 유저가 선택한 글 상세 뽑아오는 서비스 함수.. 과연 데이타는 여기까지 왔을까.. " + boarddetail);
  			  	  
	
		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}
	}


