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
import kr.or.bit.service.SignUpService;
import kr.or.bit.service.TradeDetailService;
import kr.or.bit.service.TradeListService;
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
       }else if(url_Command.equals("/TradeList.do")) { //중고거래 판매 게시글 목록 보기 뚜여닝~^^
           action = new TradeListService();
           forward = action.execute(request, response);
           System.out.println("TradeList 서비스 다녀왔어요 ");  
       }else if(url_Command.equals("/TradeWrite.do")) { //중고거래 판매 게시글 쓰기 ok 뚜여닝~^^
           action = new TradeWriteService();
           forward = action.execute(request, response);
           System.out.println("TradeWrite 서비스 다녀왔어요 "); 
       }else if(url_Command.equals("/TradeDetail.do")) { //중고거래 판매 게시글 디테일 모달 뚜여닝~^^
           action = new TradeDetailService();
           forward = action.execute(request, response);
           System.out.println("TradeDetail 서비스 다녀왔어요");       
       }else if(url_Command.equals("/TradeWriteOk.do")) { //중고거래 판매 게시글 디테일 모달 뚜여닝~^^
           action = new TradeDetailService();
           forward = action.execute(request, response);
           System.out.println("TradeWriteOk 서비스 다녀왔어요");           
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