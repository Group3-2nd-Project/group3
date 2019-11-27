package kr.or.bit.service;

import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.File;

public class ReviewListService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

      ActionForward forward = null;

      try {
      
         int bcode = Integer.parseInt(request.getParameter("bcode"));
         String cp = request.getParameter("cp");
         String ps = request.getParameter("ps");
         
         
         
         System.out.println("비코드 오니?" +bcode);  //yes.
         
         BoardDao dao = new BoardDao();
         
         int totalcount = dao.totalBoardCount(bcode);
         
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
           
           
         List<File> reviewlist= dao.ReivewFilelist(cpage,pagesize,bcode);
         System.out.println("리스트나오니?" + reviewlist);
         
         request.setAttribute("reviewlist", reviewlist);
         request.setAttribute("cp", cpage);
         request.setAttribute("ps", pagesize);
         request.setAttribute("totalcount", totalcount);
         request.setAttribute("pagecount", pagecount);

           forward = new ActionForward();
           forward.setPath("/reviewList.jsp");
             
      } catch (Exception e) {
         
         e.printStackTrace();
      }
      
      return forward;
   }
}