package kr.or.bit.service;

import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.bcel.internal.classfile.Field;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.File;



public class BoardWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		System.out.println("보드라이트 서비스 초입.. 여기까지 도 왜 안와??");
		 Board board = new Board();
		 File file = new File();
		  ActionForward	forward = null;
		  
		  
		 
		  int result;
		  
		  try {
			  
			  request.setCharacterEncoding("UTF-8");
			  
			  String mybcode = request.getParameter("bcode");
			  String writer  = request.getParameter("writer");
			  int idx = Integer.parseInt(request.getParameter("idx"));
			  
			  System.out.println("글쓴이..." + writer);
			  System.out.println(request.getParameter("bcode"));
			  System.out.println("bcode는 여기까지 잘 왔을까??" + mybcode);
			  System.out.println("답글의 원본글 번호 여기까지 왔을까?"+idx);
			  
			  BoardDao boarddao = new BoardDao(); 
			  
			  if(idx != 0) {
				  board.setId(request.getParameter("writer"));
					 board.setBcode(Integer.parseInt(request.getParameter("bcode")));
					 board.setTcode(Integer.parseInt(request.getParameter("tcode")));
					 board.setTitle(request.getParameter("subject")); 
					 board.setContent(request.getParameter("content")); 
					 
					 result = boarddao.reboardInsert(board,idx);
			  }else if(mybcode.equals("401") || mybcode.equals("303")) {
				  System.out.println("파일이 없을 경우 여기 와야함");
				  board.setId(request.getParameter("writer"));
					 board.setBcode(Integer.parseInt(request.getParameter("bcode")));
					 board.setTcode(Integer.parseInt(request.getParameter("tcode")));
					 board.setTitle(request.getParameter("subject")); 
					 board.setContent(request.getParameter("content")); 
					 
					 result = boarddao.boardInsert(board);
					 
			  }else {
				  ServletContext sc = request.getSession().getServletContext();
				    String dir = sc.getRealPath("upload");
				System.out.println("파일이 있는 경우 이게 보여야 하는데.. : "+dir);
				int size = 1024*1024*10;
				
				
				MultipartRequest multi = new MultipartRequest(
						request,
						dir,
						size,
						"UTF-8",
						new DefaultFileRenamePolicy()
						);

				String id = multi.getParameter("writer");
				String bcode  = multi.getParameter("bcode");
				String tcode = multi.getParameter("tcode");
				String title = multi.getParameter("subject");
				String content = multi.getParameter("content");
				

				Enumeration filenames = multi.getFileNames();
				
				String files =(String)filenames.nextElement();
				String filename = multi.getFilesystemName(files);  //실제 서버 저장파일이름 
				String orifilename = multi.getOriginalFileName(files); //  원래 클라이언트가 저장한 이름 
				
				
				 board.setId(id);
				 board.setBcode(Integer.parseInt(bcode));
				 board.setTcode(Integer.parseInt(tcode));
				 board.setTitle(title); 
				 board.setContent(content); 
				 
				 file.setOriname(orifilename);
				 file.setSavename(filename);
				 
				 result = boarddao.boardInsert(board, file);
			  }
			  
			  
			  
			  
			 
			 
			 System.out.println("너의 새로운 이름은 무엇이니??"+ board.getId());
			 
			 
			 System.out.println("디비에 유저가 글 쓴 내용이 과연 잘들어 갔나?? 0 이면 실패" + result);
			 
			  	  
                 request.setAttribute("bcode", mybcode);
			  	  
		  }catch (Exception e) {
			e.printStackTrace();
		  }	
		  
	  	  forward = new ActionForward();
	  	  forward.setPath("boardList.do");
		  
			return forward;
	}

}
