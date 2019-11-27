package kr.or.bit.service;

import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class MyInfoEditOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		 Member member = new Member();
		  ActionForward	forward = null;
		  try {
			String id = request.getParameter("myid");
			String pwd = request.getParameter("mypwd");
			String name = request.getParameter("myname");
			String hp = request.getParameter("myhp");
			member.setId(id);
			member.setPwd(pwd);
			member.setName(name);
			member.setHp(hp);
			MemberDao dao = new MemberDao();
			 int result = dao.memberEdit(member);
			  	  
			  	  String msg="";
			  	  String url="";
			  	  
			  	  if(result > 0) {
			  		  msg ="수정성공";
			  		  url ="MyPage.do";
			  	  }else { //-1 (제약, 컬럼길이 문제)
			  		  msg ="수정실패";
			  		  url ="MyPage.do";
			  	  }
			  	  request.setAttribute("board_msg", msg);
			  	  request.setAttribute("board_url", url);
			  	  
			  	  forward = new ActionForward();
			  	  forward.setPath("/WEB-INF/redirect.jsp");
			  	  
		  }catch (Exception e) {
			e.printStackTrace();
		  }	
			return forward;
	}

}
