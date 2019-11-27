package kr.or.bit.controller;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.DetailCrossService;
import kr.or.bit.service.ListCrossService;
import kr.or.bit.service.LoginService;
import kr.or.bit.service.LogoutService;
import kr.or.bit.service.ReplyDeleteService;
import kr.or.bit.service.ReplyListService;
import kr.or.bit.service.ReplyWriteService;
import kr.or.bit.service.ReviewDetailService;
import kr.or.bit.service.ReviewListService;
import kr.or.bit.service.ReviewWriteService;
import kr.or.bit.service.SignUpService;
import kr.or.bit.service.TradeDeleteService;
import kr.or.bit.service.TradeDetailService;
import kr.or.bit.service.TradeEditOkService;
import kr.or.bit.service.TradeEditService;
import kr.or.bit.service.TradeListService;
import kr.or.bit.service.TradeReplyDeleteService;
import kr.or.bit.service.TradeReplyListService;
import kr.or.bit.service.TradeReplyWriteService;
import kr.or.bit.service.TradeWriteService;



@WebServlet("*.do")
public class FrontController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       

    public FrontController() {
        super();

    }

   private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Action action = null;
       ActionForward forward = null;
       
       String requestURI = request.getRequestURI();
       String contextPath = request.getContextPath();
       String url_Command = requestURI.substring(contextPath.length());
       
       
       if(url_Command.equals("/MainCampingview.do")) { // Camping 검색 : main > list 
          //UI처리 
          forward = new ActionForward();
          forward.setPath("/Test.jsp");
       }else if(url_Command.equals("/CampinglistCrossCK.do")) { // 캠핑 API list cross체크 처리
          //UI처리 + 로직처리 
         action = new ListCrossService();
          forward = action.execute(request, response);
          System.out.println("캠핑API 서비스 갔다왔어요. 지금은 CONTROLLER ");
       }else if(url_Command.equals("/CampingListview.do")) {
          //UI처리 
          forward = new ActionForward();
          forward.setPath("/Test2.jsp");
       }else if(url_Command.equals("/CampingDetailCrossCK.do")) { // 캠핑 API detail cross체크 처리
          //UI처리 + 로직처리
          action = new DetailCrossService();
          forward = action.execute(request, response);
          System.out.println("캠핑API 서비스 갔다왔어요. 지금은 CONTROLLER ");
          //여기서부터 중고 거래 게시판 관련 컨트롤러 시작 !!
       }else if(url_Command.equals("/TradeList.do")) { //수연
    	   //중고 거래 리스트
           action = new TradeListService();
           forward = action.execute(request, response);
           System.out.println("TradeList 서비스 다녀왔어요 ");  
           
       }else if(url_Command.equals("/TradeWrite.do")) { //수연
    	   //중고 거래 글쓰기
           action = new TradeWriteService();
           forward = action.execute(request, response);
           System.out.println("TradeWrite 서비스 다녀왔어요 "); 
           
       }else if(url_Command.equals("/TradeDetail.do")) { //수연
    	   //중고 거래 상세보기
           action = new TradeDetailService();
           forward = action.execute(request, response);
           System.out.println("TradeDetail 서비스 다녀왔어요");   
           
       }else if(url_Command.equals("/TradeEdit.do")) { //수연
    	   //중고 거래 수정하기
           action = new TradeEditService();
           forward = action.execute(request, response);
           System.out.println("TradeEdit 서비스 다녀왔어요"); 
           
       }else if(url_Command.equals("/TradeEditOk.do")) { //수연
    	   //중고 거래 수정 오케이
           action = new TradeEditOkService();
           forward = action.execute(request, response);
           System.out.println("TradeEditOk 서비스 다녀왔어요"); 
           
       }else if (url_Command.equals("/TradeDelete.do")) { //수연
    	   //중고 거래 삭제하기 
           action = new TradeDeleteService();
           forward = action.execute(request, response);
           System.out.println("TradeDelete 서비스 다녀왔어요"); 
 
       } else if (url_Command.equals("/TradeReplyWrite.do")) {//수연
           // 중고 거래 리뷰 글쓰기
           action = new TradeReplyWriteService();
           forward = action.execute(request, response);
       } else if (url_Command.equals("/TradeReplyList.do")) {//수연
           // 중고 거래 리뷰 리스트
           action = new TradeReplyListService();
           forward = action.execute(request, response);
       } else if (url_Command.equals("/TradeReplyDelete.do")) {//수연
           // 중고거래 리뷰 삭제 
           action = new TradeReplyDeleteService();
           forward = action.execute(request, response);  
           
           
           
       }else if(url_Command.equals("/SignUp.do")) { //양찬식 함수에 else if문 추가
           forward = new ActionForward();
           forward.setPath("/signUp.jsp");
       }else if(url_Command.equals("/SingUpOk.do")) { //else if문 추가
          action = new SignUpService();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
           
       }else if(url_Command.equals("/LogIn.do")) {//else if문 추가
           forward = new ActionForward();
           forward.setPath("/logIn.jsp");
        }else if(url_Command.equals("/LoginOk.do")) {//else if문 추가
           action = new LoginService();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
         }else if(url_Command.equals("/LogOut.do")) {//else if문 추가
          action = new LogoutService();
          try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
       
         } else if (url_Command.equals("/ReviewAdd.do")) { // @function : 후기글쓰기 @Date : 2019-11-24 @Author : 배인영
             // UI처리 + 로직처리
             System.out.println("여기오나요?");
             action = new ReviewWriteService();
             forward = action.execute(request, response);
          
          } else if (url_Command.equals("/ReviewList.do")) { // @function : 후기리스트 @Date : 2019-11-24 @Author : 배인영
             // UI처리 + 로직처리
             action = new ReviewListService();
             forward = action.execute(request, response);
      
          } else if (url_Command.equals("/ShowReviewWrite.do")) { // @function : 후기 글쓰기 페이지 view단 @Date : 2019-11-24 @Author : 배인영
             // UI처리
             forward = new ActionForward();
             forward.setPath("/review_write.jsp");
          } else if (url_Command.equals("/ShowrReviewDetail.do")) {// @function : 후기 글쓰기 페이지 view단 @Date : 2019-11-24 @Author : 배인영
             // UI처리 + 로직처리
             action = new ReviewDetailService();
             forward = action.execute(request, response);
     
          }else if(url_Command.equals("/ReviewReplyAdd.do")) {// @function : 후기 댓글 추가  @Date : 2019-11-26 @Author : 배인영
             //UI처리 + 로직처리 
             action = new ReplyWriteService();
             forward = action.execute(request, response);
    
          }else if(url_Command.equals("/ShowReviewReply.do")) {// @function : 후기 댓글 보여주세요 @Date : 2019-11-26 @Author : 배인영
             //UI처리 + 로직처리
                action = new ReplyListService();
                forward = action.execute(request, response);
    
          }else if(url_Command.equals("/DeleteReviewReply.do")) { // @function : 후기 댓글 삭제 @Date : 2019-11-27 @Author : 배인영
             System.out.println("DeleteReviewReply컨트롤러오니?");
                action = new ReplyDeleteService();
                forward = action.execute(request, response);
        
          }
       
       
       if(forward != null) {

             RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
             dis.forward(request, response);
          
       }
       
   }
   
    

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }

}