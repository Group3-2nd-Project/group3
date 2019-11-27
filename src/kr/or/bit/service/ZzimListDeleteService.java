package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ZzimDao;

public class ZzimListDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;
		try {
			//PrintWriter out = response.getWriter();
			int contentId = Integer.parseInt(request.getParameter("contentId"));
			HttpSession session = request.getSession();
	        String id = (String) session.getAttribute("id");
			System.out.println("삭제아이디를 말해라 !! : "+contentId);
			System.out.println("삭제리얼 아이디가 뭐냐!"+id);
			ZzimDao dao = new ZzimDao();
			int result = dao.zzimDelete(contentId, id);

	        String board_msg="";
	        
	        if(result > 0) {
	           board_msg ="찜목록에서 제거되었습니다";
	        }else { //-1 (제약, 컬럼길이 문제)
	           board_msg ="찜목록 에러";
	        }
	        request.setAttribute("board_msg", board_msg);
	          
	        forward = new ActionForward();
	      //이동경로 설정
	        forward.setPath("/zzimInsert_ajax.jsp");
			  
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}
}
