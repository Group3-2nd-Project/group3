package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.Zzim_List;
import kr.or.bit.utils.ConnectionHelper;

public class ZzimDao {
DataSource ds = null;
	
	public ZzimDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
	}
	
	public ArrayList<Zzim_List> zzimSearch(int contentId, String id) {
		
		  Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
		  ArrayList<Zzim_List> zzimlist = new ArrayList<>();

		  
    try {
	        conn = ConnectionHelper.getConnection("oracle");
      String sql="select camidx, id from zzim_list where camidx=? and id =?";  //이건 바꾸기 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentId);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				Zzim_List zzim = new Zzim_List();
				zzim.setContentid(rs.getInt("camidx"));
				zzim.setId(rs.getString("id"));
				System.out.println("번호 : "+rs.getInt("camidx"));
				System.out.println("아이디 : "+rs.getString("id"));
				
				zzimlist.add(zzim);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    
		return zzimlist;
		
	}
	public ArrayList<Zzim_List> myZzimSearch(String id) {
		
		  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
		  ArrayList<Zzim_List> zzimlist = new ArrayList<>();

		  
  try {
	        conn = ConnectionHelper.getConnection("oracle");
    String sql="select camidx, id from zzim_list where id =?";  //이건 바꾸기 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				Zzim_List zzim = new Zzim_List();
				zzim.setContentid(rs.getInt("camidx"));
				zzim.setId(rs.getString("id"));
				System.out.println("번호 : "+rs.getInt("camidx"));
				System.out.println("아이디 : "+rs.getString("id"));
				
				zzimlist.add(zzim);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
  
		return zzimlist;
		
	}
	public int zzimInsert(int contentid, String id) {   //찜 리스트 추가
		PreparedStatement pstmt =null;
		Connection conn = null;
		String sql = "insert into zzim_list(camidx, id) values(?,?)";
		int resultrow = 0;		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentid);
			pstmt.setString(2, id);
			System.out.println("컨텐츠 아이디와 아이디는 : "+contentid+"와"+id+"입니다");
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return resultrow;
	}
	public int zzimDelete(int contentid, String id){
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "delete from zzim_list where camidx=? and id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentid);
			pstmt.setString(2, id);
			

			resultrow = pstmt.executeUpdate();
			System.out.println("resultrow : "+resultrow);
		} catch (Exception e) {
				System.out.println("db delete : " + e.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
		}
		return resultrow;
	}
	
	
	
	
}
