package kr.co.sist.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class MemberDAO {
	private static MemberDAO mDAO;
	
	//Singleton
	private MemberDAO() {
		
	}
	
	public static MemberDAO getInstance() {
		if(mDAO == null) {
			mDAO = new MemberDAO();
		}// end if
		
		return mDAO;
	}//getInstance
	
	/**
	 * 아이디를 입력받아서 DB에서 검색하여 아이디가 존재하면 true, 그렇지 않으면 false 반환
	 * @param id
	 * @return 사용중-true, 미사용-false
	 * @throws SQLException
	 */
	public boolean selectId(String id) throws SQLException{
		boolean resultFlag = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//1. JNDI 사용객체 생성
		//2. DBCP에서 DataSource 얻기
		DbConnection dbCon = DbConnection.getInstance();
		//3. Connection 얻기
		try {
			conn = dbCon.getConn();
			//4. 쿼리문 생성객체 얻기
			String selectId = "select id from web_member where id=?";
			pstmt = conn.prepareStatement(selectId);
			
			//5. 바인드 변수에 값을 설정
			pstmt.setString(1, id);
			//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			/*
			 * if(rs.next()) { id=rs.getString("id"); // id가 존재하면 값, 그렇지 않으면 null }// end if
			 */
			resultFlag = rs.next(); // 다음이 있는가 없는가만 판단하는 경우에는 boolean으로 사용 가능 // 아이디가 존재하면 true, 그렇지 않으면 false
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return resultFlag;
	}//selectId
	
	public void insertWebMember(WebMemberVO wmVO) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//1. JNDI 사용객체 생성
		//2. DBCP에서 DataSource 얻기
		DbConnection dbCon = DbConnection.getInstance();
		try {
		//3. Connection 얻기
			conn = dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder insertWebMember = new StringBuilder();
			insertWebMember.append("insert into web_member")
			.append("(ID,PASS,NAME,BIRTH,TEL,TEL_FLAG,EMAIL,GENDER,LOCATION,ZIPCODE,ADDR,ADDR2,ip)")
			.append("values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt = conn.prepareStatement(insertWebMember.toString());
		//5. 바인드 변수에 값을 설정
			pstmt.setString(1, wmVO.getId());
			pstmt.setString(2, wmVO.getPass());
			pstmt.setString(3, wmVO.getName());
			pstmt.setString(4, wmVO.getBirth());
			pstmt.setString(5, wmVO.getCellphone());
			pstmt.setString(6, wmVO.getSave());
			pstmt.setString(7, wmVO.getEmail());
			pstmt.setString(8, wmVO.getGender());
			pstmt.setString(9, wmVO.getLocation());
			pstmt.setString(10, wmVO.getZipcode());
			pstmt.setString(11, wmVO.getAddr1());
			pstmt.setString(12, wmVO.getAddr2());
			pstmt.setString(13, wmVO.getIp());
		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
			if(wmVO.getLang() != null) {
				insertLang(wmVO);//관심언어를 DB에 추가				
			}
		} finally {
			//7. 연결 끊기			
			dbCon.dbClose(null, pstmt, conn);
		}// end finally
		
	}// insertWebMember
	
	public int insertLang(WebMemberVO wmVO) throws SQLException {
		int cntLang = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		//1. JNDI 사용객체 생성
		//2. DBCP에서 DataSource 얻기
		DbConnection dbCon = DbConnection.getInstance();
		try {
		//3. Connection 얻기
			conn = dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			String insertLang="insert into web_member_lang(id, lang)values(?,?)";
			pstmt = conn.prepareStatement(insertLang);

			for(String lang:wmVO.getLang()) {
		//5. 바인드 변수에 값을 설정
				pstmt.setString(1, wmVO.getId());
				pstmt.setString(2, lang);
		//6. 쿼리문 수행 후 결과 얻기
				cntLang += pstmt.executeUpdate();
			}
		} finally {
			//7. 연결 끊기			
			dbCon.dbClose(null, pstmt, conn);
		}// end finally
		
		
		return cntLang;
	}// insertLang

}//class
