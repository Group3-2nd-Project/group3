package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ZzimDao;
import kr.or.bit.dto.Zzim_List;
import net.sf.json.JSONArray;

public class ZzimListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;
		try {
			//PrintWriter out = response.getWriter();
			int contentId = Integer.parseInt(request.getParameter("contentId"));
			HttpSession session = request.getSession();
	        String id = (String) session.getAttribute("id");
			System.out.println("아이디를 말해라 !! : "+contentId);
			System.out.println("리얼 아이디가 뭐냐!"+id);
			ZzimDao dao = new ZzimDao();
			List<Zzim_List> zzimlist = dao.zzimSearch(contentId, id);
			System.out.println("zzimlist는 나오니 서비스야? " + zzimlist);

			JSONArray jsonlistbyid = JSONArray.fromObject(zzimlist);
			System.out.println("제이슨 : " + jsonlistbyid);
			System.out.println("나오니??????");

			request.setAttribute("zzimlistbyid", jsonlistbyid);

			//out.print(jsonlistbydeptno);
			
			
		
			forward = new ActionForward(); 
			forward.setPath("/zzimList_ajax.jsp");
			  
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}
}
