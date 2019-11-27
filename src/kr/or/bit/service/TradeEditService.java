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


public class TradeEditService implements Action { //수여닝

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null; 
		System.out.println("에딧뷰단");
		
		try {
			
			int bcode = Integer.parseInt((String) request.getParameter("bcode"));
			int idx = Integer.parseInt((String) request.getParameter("idx"));
			int fidx = Integer.parseInt((String) request.getParameter("fidx"));
			
			System.out.println("에딧뷰단 bcode + idx 들어오나?" + bcode + idx + fidx);
			
			BoardDao dao = new BoardDao();
			Board detailBoard  = dao.detailBoard(idx);
			File detailFile = dao.detailFile(fidx);
			request.setAttribute("detailBoard", detailBoard);
			request.setAttribute("detailFile", detailFile);
			
			forward = new ActionForward();
			forward.setPath("/tradeEdit.jsp");
			
			System.out.println("에딧 보드 나오나요? " + detailBoard);
			System.out.println("에딧 보드 나오나요? " + detailFile);
			
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}
}