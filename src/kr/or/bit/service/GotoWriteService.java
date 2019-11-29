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

public class GotoWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("-----------------------글 쓰러 가자------------------------------------------------------");
		System.out.println("글 쓰러 가기  서비스 초입.. 여기까지 도 왜 안와??");
		
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
			  
			  
			  	  
                 request.setAttribute("bcode", mybcode);
                 request.setAttribute("cp", cp);
                 request.setAttribute("ps", ps);
                 request.setAttribute("zcode", zcode);
                 request.setAttribute("tcode", 0);
                 request.setAttribute("idx", idx);
			  	  
		  }catch (Exception e) {
			e.printStackTrace();
		  }	
		  
	  	  forward = new ActionForward();
	  	  forward.setPath("/boardWrite2.jsp");
		  
			return forward;
	}

}
