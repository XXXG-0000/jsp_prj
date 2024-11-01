package kr.co.sist.user.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.util.BoardUtil;

public class ReplyDAO {
	private static ReplyDAO rDAO;
	
	private ReplyDAO() { }//ReplyDAO
	
	public static ReplyDAO getInstance() {
		if(rDAO == null) {
			rDAO = new ReplyDAO();
		}//end if
		
		return rDAO;
	}//getInstance
	
	public int countReply(ReplyVO rVO) throws SQLException {
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder insertReply = new StringBuilder();
			insertReply
			.append("	select count(num) cnt from reply	")
			;
			
			pstmt = conn.prepareStatement(insertReply.toString());
			//바인드 변수에 값 설정
			// 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}//end finally
		
		return cnt;
	}
	
	public void insertReply(ReplyVO rVO)throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder insertReply = new StringBuilder();
			insertReply
			.append("	insert into reply(num,content,writer,ip,ref_num)	")
			.append("	values( seq_reply.nextval,?,?,?,?)	")
			;
			
			pstmt = conn.prepareStatement(insertReply.toString());
			//바인드 변수에 값 설정
			pstmt.setString(1, rVO.getContent());
			pstmt.setString(2, rVO.getWriter());
			pstmt.setString(3, rVO.getIp());
			pstmt.setInt(4, rVO.getRef_num());
			
			// 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}//end finally
		
	}//insertReply
	
	public List<ReplyVO> selectReply(int ref_num)throws SQLException{
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder selectReply = new StringBuilder();
			selectReply
			.append("	select NUM, CONTENT, IP, WRITER, INPUT_DATE		")
			.append("	from reply	")
			.append("	where ref_num=?	")
			.append("	order by input_date desc	");
			
			
			//System.out.println(selectBoard);
			
			pstmt = conn.prepareStatement(selectReply.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, ref_num);
			
			// 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			ReplyVO rVO = null;
			while(rs.next()) {
				rVO = new ReplyVO();
				rVO.setNum(rs.getInt("num"));
				rVO.setContent(rs.getString("content"));
				rVO.setIp(rs.getString("ip"));
				rVO.setWriter(rs.getString("writer"));
				rVO.setInput_date(rs.getDate("input_date"));
				
				list.add(rVO);
			}
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}//end finally
		
		return list;
	}//selectReply
	
	public int selectReplyCnt(int ref_num)throws SQLException{
		int rowCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder selectReply = new StringBuilder();
			selectReply
			.append("	select count(*) cnt		")
			.append("	from reply	")
			.append("	where ref_num=?	");
			
			//System.out.println(selectBoard);
			
			pstmt = conn.prepareStatement(selectReply.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, ref_num);
			
			// 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rowCnt = rs.getInt("cnt");
			}
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}//end finally
		
		return rowCnt;
	}//selectReply
	
	public int deleteReply(ReplyVO rVO)throws SQLException{
		int rowCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder deleteReply = new StringBuilder();
			deleteReply
			.append("	delete from reply where num=? and writer=?	")
			;
			
			pstmt = conn.prepareStatement(deleteReply.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, rVO.getNum());
			pstmt.setString(2, rVO.getWriter());
			
			// 쿼리문 수행 후 결과 얻기
			rowCnt = pstmt.executeUpdate();
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}//end finally
		
		return rowCnt;
	}//deleteReply
	
}//class
