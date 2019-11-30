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
			      System.out.println("hihi"+idx);
			      int edit = Integer.parseInt((String) request.getParameter("edit"));
			      int bcode = Integer.parseInt((String) request.getParameter("bcode"));
			      System.out.println("bcode 여기까지 올까??" + bcode);
			      int cp = Integer.parseInt((String) request.getParameter("cp"));
			      System.out.println("current page 여기까지 올까??" + cp);
			      int ps = Integer.parseInt((String) request.getParameter("ps"));
			      System.out.println("page Size 여기까지 올까??" + ps);
			      int zcode = Integer.parseInt((String) request.getParameter("zcode"));
			      System.out.println("zcode 여기까지 올까??" + zcode);
			      
			      
			      System.out.println("bcode 여기까지 올까?? 여기는 보드디테일 서비스" + idx);
			      System.out.println("bcode 여기까지 올까?? 여기는 보드디테일 서비스" + edit);
  		  		  BoardDao dao = new BoardDao();
  		  		  Board boarddetail = dao.detailBoard(idx);
  		  		  boarddetail.setBcode(bcode);
  		  		  boarddetail.setCp(cp);
  		  		  boarddetail.setPs(ps);
  		  		  boarddetail.setZcode(zcode);
  		  		  
  		  		  request.setAttribute("bcode",bcode);
  		  		  request.setAttribute("boarddetail",boarddetail);
		  		  
  		  		  forward = new ActionForward();
  		  		  if(edit == 1) {
  		  			forward.setPath("/WEB-INF/views/boardedit2.jsp");
  		  		  }else {
  		  			forward.setPath("/WEB-INF/views/boardDetail3.jsp");
  		  		  }
  			  	  
  			  	  System.out.println("디비에서 유저가 선택한 글 상세 뽑아오는 서비스 함수.. 과연 데이타는 여기까지 왔을까.. " + boarddetail);
  			  	  
	
		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}
	}


