package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

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
			
			int bcode = Integer.parseInt(request.getParameter("bcode"));
			String cp = request.getParameter("cp");
			String ps = request.getParameter("ps");
			// String cp = "1";
	        // String ps = "5";
			System.out.println("bcode 왜 여기로 안 들어와?/?/?//" +bcode);
			
			 BoardDao dao = new BoardDao();
			 int totalcount = dao.totalBoardCount(bcode);
	         System.out.println("총개수"+totalcount);
	         if(ps == null || ps.trim().equals("")){
	            //default 값 설정
	            ps = "5";
	         }
	         if(cp == null || cp.trim().equals("")){
	            //default 값 설정
	            cp = "1";
	         }
	         
	         
	           int cpage = Integer.parseInt(cp); 
	           int pagesize = Integer.parseInt(ps);  
	           int pagecount = 0; 
	         
	         
	           if(totalcount % pagesize==0){        //전체 건수 , pagesize > 
	               pagecount = totalcount/pagesize;
	           }else{
	               pagecount = (totalcount/pagesize) + 1;
	           }
			/* ArrayList<File> boardfile = dao.showBoardFile(bcode); */
			List<File> boardfile = dao.ReivewFilelist(cpage,pagesize,bcode);
			request.setAttribute("boardfile", boardfile);
		    request.setAttribute("cp", cpage);
		    request.setAttribute("ps", pagesize);
		    request.setAttribute("totalcount", totalcount);
		    request.setAttribute("pagecount", pagecount);
			
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/tradelist.jsp");
			
			System.out.println("디비에서 게시판 목록 불러오는 함수 " + boardfile);
			System.out.println("boardfile size" + boardfile.size());
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}

}