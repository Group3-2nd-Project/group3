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

public class ReviewWriteService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
        ActionForward   forward = null;
        
         try {
            System.out.println("여기까진 오니?");
            
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
            
            String bcode  = multi.getParameter("bcode");
            String tcode = multi.getParameter("tcode");
            String title = multi.getParameter("title");
            String content = multi.getParameter("content");
            String id = multi.getParameter("id");
            
            
            System.out.println("bcode"+bcode + "tcode" +tcode + "title" + title + "content" + content + "id" + id);
            Enumeration filenames = multi.getFileNames();
            
            String files =(String)filenames.nextElement();
            String filename = multi.getFilesystemName(files);  //실제 서버 저장파일이름 
            String orifilename = multi.getOriginalFileName(files); //  원래 클라이언트가 저장한 이름   
            
            System.out.println(filename);
            System.out.println(orifilename);
            
              Board board = new Board();
              
              board.setBcode(Integer.parseInt(bcode));
              board.setTcode(Integer.parseInt(tcode));
              board.setTitle(title);
              board.setContent(content);
              board.setId(id);  
              
              File file = new File();

              file.setOriname(orifilename);
              file.setSavename(filename);
              
              
              
              BoardDao   dao = new BoardDao();
              int result = dao.boardInsert(board); // 1. 게시판에 글 넣기
              
             int result2 = dao.fileInsert(file); // 2. 게시판에 파일넣기
             request.setAttribute("bcode", bcode);
            System.out.println("비코드오니? 여기는 write 컨트롤러" + bcode);
              forward = new ActionForward();
             forward.setPath("/ReviewList.do?bcode=202&tcode=0");
              
             
             
             
         } catch (Exception e) {
            e.printStackTrace();
         }   

      return forward;
   }

}