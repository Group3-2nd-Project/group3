package kr.or.bit.service;

import java.util.Enumeration;

import javax.naming.NamingException;
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

public class ReviewEditOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws NamingException {
		ActionForward forward = null;
		
	      int result= 0;
	      int resultrow =0;
		
			try {
				ServletContext sc = request.getSession().getServletContext();
				String uploadpath = sc.getRealPath("upload");
				System.out.println("파일저장 : "+uploadpath);
					int size = 1024*1024*10;
				
				MultipartRequest multi = new MultipartRequest(
						request,
						uploadpath,
						size,
						"UTF-8",
						new DefaultFileRenamePolicy()
						);
				
				
				String idx = multi.getParameter("idx");
	            int fidx = Integer.parseInt(multi.getParameter("fidx"));
	            String id = multi.getParameter("id");
	            String bcode = multi.getParameter("bcode");
	            String tcode = multi.getParameter("tcode");
	            String title = multi.getParameter("title"); 
	            String content =multi.getParameter("content");
	            int cp = Integer.parseInt(multi.getParameter("cp"));
	            int ps = Integer.parseInt(multi.getParameter("ps"));
	            
	            System.out.println("수정ok 서비스입니다." + idx + "/fidx:"+ fidx + id + bcode + tcode + title + content);
	            Enumeration filename = multi.getFileNames();

	            
	            String files = (String)filename.nextElement();
	            String sfilename = multi.getFilesystemName(files);
	            String orifilename = (String)multi.getFilesystemName(files);

	            System.out.println("사진바꿀거있니?" + sfilename +"/" + orifilename);
	            
	            Board board = new Board();
	            board.setIdx(Integer.parseInt(idx));
	            board.setId(id);
	            board.setBcode(Integer.parseInt(bcode));
	            board.setTcode(Integer.parseInt(tcode));
	            board.setTitle(title);
	            board.setContent(content);

	            File file = new File();
	            file.setFidx(fidx);
	            file.setOriname(orifilename);
	            //file.setSavename(sfilename);
	            BoardDao boarddao = new BoardDao();
			       if(sfilename != null) {
			            String filePath = sfilename;
			            filePath=filePath.trim();                        
			             file.setSavename(sfilename);
			             resultrow = boarddao.editFile(file, fidx,0);
			         }else {             
			             resultrow = boarddao.editFile(file, fidx,1);
			             
			         }
	             
	             result = boarddao.editBoard(board);
	             //resultrow = boarddao.editFile(file, fidx);
					System.out.println("file 인서트_iy" + file);
					System.out.println("result값은 뭐지?_iy" + result);
					System.out.println("resultrow값은?_iy" + resultrow);

	             forward = new ActionForward();
	             forward.setPath("/ShowReviewDetail.do?bcode="+bcode+"&tcode="+tcode+"&cp="+cp+"&ps"+ps);

			} catch (Exception e) {
				e.printStackTrace();
			}
			

		
		return forward;
	}

}
