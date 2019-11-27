package kr.or.bit.service;

import java.util.ArrayList;
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


public class TradeDeleteService implements Action { //수여닝

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null; 
		System.out.println("딜리트 서비스 들어옴");
		try {
			
			int idx = Integer.parseInt((String) request.getParameter("idx"));
			int fidx = Integer.parseInt((String) request.getParameter("fidx"));
			int bcode = Integer.parseInt((String) request.getParameter("bcode"));
			System.out.println("bcode+idx+fidx" +fidx + idx + bcode);
			
			BoardDao dao = new BoardDao();
			int deletefile  = dao.deleteFile(fidx);
			request.setAttribute("deletefile", deletefile);
			System.out.println("딜리트 파일 삭제 " + deletefile);
			int deleteboard = dao.deleteBoard(idx);
			request.setAttribute("deleteboard", deleteboard);
			
			
			
			System.out.println("딜리트보드" + deleteboard);
			forward = new ActionForward();
			forward.setPath("/TradeList.do");
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}

}