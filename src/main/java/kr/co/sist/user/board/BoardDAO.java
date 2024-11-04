package kr.co.sist.user.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.util.BoardUtil;

/**
 * 게시판의 리스트, 상세 조회, 추가, 삭제, 변경 업무
 */
public class BoardDAO {
	private static BoardDAO bDAO;
	
	//Singleton
	private BoardDAO() { }
	
	public static BoardDAO getInstance() {
		if(bDAO == null) {
			bDAO = new BoardDAO();
		}//end if
		return bDAO;
	}//getInstance
	
	/**
	 * 
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCount(SearchVO sVO)throws SQLException{
		int totalCount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//1. JNDI 사용 객체 생성
		//2. DBCP에서 DataSource 얻기
		DbConnection dbCon = DbConnection.getInstance();
		try {
			//3. Connection 얻기
			conn = dbCon.getConn();
		//4. 쿼리문 생성 객체 얻기
			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append("	select count(num) cnt from board	")
			;
			
			//dynamic query: 검색 키워드를 판단 기준으로 where절이 동적으로 생성
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				selectCount.append("	where instr(")
				.append(BoardUtil.numToField(sVO.getField()) )
				.append(",?) != 0");
			}// end if
			
			//System.out.println(selectCount);// 쿼리문 확인
			
			pstmt = conn.prepareStatement(selectCount.toString());
		//5. 바인드 변수에 값 설정
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				pstmt.setString(1, sVO.getKeyword());
			}// end if
			
		//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}//end if
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		return totalCount;
	}//selectTotalCount
	
	public List<BoardVO> selectBoard(SearchVO sVO)throws SQLException{
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder selectBoard = new StringBuilder();
			selectBoard
			.append("	select num, subject,writer, input_date, ip		")
			.append("	from (select num, subject, writer, input_date, ip,	")
			.append("	row_number() over(order by input_date desc) rnum	")
			.append("	from board	");
			
			//dynamic query: 검색 키워드를 판단 기준으로 where절이 동적으로 생성
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				selectBoard.append("	where instr(").append( BoardUtil.numToField(sVO.getField()))
				.append(",?) != 0");
			}// end if
			
			selectBoard.append("	)where rnum between ? and ?	")
			;
			
			//System.out.println(selectBoard);
			
			pstmt = conn.prepareStatement(selectBoard.toString());
			//바인드 변수에 값 설정
			//dynamic query: 검색 키워드를 판단 기준으로 where절이 동적으로 생성
			
			int bindInd = 1;
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				pstmt.setString(bindInd++, sVO.getKeyword());
				
			}// end if
			pstmt.setInt(bindInd++, sVO.getStartNum());
			pstmt.setInt(bindInd++, sVO.getEndNum());				

			// 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			BoardVO bVO = null;
			while(rs.next()) {
				bVO = new BoardVO();
				bVO.setNum(rs.getInt("num"));
				bVO.setSubject(rs.getString("subject"));
				bVO.setWriter(rs.getString("writer"));				
				bVO.setInput_date(rs.getDate("input_date"));
				bVO.setIp(rs.getString("ip"));
				
				list.add(bVO);
			}
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}//end finally
		
		return list;
	}// selectBoard
	
	/**
	 * 입력 값을 board 테이블에 추가하는 일
	 * @param bVO
	 * @throws SQLException
	 */
	public void insertBoard(BoardVO bVO) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder insertBoard = new StringBuilder();
			insertBoard
			.append("	insert into board(num,subject,content,writer,ip)	")
			.append("	values( seq_board.nextval,?,?,?,?)	")
			;
			
			pstmt = conn.prepareStatement(insertBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setString(1, bVO.getSubject());
			pstmt.setString(2, bVO.getContent());
			pstmt.setString(3, bVO.getWriter());
			pstmt.setString(4, bVO.getIp());
			
			// 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}//end finally
		
	}//insertBoard
	
	/**
	 * 입력된 글 번호에 해당하는 글 하나 조회
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public BoardVO selectDetailBoard(int num)throws SQLException{
		BoardVO bVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder selectOneBoard = new StringBuilder();
			selectOneBoard
			.append("	select 	num,subject,content,writer,input_date,ip		")
			.append("	from 	board	")
			.append("	where 	num=?	");
			;
			
			pstmt = conn.prepareStatement(selectOneBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, num);
			
			// 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 하나만 조회 => if
				bVO = new BoardVO();
				bVO.setNum(num);
				bVO.setSubject(rs.getString("subject"));
				bVO.setWriter(rs.getString("writer"));				
				bVO.setInput_date(rs.getDate("input_date"));
				bVO.setIp(rs.getString("ip"));

				//clob 받기
				//CLOB 데이터를 읽어들이기 위해 별도의 stream을 연결한다.
				BufferedReader br = new BufferedReader(rs.getClob("content").getCharacterStream());
				
				StringBuilder content = new StringBuilder();
				String temp; // 한 줄 읽어들인 데이터를 저장할 변수
				try {
					while((temp=br.readLine()) != null) {	// readLine은 엔터가 나오기 전까지만 읽어내린다.
						content.append(temp).append("\n");
					}//end while
					//모든 줄을 읽어들여 저장한 변수를 BoardVO 객체에 할당한다.
					bVO.setContent(content.toString());
					
				} catch(IOException ie) {
					ie.printStackTrace();
				}// end catch
				
			}// end if
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}//end finally
		
		return bVO;
	}// selectBoard
	
	/**
	 * 글번호와 ID에 해당하는 글의 내용을 변경
	 * @param bVO
	 * @return
	 * @throws SQLException
	 */
	public int updateBoard(BoardVO bVO)throws SQLException {
		int rowCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder upDateBoard = new StringBuilder();
			upDateBoard
			.append("	update	board		")
			.append("	set		content=?	")
			.append("	where	num=? and writer=?	")
			;
			
			pstmt = conn.prepareStatement(upDateBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setString(1, bVO.getContent());
			pstmt.setInt(2, bVO.getNum());
			pstmt.setString(3, bVO.getWriter());
			
			// 쿼리문 수행 후 결과 얻기
			rowCnt = pstmt.executeUpdate(); 
			// 0: 다른 사람이 글을 고치려고 시도, 1: 글 수정 
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}//end finally
		
		return rowCnt;
	}//updateBoard
	
	/**
	 * 글번호와 ID에 해당하는 글의 내용을 삭제
	 * @param bVO
	 * @return
	 * @throws SQLException
	 */
	public int deleteBoard(BoardVO bVO)throws SQLException {
		int rowCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder deleteBoard = new StringBuilder();
			/*
			 * 댓글이 존재하지 않으면 삭제
			 * 모든 댓글의 소유권이 작성자에게 있으면 테이블 생성시 on delete cascade 옵션 사용
			 * deleteBoard .append("	delete from	board			")
			 * .append("	where	num=? and writer=?	") ;ㄴ
			 */
			
			//댓글의 소유권이 원글 작성자에게 없을 때 update 수행
			deleteBoard
			.append("	update board	")
			.append("	set subject='삭제된 글입니다.', content='사용자에 의해 삭제된 글입니다.', writer='N/A'	")
			.append("	where	num=? and writer=?	")
			;
			
			pstmt = conn.prepareStatement(deleteBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, bVO.getNum());
			pstmt.setString(2, bVO.getWriter());
			
			// 쿼리문 수행 후 결과 얻기
			rowCnt = pstmt.executeUpdate(); 
			// 0: 삭제 실패, 1: 삭제 성공 
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}//end finally
		
		return rowCnt;
	}//updateBoard
	
	
	
}
