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


public class TradeEditOkService implements Action { //수여닝

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null; 

		int result= 0;
		int resultrow =0;
		
		
		try {
			   //System.out.println("에딧 오케이~");
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
				
				String idx = multi.getParameter("idx");
	            int fidx = Integer.parseInt(multi.getParameter("fidx"));
				String id = multi.getParameter("id");
				String bcode = multi.getParameter("bcode");
				String tcode = multi.getParameter("tcode");
				String title = multi.getParameter("title"); 
				String content =multi.getParameter("content");
				//System.out.println("idx 옴?"  + idx);
			    //System.out.println("title 여기까지 옴?" + title);
			    //System.out.println("content 여기까지 옴?" + content);
			    //System.out.println("id 는? 들어오냐?" + id);
			    //System.out.println("fidx 는 왜 안 들어오지?"  +fidx);
		
				Enumeration filename = multi.getFileNames();
				
				String files = (String)filename.nextElement();
				String sfilename = multi.getFilesystemName(files);
				String orifilename = (String)multi.getFilesystemName(files);
				
				Board board = new Board();
				board.setIdx(Integer.parseInt(idx));
				board.setId(id);
				board.setBcode(Integer.parseInt(bcode));
				board.setTcode(Integer.parseInt(tcode));
				board.setTitle(title);
				board.setContent(content);
				//System.out.println("board 값들 다 들어오나???");
				
				File file = new File();
				file.setFidx(fidx);
				file.setOriname(orifilename);
			    file.setSavename(sfilename);
			    //System.out.println("파일도 읽어오나?");
			    System.out.println("oriname null?" + orifilename);
			    
			    BoardDao boarddao = new BoardDao();
				result = boarddao.editBoard(board);
				System.out.println("dao board" +board);
			       if(sfilename != null) {
			            String filePath = sfilename;
			            filePath=filePath.trim();                        
			             file.setSavename(sfilename);
			             resultrow = boarddao.editFile(file, fidx,0);
			         }else {             
			             resultrow = boarddao.editFile(file, fidx,1);
			             
			         }
	
				//System.out.println("board 인서트" + board);
				System.out.println("file 인서트" + file);
				System.out.println("result값은 뭐지?" + result);
				System.out.println("resultrow값은?" + resultrow);
				
				//System.out.println("보드 인서트가 잘 되나??? + 에딧 오케이 단");
				forward = new ActionForward();
		        forward.setPath("/TradeList.do?bcode=" + bcode);
				
	
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return forward;
	}

}