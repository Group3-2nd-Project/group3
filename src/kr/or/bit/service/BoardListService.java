package kr.or.bit.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import net.sf.json.JSONArray;

public class BoardListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		System.out.println("최소한 여기까지는 와야지... 보드리스트 서비스 함수 안이다");
		
		String sw = (String)request.getParameter("sw");
		  System.out.println("---------------서치서치서치서치서치서ㅣㅊ서ㅣㅊ서ㅣㅊ-----여기는 보드 리스트 서비스 함수 안----------------------------------------");
		  System.out.println("서치워드 여기 들어 오나요?? " +">"+ sw+"<");
		  
		try {
			System.out.println("여기는 트라이 안쪽.. 보드리스트 서비스 함수 안이다");
			      int bcode = Integer.parseInt((String) request.getParameter("bcode"));
			      System.out.println("bcode 여기까지 올까??" + bcode);
			      int cp = Integer.parseInt((String) request.getParameter("cp"));
			      System.out.println("current page 여기까지 올까??" + cp);
			      int ps = Integer.parseInt((String) request.getParameter("ps"));
			      System.out.println("page Size 여기까지 올까??" + ps);
			      int zcode = Integer.parseInt((String) request.getParameter("zcode"));
			      System.out.println("zcode 여기까지 올까??" + zcode);
			     
  		  		  BoardDao dao = new BoardDao();
  		  		ArrayList<Board> boardlist = new ArrayList<Board>();
  		  		  if(sw != null) {
  		  			
  		  			  
  		  			boardlist = dao.list(cp, ps, bcode,sw);
  		  			
  		  		  }else {
  		  			boardlist = dao.list2(cp, ps, bcode);
  		  		  }
  		  		  
  		  		  //해당 게시판 액티브한 글의 수... 를 카운트하기 위한... 변수 그룻
  		  		  int tbc; 
  		  		 
  		  		forward = new ActionForward();
  		  		
  		  		
  		  		
  		  		//비동기 처리를 위해 zcode 만듦
  		  		// 0 동기 처리, 1 비동기 처리, 2 토탈 넘버 카운트 처리 3 서치기능 처리 
  		  		
  		  		
  		  		
  		  		  if(zcode ==0) {
  		  			request.setAttribute("boardlist",boardlist );
  		  			
  		  			System.out.println("11111"+cp);
  		  			System.out.println("11111"+ps);
  		  			System.out.println("2222"+bcode);
    		  		 
    		  		  request.setAttribute("cp", cp);
    		  		  request.setAttribute("ps", ps);
    		  		  request.setAttribute("bcode", bcode);
    		  		forward.setPath("/WEB-INF/views/qna"+bcode+".jsp");
  		  		  }else if(zcode == 1) {
  		  			  JSONArray jsonarray = JSONArray.fromObject(boardlist);
  		  			  request.setAttribute("boardlist", jsonarray);
  		  			forward.setPath("/WEB-INF/views/qna"+bcode+"ajax.jsp");
  		  		  }else if(zcode ==2) {
  		  			 if(sw != null) {
  	  		  			
  	  		  			  
  		  				tbc = dao.totalBoardCount(bcode, sw);
  	  		  			
  	  		  		  }else {
  	  		  		     tbc = dao.totalBoardCount(bcode);
  	  		  		  }
  		  			  
  		  			request.setAttribute("totalboardcount", tbc);
  		  			forward.setPath("/WEB-INF/views/qna"+bcode+"ajax2.jsp");
  		  		    System.out.println("토탈보드카운트는??" + tbc);
  		  		  }
  		  		  
  		  		  
  		  		  
		  		  
  		  		  
  			  	  
  			  	  
  			  	  System.out.println("디비에서 게시판 목록 뽑아오는 서비스 함수.. 과연 데이타는 여기까지 왔을까.. " + boardlist);
  			  	  System.out.println("보드리스트의 사이즈는?? " +boardlist.size());
	
		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}

}
