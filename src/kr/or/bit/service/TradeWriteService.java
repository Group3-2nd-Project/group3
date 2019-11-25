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


public class TradeWriteService implements Action { //수여닝

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null; 

		int result= 0;
		
		try {
			   System.out.println("여기 왜 안탐?");
		     	request.setCharacterEncoding("UTF-8");
		
				ServletContext sc = request.getSession().getServletContext();
				String dir = sc.getRealPath("upload");
				System.out.println("파일 있는 경우 " + dir);
				int size = 1024*1024*10;
				
				MultipartRequest multi = new MultipartRequest(
				request,
				dir,
				size, 
				"UTF-8", 
				new DefaultFileRenamePolicy());
				
				String id = multi.getParameter("id");
				String bcode = multi.getParameter("bcode");
				String tcode = multi.getParameter("tcode");
				String title = multi.getParameter("title"); 
				String content =multi.getParameter("content");
			    System.out.println("title 여기까지 옴?" + title);
			    System.out.println("content 여기까지 옴?" + content);
			    System.out.println("id 는? 들어오냐?" + id);
		
				Enumeration filename = multi.getFileNames();
				
				String files = (String)filename.nextElement();
				String sfilename = multi.getFilesystemName(files);
				String orifilename = (String)multi.getFilesystemName(files);
				
				Board board = new Board();
				board.setId(id);
				board.setBcode(Integer.parseInt(bcode));
				board.setTcode(Integer.parseInt(tcode));
				board.setTitle(title);
				board.setContent(content);
				System.out.println("board 값들 다 들어오나???" );
				File file = new File();
				file.setOriname(orifilename);
			    file.setSavename(sfilename);
			    System.out.println("파일도 읽어오나?");
			    BoardDao boarddao = new BoardDao();
				result = boarddao.boardInsert(board);
				result = boarddao.fileInsert(file);
				System.out.println("파일 인서트가 잘 되나???");
				forward = new ActionForward();
				forward.setPath("/TradeList.do?bcode=" + bcode);				
		        
				
	
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}

}