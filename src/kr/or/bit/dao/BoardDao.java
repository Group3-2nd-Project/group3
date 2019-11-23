package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.Board;
import kr.or.bit.dto.BoardForReply;
import kr.or.bit.dto.File;
import kr.or.bit.utils.DB_Close;


public class BoardDao {	
	DataSource ds = null;
	
	public BoardDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");

	}

	public int boardInsert(Board board) {   //글쓰기Dao
		PreparedStatement pstmt =null;
		Connection conn = null;
		
		String sql = "insert into board(idx, id, bcode, tcode, title, content, readnum, writedate, ref, dept, step, cocode) values(test1.nextval,?,?,?,?,?,0,sysdate,?,0,0,0)";
		int resultrow = 0;		
		try {														
			conn = ds.getConnection();								
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, board.getId());
			pstmt.setInt(2, board.getBcode());
			pstmt.setInt(3, board.getTcode());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			int refermax = getMaxRefer();
			int refer = refermax + 1;
			pstmt.setInt(6, refer);
			
			
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
				
			
				
			}catch (Exception e) {
			}
		}
		return resultrow;
	}
	
	public int boardInsert(Board board, File file) {   //글쓰기Dao
		PreparedStatement pstmt =null;
		Connection conn = null;
		
		String sql = "insert into board(idx, id, bcode, tcode, title, content, readnum, writedate, ref, dept, step, cocode) values(test1.nextval,?,?,?,?,?,0,sysdate,?,0,0,0)";
		int resultrow = 0;		
		try {														
			conn = ds.getConnection();								
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, board.getId());
			pstmt.setInt(2, board.getBcode());
			pstmt.setInt(3, board.getTcode());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			int refermax = getMaxRefer();
			int refer = refermax + 1;
			pstmt.setInt(6, refer);
			
			
			resultrow = pstmt.executeUpdate();
			
			int resultForfile = fileInsert(file); 
			
			if(resultForfile == 0) {
				System.out.println("디비에 저장할 파일 정보가 없거나.. 디비에 파일 정보 저장 실패");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
				
			
				
			}catch (Exception e) {
			}
		}
		return resultrow;
	}
	
	

	public int fileInsert(File file) {   //파일 글쓰기Dao
		PreparedStatement pstmt =null;
		Connection conn = null;
		String sql = "insert into file(fidx, idx, oriname, savename, fsize, cocode) values(test2.nextval,test1.currval,?,?,?,0)";	//날짜 제외(DB에서 Timestamp로)
		
		int resultrow = 0;		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, file.getIdx());
			pstmt.setString(2, file.getOriname());
			pstmt.setString(3, file.getSavename());
			pstmt.setInt(4, file.getFsize());
			
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
			}catch (Exception e) {
			}
		}
		return resultrow;
	}
	
	
	private int getMaxRefer() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int refer_max=0;
		try {
			conn = ds.getConnection(); //빌려주세여^^  이따 반납할게요 
			String sql="select nvl(max(ref),0) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				refer_max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close(); //반납이요 ^^
			}catch (Exception e) {
				
			}
		}
		
		return refer_max;
		
	}

	public ArrayList<Board> showBoard(int bcode) {   //글목록 보기
		PreparedStatement pstmt =null;
		Connection conn = null;
		ResultSet rs = null;
		
		ArrayList<Board> boardlist =new ArrayList<>();
		String sql = "select idx, id, bcode, tcode, title, readnum, writedate from board where bcode=? and cocode=0 order by ref desc , step asc";	
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board boarddto = new Board();
				boarddto.setIdx(rs.getInt("idx"));
				boarddto.setId(rs.getString("id"));
				boarddto.setBcode(rs.getInt("bcode"));
				boarddto.setTcode(rs.getInt("tcode"));
				boarddto.setTitle(rs.getString("title"));
				boarddto.setReadnum(rs.getInt("readnum"));
				boarddto.setWritedate(rs.getString("writedate"));
				boardlist.add(boarddto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return boardlist;
	}
	
	
	public Board detailBoard(int idx) {   //글 상세 보기
		getReadNum(idx);	//조회수 증가 함수
		PreparedStatement pstmt =null;
		Connection conn = null;
		ResultSet rs = null;
		Board boarddto = null;
		String sql = "select idx, id, bcode, tcode, title, content, readnum, writedate from board where idx=?";	
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boarddto = new Board();
				boarddto.setIdx(rs.getInt("idx"));
				boarddto.setId(rs.getString("id"));
				boarddto.setBcode(rs.getInt("bcode"));
				boarddto.setTcode(rs.getInt("tcode"));
				boarddto.setTitle(rs.getString("title"));
				boarddto.setContent(rs.getString("content"));
				boarddto.setReadnum(rs.getInt("readnum"));
				boarddto.setWritedate(rs.getString("writedate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return boarddto;
	}
	

	//게시글 조회수 증가 
	public int getReadNum(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;	
		try {
			conn = ds.getConnection();
			String sql="update board set readnum = readnum + 1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
			}catch (Exception e) {
			}
		}
		return resultrow;
	}
	
	
	public int editBoard(Board board) {   //글 수정
		PreparedStatement pstmt =null;
		Connection conn = null;
		String sql = "update board set title=?, content=? where idx=?";	
		int resultrow = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getIdx());
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return resultrow;
	}
	
	
	public int deleteBoard(int idx) {   //글 삭제(=ccode 수정)
		PreparedStatement pstmt =null;
		Connection conn = null;
		String sql = "update board set cocode=? where idx=?";	
		int resultrow = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, idx);
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return resultrow;
	}
	
	
	public ArrayList<Board> searchBoard(int bcode, String keyword) {   //글 검색하기(제목으로 검색)
		PreparedStatement pstmt =null;
		Connection conn = null;
		ResultSet rs = null;
		Board boarddto = null;
		ArrayList<Board> boardlist = null;
		String sql = "select idx, id, bcode, tcode, title, readnum, writedate from board where bcode=? and cocode=0 and title like '%?%'"; 	//DB에서는 영어 대소문자 구분한다.	
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			pstmt.setString(2, keyword);
			rs = pstmt.executeQuery();
			boardlist = new ArrayList<>();
			while(rs.next()) {
				boarddto = new Board();
				boarddto.setIdx(rs.getInt("idx"));
				boarddto.setId(rs.getString("id"));
				boarddto.setBcode(rs.getInt("bcode"));
				boarddto.setTcode(rs.getInt("tcode"));
				boarddto.setTitle(rs.getString("title"));
				boarddto.setReadnum(rs.getInt("readnum"));
				boarddto.setWritedate(rs.getString("writedate"));
				boardlist.add(boarddto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return boardlist;
	}
	
	
	public int replyInsert(BoardForReply reply) {   //댓글쓰기Dao
		PreparedStatement pstmt =null;
		Connection conn = null;
		String sql = "insert into reply(replyidx, idx, replycontent, replyid, replydate, cocode) values(sequence.nextval,?,?,?,sysdate,0)";	//날짜 제외(DB에서 Timestamp로)
		
		int resultrow = 0;		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getIdx());
			pstmt.setString(2, reply.getReplycontent());
			pstmt.setString(3, reply.getReplyid());
			
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
			}catch (Exception e) {
			}
		}
		return resultrow;
	}
	
	
	public int deleteReply(int replyidx) {   //댓글 삭제(=cocode 수정)
		PreparedStatement pstmt =null;
		Connection conn = null;
		String sql = "update reply set cocode=1 where replyidx=?";	
		int resultrow = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyidx);
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return resultrow;
	}
	
	public ArrayList<BoardForReply> showreply(int idx) {   //댓글목록 보기
		PreparedStatement pstmt =null;
		Connection conn = null;
		ResultSet rs = null;
		BoardForReply boarddto = null;
		ArrayList<BoardForReply> boardlist = null;
		String sql = "select replycontent, replyid, replydate from reply where idx=? and cocode=0 order by replyidx desc";	
	
		try {
			conn = ds.getConnection();
			boardlist = new ArrayList<>();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boarddto = new BoardForReply();
				boarddto.setReplycontent(rs.getString("replycontent"));
				boarddto.setReplyid(rs.getString("replyid"));
				boarddto.setReplydate(rs.getString("replydate"));
				boardlist.add(boarddto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return boardlist;
	}
	
	
	
	
	
	public int reboardInsert(Board board, int idx) {   //답글쓰기Dao
		PreparedStatement pstmt =null;
		Connection conn = null;
		ResultSet rs = null;
		int resultrow = 0;		
		
		String sql_origin = "select ref, dept, step from board where idx=?";
		String sql_update_old = "update board set step = step+1 where step > ? and ref =?";
		String sql_insert = "insert into board(idx, id, bcode, tcode, title, content, readnum, writedate, ref, dept, step, cocode) values(sequence.nextval,?,?,?,?,?,0,sysdate,?,?,?,0)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql_origin);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int dept = rs.getInt("dept");
			
				pstmt = conn.prepareStatement(sql_update_old);
				pstmt.setInt(1, step);
				pstmt.setInt(2, ref);
				pstmt.executeUpdate();
			
				pstmt = conn.prepareStatement(sql_insert);
				pstmt.setString(1, board.getId());
				pstmt.setInt(2, board.getBcode());
				pstmt.setInt(3, board.getTcode());
				pstmt.setString(4, board.getTitle());
				pstmt.setString(5, board.getContent());
				pstmt.setInt(6, ref);
				pstmt.setInt(7, dept+1);
				pstmt.setInt(8, step+1);
				
				resultrow = pstmt.executeUpdate();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
				rs.close();
			}catch (Exception e) {
			}
		}
		return resultrow;
	}
	

	
	public int deleteFile(int fidx) {   //댓글 삭제(=cocode 수정)
		PreparedStatement pstmt =null;
		Connection conn = null;
		String sql = "update file set cocode=1 where fidx=?";	
		int resultrow = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fidx);
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();//반환
			}catch (Exception e) {
				
			}
		}
		return resultrow;
	}
	
	
	
}
