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

		
		Board board = new Board();
		File file = new File();
		ActionForward forward = null; 

		int result= 0;
		try {
			
			request.setCharacterEncoding("UTF-8");
			
			String mybcode = request.getParameter("bcode");
			String writer = request.getParameter("writer");
			//String title = request.getParameter("title");
			//String content = request.getParameter("content");
			//String file = request.getParameter("file");
			
			System.out.println("글쓴이 들어옴????" + writer);
			System.out.println(request.getParameter("bcode"));
			System.out.println("bcode 여기까지 옴?" + mybcode);
			//System.out.println("title 여기까지 옴?" + title);
			//System.out.println("content 여기까지 옴?" + content);
			
			
			BoardDao boarddao = new BoardDao();
			
			if (mybcode.equals("102") || mybcode.equals("303")) {
				System.out.println("파일이 없을 경우");
				board.setId(request.getParameter(writer));
				board.setBcode(Integer.parseInt(request.getParameter("bcode")));
				board.setTcode(Integer.parseInt(request.getParameter("tcode")));
				board.setTitle(request.getParameter("title"));
				board.setContent(request.getParameter("content"));
				
				result= boarddao.boardInsert(board);
				
			}else {
				ServletContext sc = request.getSession().getServletContext();
				String dir = sc.getRealPath("upload");
				System.out.println("파일 없는 경우 " + dir);
				int size = 1024*1024*10;
				
				MultipartRequest multi = new MultipartRequest(
						request, dir, size, "UTF-8", new DefaultFileRenamePolicy());
				
				String id = multi.getParameter("writer");
				String bcode = multi.getParameter("bcode");
				String tcode = multi.getParameter("tcode");
				 String title = multi.getParameter("title"); 
				 String content =multi.getParameter("content");
					System.out.println("title 여기까지 옴?" + title);
					System.out.println("content 여기까지 옴?" + content);
				
				
				
				Enumeration filename = multi.getFileNames();
				
				String files = (String)filename.nextElement();
				//String filename = multi.getFilesystemName(files);
				String orifilename = multi.getFilesystemName(files);
				
				board.setId(id);
				board.setBcode(Integer.parseInt(bcode));
				board.setTcode(Integer.parseInt(tcode));
				board.setTitle(title);
				board.setContent(content);
				
				file.setOriname(orifilename);
			//	file.setSavename(filename);

				result = boarddao.boardInsert(board, file);// dao에서 boardInsert 함수 하나 더 만듦 (파라미터 board,file을 넣은 거로)
				
			}
			

			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}

}