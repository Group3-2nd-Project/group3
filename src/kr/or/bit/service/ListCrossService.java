package kr.or.bit.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class ListCrossService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      PrintWriter out = null;
      InputStream in = null;
      CachedOutputStream bos = null;
      URL url = null;

      ActionForward forward = null;

      String listdata = "";
      
          try {
            request.setCharacterEncoding("utf-8");
             response.setContentType("text/html; charset=utf-8");
              
              String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=4Axvk6PyZ%2FHTR624%2B55Lt3tzBtDrMNWjR3vFCoC6bw8JgQgncE5vRstv58%2BxvNwYhj4Qh0jnrH9W2o1TwhKN0Q%3D%3D&contentTypeId=28&cat1=A03&cat2=A0302&cat3=A03021700&listYN=Y&MobileOS=ETC&MobileApp=AppTest&_type=json&numOfRows=60";
            
              out = response.getWriter();
              url = new URL(addr);
              
              in = url.openStream();
              bos = new CachedOutputStream();
              IOUtils.copy(in, bos);


              listdata = bos.getOut().toString();
              System.out.println(listdata);
              request.setAttribute("listdata", listdata);
             // out.println(data);
      
              forward = new ActionForward();
              forward.setPath("/Campinglist_json.jsp");
         } catch (Exception e) {

            e.printStackTrace();
         }finally {
              try {
               in.close();
               bos.close();
            } catch (IOException e) {
               e.printStackTrace();
            }
              
            
         }
         return forward;
          
       
   }

}