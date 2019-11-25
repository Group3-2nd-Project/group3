package kr.or.bit.service;

import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;

public class DetailCrossService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward forward = null;

      String data = "";
      
          try {
             
           request.setCharacterEncoding("utf-8");
           response.setContentType("text/html; charset=utf-8");
           String contentId = request.getParameter("contentId");
           String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=4Axvk6PyZ%2FHTR624%2B55Lt3tzBtDrMNWjR3vFCoC6bw8JgQgncE5vRstv58%2BxvNwYhj4Qh0jnrH9W2o1TwhKN0Q%3D%3D&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId="+contentId;
           System.out.println(addr);
         
           PrintWriter out = response.getWriter();
           URL url = new URL(addr);
           
           InputStream in = url.openStream();
           CachedOutputStream bos = new CachedOutputStream();
           IOUtils.copy(in, bos);
           in.close();
           bos.close();

           data = bos.getOut().toString();
           //out.println(data);
           System.out.println(data);
           
           request.setAttribute("data", data);
          // out.println(data);
   
             forward = new ActionForward();
             forward.setPath("/Campingdetail_json.jsp");
           
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
           
      return forward;
   }

}