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

import kr.or.bit.dto.Member;


public class MemberDao {
	DataSource ds = null;
	
	public MemberDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
	}
	
	public String isIdcheck(String id) {	//아이디 중복 체크
		String ischeckid= null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = ds.getConnection();
				String sql = "select id from member where id=?";	//활동중인 회원 ID만 비교
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
		
				rs = pstmt.executeQuery();
				
				if(rs.next()) 
				{
					ischeckid = "false"; //아이디가 중복될때
				}
				else {
					ischeckid = "true"; //아이디가 없을때 
				}
				
				if(id.equals("")){
					ischeckid ="empty"; //id가 빈값일때 
				}
				
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
				rs.close();
			}catch (Exception e) {
			}
		}
		return ischeckid;	//true, false, empty 중 하나 리턴
	}
	
	
	
	
	public int memberInsert(Member member) {	//회원가입
			Connection conn = null;
			PreparedStatement pstmt = null;
	
			String sql = "insert into member(id, pwd, name, hp, grade) values (?,?,?,?,1)";
			int row =0;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPwd());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getHp());
				row = pstmt.executeUpdate();
				
			} catch (SQLException e) {
	
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();//반환
				}catch (Exception e) {
				}
			}
			return row;	//성공 1, 실패 0 리턴
	}
		
		
	public ArrayList<Member> memberList() {		//회원리스트 불러오기
		Member member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> memberList = new ArrayList<Member>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select id, pwd, name, hp, grade from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			if(rs.next()) {
				member = new Member();
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setHp(rs.getString("hp"));
				member.setGrade(rs.getInt("grade")); 
				memberList.add(member);
			} 
							
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					pstmt.close();
					conn.close();//반환
					rs.close();
				}catch (Exception e) {
				}
			}
			return memberList;
	}
			
		
	public int memberGrade(String id, int grade) {		//회원 등급 변경(탈퇴 포함)
		Connection conn = null;							//관리자만 사용 가능
		PreparedStatement pstmt = null;
		int resultrow = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "update member set grade=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, grade);
			pstmt.setString(2, id);
			
			resultrow = pstmt.executeUpdate();				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					pstmt.close();
					conn.close();//반환
				}catch (Exception e) {
				}
			}
			return resultrow;
	}
	
	public Member myInfoSearch(String id) {		//회원리스트 불러오기
		Member member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		member = new Member();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select id, pwd, name, hp, grade from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	
			if(rs.next()) {
				member = new Member();
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setHp(rs.getString("hp"));
				member.setGrade(rs.getInt("grade")); 
			} 
							
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					pstmt.close();
					conn.close();//반환
					rs.close();
				}catch (Exception e) {
				}
			}
			return member;
	}
	public int memberEdit(Member member) {		//회원 수정 (이름,hp,비밀번호)
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "update member set pwd=?, name=?, hp=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getHp());
			pstmt.setString(4, member.getId());
			
			resultrow = pstmt.executeUpdate();				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					pstmt.close();
					conn.close();//반환
				}catch (Exception e) {
				}
			}
			return resultrow;
	}

	public Boolean Login(String id, String pwd) {
		boolean isLogin = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select id from member where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) { //맞는 데이터가 있으면
				isLogin = true;
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					pstmt.close();
					conn.close();//반환
					rs.close();
				}catch (Exception e) {
			}
		}
		return isLogin;
	}
		
	
	
		
		
	
	
	
	
	
	
	
}
