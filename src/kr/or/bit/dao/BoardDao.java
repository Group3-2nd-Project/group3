
package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
   

   

   public int fileInsert(File file) {   //파일 글쓰기Dao
      PreparedStatement pstmt =null;
      Connection conn = null;
      String sql = "insert into fileupload(fidx, idx, oriname, savename, fsize, cocode) values(test2.nextval,test1.currval,?,?,?,0)";   //날짜 제외(DB에서 Timestamp로)
      
      int resultrow = 0;      
      try {
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, file.getOriname());
         pstmt.setString(2, file.getSavename());
         pstmt.setInt(3, file.getFsize());
         
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
      String sql = "select idx, id, bcode, tcode, title, content, readnum, writedate from board where bcode=? and cocode=0 order by ref desc , step asc";   
   
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
            boarddto.setContent(rs.getString("content"));
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
   
   
   public Board detailBoard(int idx, int tcode) {   //글 상세 보기, tcode 파라 미터 추가했어요 !!! 수연 
	      getReadNum(idx);   //조회수 증가 함수
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

   
   public File detailFile(int fidx, int tcode) {//파일 상세 보기 수연 tcode 파라 미터 추가했어요 !!! 수연
	      getReadNum(fidx);   //조회수 증가 함수
	      PreparedStatement pstmt =null;
	      Connection conn = null;
	      ResultSet rs = null;
	      
	      File filedto = null;
	      String sql = "select fidx, idx, oriname, savename, fsize, cocode from fileupload where fidx=?";   
	   
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, fidx);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	filedto = new File();
	        	filedto.setFidx(rs.getInt("fidx"));
	        	filedto.setIdx(rs.getInt("idx"));
	        	filedto.setOriname(rs.getString("oriname"));
	        	filedto.setSavename(rs.getString("savename"));
	        	filedto.setFsize(rs.getInt("fsize"));
	        	filedto.setCocode(rs.getInt("cocode"));
	
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
	      return filedto;
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
   
   
   public int editBoard(Board board) {   //글 수정  //수연이가 오늘 tcode추가했어요~ tcode판매중, 판매완료때문에
       PreparedStatement pstmt =null;
       Connection conn = null;
       String sql = "update board set tcode=?, title=?, content=? where idx=?";   
       int resultrow = 0;
       
       try {
          conn = ds.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, board.getTcode());
          pstmt.setString(2, board.getTitle());
          pstmt.setString(3, board.getContent());
          pstmt.setInt(4, board.getIdx());
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
 
   
   
   public int editFile(File file, int fidx, int a) {   //파일글 수정 수연
       PreparedStatement pstmt = null;
       Connection conn = null;
       String sql = "update fileupload set fidx=?, oriname=?, savename=?, fsize=?, cocode=?  where fidx=?";   
       String sql2 = "update fileupload set fidx=?, oriname=?, fsize=?, cocode=?  where fidx=?";   
       int resultrow = 0;
       
       try {
    	   if(a==0) {
    		   conn = ds.getConnection();
    	          pstmt = conn.prepareStatement(sql);
    	          pstmt.setInt(1, fidx);
    	          pstmt.setString(2, file.getOriname());
    	          pstmt.setString(3, file.getSavename());
    	          pstmt.setInt(4, file.getFsize());
    	          pstmt.setInt(5, file.getCocode());
    	          pstmt.setInt(6, file.getFidx());
    	          resultrow = pstmt.executeUpdate(); 
    	   }else if(a==1) {
    		   conn = ds.getConnection();
    	          pstmt = conn.prepareStatement(sql2);
    	          pstmt.setInt(1, fidx);
    	          pstmt.setString(2, file.getOriname());
    	          pstmt.setString(3, file.getSavename());
    	          pstmt.setInt(4, file.getFsize());
    	          pstmt.setInt(5, file.getCocode());
    	          pstmt.setInt(6, file.getFidx());
    	          resultrow = pstmt.executeUpdate();
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
   
   /*
   public int editFile(File file, int fidx) {   //파일글 수정 수연
       PreparedStatement pstmt =null;
       Connection conn = null;
       String sql = "update fileupload set oriname=?, savename=?, fsize=?, cocode=?  where fidx=?";  
       int resultrow = 0;
       
       try {
          conn = ds.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, file.getOriname());
          pstmt.setString(2, file.getSavename());
          pstmt.setInt(3, file.getFsize());
          pstmt.setInt(4, file.getCocode());
          pstmt.setInt(5, fidx);
          System.out.println("여보세요?" +file.getOriname() +"/"+ file.getSavename() +"/"+  file.getFsize() +"/"+  file.getCocode() +"/"+ fidx);
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
       System.out.println("editFile야 됐니? " + resultrow);

       return resultrow;
    }
   */
   
   
   
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
         System.out.println("게시판 삭제되니?" + resultrow);
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
      String sql = "select idx, id, bcode, tcode, title, readnum, writedate from board where bcode=? and cocode=0 and title like '%?%'";    //DB에서는 영어 대소문자 구분한다.   
   
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
	   System.out.println("reply dao 오니?" + reply);
      PreparedStatement pstmt =null;
      Connection conn = null;
      String sql = "insert into reply(replyidx, idx, replycontent, replyid, replydate, cocode) values(replyseq.nextval,?,?,?,sysdate,0)";   //날짜 제외(DB에서 Timestamp로)
      
      int resultrow = 0;      
      try {
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, reply.getIdx());
         pstmt.setString(2, reply.getReplycontent());
         pstmt.setString(3, reply.getReplyid());
         
         resultrow = pstmt.executeUpdate();
         System.out.println("결과 row는?" +resultrow);
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
      String sql = "select replyidx, replycontent, replyid, replydate from reply where idx=? and cocode=0 order by replyidx desc";   
   
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
            boarddto.setReplyidx(rs.getInt("replyidx"));

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
		String sql_insert = "insert into board(idx, id, bcode, tcode, title, content, readnum, writedate, ref, dept, step, cocode) values(test1.nextval,?,?,?,?,?,0,sysdate,?,?,?,0)";
		
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
   

   
   public int deleteFile(int fidx) {   //파일 삭제(=cocode 수정)
      PreparedStatement pstmt =null;
      Connection conn = null;
      String sql = "update fileupload set cocode=1 where fidx=?";   
      int resultrow = 0;
      
      try {
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, fidx);
         resultrow = pstmt.executeUpdate();
         System.out.println("삭제되니?" + resultrow);
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
   
   
   
   
   public ArrayList<File> showBoardFileno(int bcode) {   //파일게시판 목록 보기 (안씀)
	   System.out.println("비코드야?" + bcode);
	      PreparedStatement pstmt =null;
	      Connection conn = null;
	      ResultSet rs = null;
	      
	      ArrayList<File> boardfilelist =new ArrayList<>();
	      String sql = "select e.idx, e.id, e.bcode, e.tcode, e.title, e.content, e.readnum, e.writedate, f.fidx, f.idx, f.oriname, f.savename, f.fsize, f.cocode from fileupload f join board e on f.idx = e.idx where e.bcode=? and f.cocode=0 order by e.ref desc";   
	   
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, bcode);
	         rs = pstmt.executeQuery();
	         System.out.println("dao오니?");
	         System.out.println("rs?" + rs);
	         while(rs.next()) {

	            File file = new File();
	            file.setIdx(rs.getInt("idx"));
	            file.setId(rs.getString("id"));
	            file.setBcode(rs.getInt("bcode"));
	            file.setTcode(rs.getInt("tcode"));
	            file.setTitle(rs.getString("title"));
	            file.setContent(rs.getString("content"));
	            file.setReadnum(rs.getInt("readnum"));
	            file.setWritedate(rs.getString("writedate"));
	            file.setFidx(rs.getInt("fidx"));
	            file.setOriname(rs.getString("oriname"));
	            file.setSavename(rs.getString("savename"));
	            file.setFsize(rs.getInt("fsize"));
	            file.setCocode(rs.getInt("cocode"));

	            
	            boardfilelist.add(file);
	            
	         }
	            System.out.println(boardfilelist);

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
	      return boardfilelist;
	   }
   

   
   public File detailFileBoard(int idx) {   //파일게시판 글 상세 보기  
	      getReadNum(idx);   //조회수 증가 함수
	      PreparedStatement pstmt =null;
	      Connection conn = null;
	      ResultSet rs = null;
	      File file = null;
	      String sql = "select e.idx, e.id, e.bcode, e.tcode, e.title, e.content, e.readnum, e.writedate, f.fidx, f.savename, f.cocode from board e join fileupload f on e.idx = f.idx where e.idx=?";   
	  
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	        	file = new File();
	        	
	            file.setIdx(rs.getInt("idx"));
	            file.setId(rs.getString("id"));
	            file.setBcode(rs.getInt("bcode"));
	            file.setTcode(rs.getInt("tcode"));
	            file.setTitle(rs.getString("title"));
	            file.setContent(rs.getString("content"));
	            file.setReadnum(rs.getInt("readnum"));
	            file.setWritedate(rs.getString("writedate"));	            
	            file.setFidx(rs.getInt("fidx"));	            
	            file.setSavename(rs.getString("savename"));
	            file.setCocode(rs.getInt("cocode"));
	            
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
	      //System.out.println("디티오 오니?" + file);

	      return file;
	   }
   
   public int totalBoardCount(int bcode) { //토탈 카운트 얻기 
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int totalcount = 0;
	      try {
	         conn = ds.getConnection(); //dbcp 연결객체 얻기
	         String sql="select count(*) cnt from board where bcode=? and cocode=0";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, bcode);
	         
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            totalcount = rs.getInt("cnt");
	         }
	      }catch (Exception e) {
	         
	      }finally {
	         try {
	            pstmt.close();
	            rs.close();
	            conn.close();//반환  connection pool 에 반환하기
	         }catch (Exception e) {
	            
	         }
	      }
	      return totalcount;
	   }
   
   public int totalBoardCount(int bcode, String sw) { //토탈 카운트 얻기 
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int totalcount = 0;
	      try {
	         conn = ds.getConnection(); //dbcp 연결객체 얻기
	         String sql="select count(*) cnt from board where bcode=? and cocode=0 and (title like '%"+sw+"%' or content like '%"+sw+"%')";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, bcode);
	         
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            totalcount = rs.getInt("cnt");
	         }
	      }catch (Exception e) {
	         
	      }finally {
	         try {
	            pstmt.close();
	            rs.close();
	            conn.close();//반환  connection pool 에 반환하기
	         }catch (Exception e) {
	            
	         }
	      }
	      return totalcount;
	   }
   
   
   public ArrayList<Board> list(int cpage , int pagesize, int bcode){   //페이징처리 함수   (진성오빠)

	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      ArrayList<Board> list = null;
	      try {
	         conn = ds.getConnection();
	         String sql = "select * from " +
	                                    "(select rownum rn,idx,id,bcode,tcode, title, content, writedate, readnum" +
	                                   ",ref, dept, step, cocode" +
	                                    " from ( SELECT * FROM board where bcode=? and cocode=0 ORDER BY ref DESC , step ASC ) "+
	                                   " where rownum <= ?" +  //endrow
	                     ") where rn >= ?"; //startrow
	         pstmt = conn.prepareStatement(sql);
	         //공식같은 로직
	         int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
	         int end = cpage * pagesize; // 1 * 5 >> 5
	         //
	         pstmt.setInt(1, bcode);
	         pstmt.setInt(2, end);
	         pstmt.setInt(3, start);
	         
	         rs = pstmt.executeQuery();
	         list = new ArrayList<Board>();
	         while(rs.next()) {
	            Board board = new Board();
	            board.setIdx(rs.getInt("idx"));
	            board.setTitle(rs.getString("title"));
	            board.setId(rs.getString("id"));
	            board.setWritedate(rs.getString("writedate"));
	            board.setReadnum(rs.getInt("readnum"));
	            
	            //계층형
	            board.setRef(rs.getInt("ref"));
	            board.setStep(rs.getInt("step"));
	            board.setDept(rs.getInt("dept"));
	            
	            list.add(board);
	         }
	      }catch (Exception e) {
	         System.out.println("오류 :" + e.getMessage());
	      }finally {
	         try {
	            pstmt.close();
	            rs.close();
	            conn.close();//반환
	         } catch (Exception e2) {
	         }
	      }
	      return list;
	   }
   
   
   
   
   public List<File> ReivewFilelist(int cpage , int pagesize, int bcode){   //페이징처리 함수   (인영)
	      System.out.println("현재페이지" + cpage + "페이지사이즈" + pagesize + "현재 bcode"+bcode);
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      ArrayList<File> list = null;
	      try {
	         conn = ds.getConnection();
	         String sql = "select * from (select rownum rn, a.idx, a.id, a.bcode, a.tcode, a.title, a.content, a.writedate, a.readnum, a.fidx, a.savename, a.cocode" +
	        		      " from (select e.idx as idx, e.id as id, e.bcode as bcode, e.tcode as tcode, e.title as title, e.content as content, e.readnum as readnum, e.writedate as writedate, f.fidx as fidx, f.oriname as oriname, f.savename as savename, f.fsize as fsize, f.cocode as cocode from fileupload f join board e on f.idx = e.idx where e.bcode=? and f.cocode=0 order by e.ref desc) a" + 
	        		      " where rownum <= ?)" + 
	        		      " where rn >= ?";
	         System.out.println("나와라 ^^"+sql);
	         pstmt = conn.prepareStatement(sql);
	         //공식같은 로직
	         int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
	         int end = cpage * pagesize; // 1 * 5 >> 5
	         System.out.println(start);
	         System.out.println(end);
	         pstmt.setInt(1, bcode);
	         pstmt.setInt(2, end);
	         pstmt.setInt(3, start);
	         
	         rs = pstmt.executeQuery();
	         list = new ArrayList<File>();
	         while(rs.next()) {
	        	File file = new File();
		            file.setIdx(rs.getInt("idx"));
		            file.setId(rs.getString("id"));
		            file.setTitle(rs.getString("title"));
		            file.setContent(rs.getString("content"));
		            file.setReadnum(rs.getInt("readnum"));
		            file.setWritedate(rs.getString("writedate"));	            
		            file.setFidx(rs.getInt("fidx"));	            
		            file.setSavename(rs.getString("savename"));
		            file.setCocode(rs.getInt("cocode"));
		            file.setTcode(rs.getInt("tcode"));
	            
	            list.add(file);
	            System.out.println("list 나오니?" + list);
	         }
	      }catch (Exception e) {
	         System.out.println("오류 :" + e.getMessage());
	      }finally {
	         try {
	            pstmt.close();
	            rs.close();
	            conn.close();//반환
	         } catch (Exception e2) {
	         }
	      }
	      return list;
	   }

   



   
   public ArrayList<File> showcurrentreview(int bcode) {   // 최근 후기 5개 메인에 보여줄 것. (인영)
       PreparedStatement pstmt =null;
       Connection conn = null;
       ResultSet rs = null;
       
       ArrayList<File> boardlist =new ArrayList<>();
       String sql = "select  b.idx,b.id, b.writedate, b.title, b.readnum, f.savename from board b join fileupload f on b.idx = f.idx where b.cocode=0 and bcode=? and rownum <=5 ORDER BY writedate desc";
                
    
       try {
          conn = ds.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, bcode);
          rs = pstmt.executeQuery();
          
          while(rs.next()) {
             
             File file = new File();
             file.setIdx(rs.getInt("idx"));
             file.setId(rs.getString("id"));
             file.setWritedate(rs.getString("writedate"));
             file.setTitle(rs.getString("title"));
             file.setReadnum(rs.getInt("readnum"));
             file.setSavename(rs.getString("savename"));
             boardlist.add(file);
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
       System.out.println("여기는?"+boardlist);
       return boardlist;
    }
   
   
   
   public ArrayList<File> showMyReview(int bcode, String id) {   // Mypage에 자기 후기 보여줄것. (인영)
	      PreparedStatement pstmt =null;
	      Connection conn = null;
	      ResultSet rs = null;
	      
	      ArrayList<File> boardlist =new ArrayList<>();
	      String sql = "select b.id, b.idx, b.writedate, b.title, b.readnum, f.savename from board b join fileupload f on b.idx = f.idx where b.bcode=? and b.id=? and b.cocode=0 ORDER BY b.writedate desc";
	      		   
	   
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, bcode);
	         pstmt.setString(2, id);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	 
	        	 File file = new File();
	        	 file.setIdx(rs.getInt("idx"));
	        	 file.setId(rs.getString("id"));
	        	 file.setWritedate(rs.getString("writedate"));
	        	 file.setTitle(rs.getString("title"));
	        	 file.setReadnum(rs.getInt("readnum"));
	        	 file.setSavename(rs.getString("savename"));
	            boardlist.add(file);
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
	      System.out.println("여기는?"+boardlist);
	      return boardlist;
	   }
   
   public List<File> ReivewFilelist(int cpage , int pagesize, int bcode, String searchword){   //페이징처리 함수   (인영)
       System.out.println("현재페이지" + cpage + "페이지사이즈" + pagesize);
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       ArrayList<File> list = null;
       
       System.out.println("단어" +searchword);
       try {
          conn = ds.getConnection();
          String sql = "select * from (select rownum rn, a.idx, a.id, a.bcode, a.tcode, a.title, a.content, a.writedate, a.readnum, a.fidx, a.savename, a.cocode from (select e.idx as idx, e.id as id, e.bcode as bcode, e.tcode as tcode, e.title as title, e.content as content, e.readnum as readnum, e.writedate as writedate, f.fidx as fidx, f.oriname as oriname, f.savename as savename, f.fsize as fsize, f.cocode as cocode from fileupload f join board e on f.idx = e.idx where e.bcode=? and f.cocode=0 and (e.title like '%"+searchword+"%') order by e.ref desc) a where rownum <= ?) where rn >= ?";
          pstmt = conn.prepareStatement(sql);
          
          //공식같은 로직
          int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
          int end = cpage * pagesize; // 1 * 5 >> 5
          //
          pstmt.setInt(1, bcode);
          pstmt.setInt(2, end);
          pstmt.setInt(3, start);
          
          rs = pstmt.executeQuery();
          list = new ArrayList<File>();
          while(rs.next()) {
            File file = new File();
                file.setIdx(rs.getInt("idx"));
                file.setId(rs.getString("id"));
                file.setTitle(rs.getString("title"));
                file.setContent(rs.getString("content"));
                file.setReadnum(rs.getInt("readnum"));
                file.setWritedate(rs.getString("writedate"));               
                file.setFidx(rs.getInt("fidx"));               
                file.setSavename(rs.getString("savename"));
                file.setCocode(rs.getInt("cocode"));
                file.setTcode(rs.getInt("tcode"));
                file.setBcode(rs.getInt("bcode"));
             
             list.add(file);
             System.out.println("여기는 리뷰리스트 list 나오니?" + list);
          }
       }catch (Exception e) {
          System.out.println("오류 :" + e.getMessage());
       }finally {
          try {
             pstmt.close();
             rs.close();
             conn.close();//반환
          } catch (Exception e2) {
          }
       }
       return list;
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
   
   
	//서치기능을 위한 리스트 함수
	public ArrayList<Board> list(int cpage , int pagesize, int bcode, String searchword){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from " +
			                           "(select rownum rn,idx,id,bcode,tcode, title, content, writedate, readnum" +
				                       ",ref, dept, step, cocode" +
			                           " from ( SELECT * FROM board where bcode=? and cocode=0 and (title like '%"+ searchword + "%' or content like '%"+searchword+"%') ORDER BY ref DESC , step ASC ) "+
				                       " where rownum <= ?" +  //endrow
				         ") where rn >= ?"; //startrow
			pstmt = conn.prepareStatement(sql);
			//공식같은 로직
			int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
			int end = cpage * pagesize; // 1 * 5 >> 5
			//
			pstmt.setInt(1, bcode);			
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while(rs.next()) {
				Board board = new Board();
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setWritedate(rs.getString("writedate"));
				board.setReadnum(rs.getInt("readnum"));
				board.setCocode(rs.getInt("cocode"));
				board.setBcode(rs.getInt("bcode"));
				
				//계층형
				board.setRef(rs.getInt("ref"));
				board.setStep(rs.getInt("step"));
				board.setDept(rs.getInt("dept"));				
				board.setCp(cpage);
				board.setPs(pagesize);
				
				list.add(board);
			}
			
		}catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			} catch (Exception e2) {
				
			}
		}
			
		return list;
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
	public ArrayList<Board> list2(int cpage , int pagesize, int bcode){
		/*
		  [1][2][3][4][5][다음]
		  [이전][6][7][8][9][10][다음]
		  [이전][11][12]	
		  
		  [1] page 크기 > pagesize 정의
		  totaldata > 54건
		  pagesize = 5
		    규칙 > totalpagecount=11 (전체 페이지 개수)
		  
		  int cpage >> currentpage(현재 페이지 번호) >> 1page  ,2page
		  
		   현재 데이터 100건
		  cpage : 1 ,  pagesize : 5  > start(시작글번호) 1 ~ end(글번호) 5
		  cpage : 2 ,  pagesize : 5  > start(시작글번호) 6 ~ end(글번호) 10
		  cpage : 11 , pagesize : 5  > start(시작글번호) 51 ~ end(글번호) 55 
		  -5개씩 묶어서 11번째 묶음을 보여주세요 
		  
		    * 아래 2개의 계층형 페이징처리 쿼리 테스트 하기 
		    * SELECT * FROM ( SELECT ROWNUM rn , idx ,
		    * writer , email, homepage, pwd , subject , content, writedate, readnum
		    * , filename, filesize , refer , depth , step FROM ( SELECT * FROM
		    * jspboard ORDER BY refer DESC , step ASC ) ) WHERE rn BETWEEN ? AND ?;
		    * 
		    * --------------------------------------------------------------------
		    *  select * from ( select rownum rn , idx ,
		    *  writer , email, homepage, pwd , subject , content, writedate, readnum
		    * , filename, filesize , refer , depth , step from ( SELECT * FROM
		    * jspboard ORDER BY refer DESC , step ASC ) where rownum <= 6 --endrow
		    * ) where rn >= 4; --firstrow
		  
		   SELECT * 
		   FROM 
             ( SELECT ROWNUM rn , idx ,  writer , email, homepage, pwd , subject , content, writedate, readnum
		                    , filename, filesize , refer , depth , step 
               FROM 
                      ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC )
              )
		   WHERE rn BETWEEN 1 AND 5;
		   
		   
		    select * 
 			from
            ( select rownum rn , idx , writer , email, homepage, pwd , subject , content, writedate, readnum
		             ,filename, filesize , refer , depth , step 
              from 
                   ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) 
              where rownum <= 10 --endrow
		    ) 
 			where rn >= 6; --firstrow
		*/
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from " +
			                           "(select rownum rn,idx,id,bcode,tcode, title, content, writedate, readnum" +
				                       ",ref, dept, step, cocode" +
			                           " from ( SELECT * FROM board where bcode=? ORDER BY ref DESC , step ASC ) "+
				                       " where rownum <= ?" +  //endrow
				         ") where rn >= ?"; //startrow
			pstmt = conn.prepareStatement(sql);
			//공식같은 로직
			int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
			int end = cpage * pagesize; // 1 * 5 >> 5
			//
			pstmt.setInt(1, bcode);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while(rs.next()) {
				Board board = new Board();
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setWritedate(rs.getString("writedate"));
				board.setReadnum(rs.getInt("readnum"));
				board.setCocode(rs.getInt("cocode"));
				board.setBcode(rs.getInt("bcode"));
				
				//계층형
				board.setRef(rs.getInt("ref"));
				board.setStep(rs.getInt("step"));
				board.setDept(rs.getInt("dept"));				
				board.setCp(cpage);
				board.setPs(pagesize);
				
				list.add(board);
			}
			
		}catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			} catch (Exception e2) {
				
			}
		}
			
		return list;
	}

}

