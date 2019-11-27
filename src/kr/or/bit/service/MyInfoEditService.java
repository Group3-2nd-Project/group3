package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dao.ZzimDao;
import kr.or.bit.dto.Member;
import kr.or.bit.dto.Zzim_List;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MyInfoEditService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;
		try {
			//PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
	        String id = (String) session.getAttribute("id");
			System.out.println("리얼 아이디가 뭐냐!"+id);
			MemberDao dao = new MemberDao(); 
			Member member = dao.myInfoSearch(id); 
			System.out.println("member는 나오니 서비스야? " + member);
			JSONObject jsonobj = JSONObject.fromObject(member);
			request.setAttribute("zzimlistbyid", jsonobj);

			
			
		
			forward = new ActionForward(); 
			forward.setPath("/zzimList_ajax.jsp");
			  
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}
}
