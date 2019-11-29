package kr.or.bit.service;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.File;

public class BoardDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("-----------------------삭제  삭제 삭제  삭제------------------------------------------------------");
		System.out.println("보드 삭제  서비스 초입.. 여기까지 도 왜 안와??");
		 Board board = new Board();
		  ActionForward	forward = null;

		  
		 
		  int result;
		  
		  try {
			  
			  request.setCharacterEncoding("UTF-8");
			  
			  String mybcode = request.getParameter("bcode");
			  System.out.println("bcode는 여기까지 잘 왔을까??" + mybcode);
			  
			  String writer  = request.getParameter("writer");
			  System.out.println("글쓴이..." + writer);
			  
			  int idx = Integer.parseInt(request.getParameter("idx"));
			  System.out.println("수정할  원본글 번호 여기까지 왔을까?"+idx);
			  
			  
		      int cp = Integer.parseInt((String) request.getParameter("cp"));
		      System.out.println("current page 여기까지 올까??" + cp);
		      int ps = Integer.parseInt((String) request.getParameter("ps"));
		      System.out.println("page Size 여기까지 올까??" + ps);
		      int zcode = Integer.parseInt((String) request.getParameter("zcode"));
		      System.out.println("zcode 여기까지 올까??" + zcode);
			  
			  
			  
			  
			  
			  
			  BoardDao boarddao = new BoardDao(); 			  
				  
			System.out.println("파일이 없을 경우 여기 와야함");
			
					 
			result = boarddao.deleteBoard(idx);
					 
			  
			  
			  
			  
			  
			 
			 
			 System.out.println("너의 새로운 이름은 무엇이니??"+ board.getId());
			 
			 
			 System.out.println("디비에 유저가 글 쓴 내용이 과연 잘들어 갔나?? 0 이면 실패" + result);
			 
			  	  
                 request.setAttribute("bcode", mybcode);
                 request.setAttribute("cp", cp);
                 request.setAttribute("ps", ps);
                 request.setAttribute("zcode", zcode);
			  	  
		  }catch (Exception e) {
			e.printStackTrace();
		  }	
		  
	  	  forward = new ActionForward();
	  	  forward.setPath("boardList.do");
		  
			return forward;
	}

}
