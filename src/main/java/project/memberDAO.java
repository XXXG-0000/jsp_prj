package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class memberDAO {
	
	// 의존성 주입(객체 생성과 동시에 초기화)
	private Connection conn;

	public void setConn(Connection conn) {
		this.conn = conn;
	}	
	
	// num의 최대값 구하기
	public int getMaxNum() {
		// 최대값을 받을 변수
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			// nvl을 써서 null인 값을 0으로 바꿔 연산이 가능하게 한다.
			sql = "select nvl(max(num),0) from board";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1); // 컬럼명 또는 숫자 사용
			}// end if
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}// end catch
		
		return maxNum;
	}//getMaxNum

	// 입력 - 넘어오는 데이터는 memberDTO의 dto
	public int insertData(memberDTO dto) {
		/*private int num;		// n번째 회원
		private String id;		// 회원의 id
		private String name;	// 회원의 이름
		private String email;	// 회원의 이메일
		private String create;	// 회원의 가입일
		private String rank;	// 회원의 등급
		private String status;	// 회원의 상태
		private String tel;		// 회원의 전화번호
		*/
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			// member는 차후 작성되는 테이블 명으로 변경
			sql = "insert into member (num,id,name,email,";
			sql += "create,rank,status,tel) ";
			sql += "values (?,?,?,?,sysdate,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			// value 중 ?인 것만 작성
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getRank());
			pstmt.setBoolean(6, dto.getStatus());
			pstmt.setString(7, dto.getTel());
			
			result = pstmt.executeUpdate();
			
			// 닫기
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}// end catch
		
		return result;
	}// insertData
	
	// 전체 데이터 개수 구하기
	public int getDataCount(String searchKey, String searchValue) {
		int totalCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			searchValue = "%" + searchValue + "%";
			
			sql = "select nvl(count(*),0) from board ";
			sql += "where " + searchKey + " like ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 데이터가 더 있을 경우
				totalCount = rs.getInt(1); // totalCount 증가
			}// end if
			
			// 닫기
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}// end catch
		
		return totalCount;
	}// getDataCount
	
	// 전체 데이터 출력(페이지마다 개수 제한)
	public List<memberDTO> getLists(int start, int end, String searchKey, String searchValue) {
		// rownum을 매개변수로 할당해서 해당 범위만 list로 출력
		
		List<memberDTO> lists = new ArrayList<memberDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			searchValue = "%" + searchValue + "%";
			
			// id, 회원 등급, 회원 상태 출력
			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select id, rank, status created ";
			sql += "from board where " + searchKey + " like ? ";
			sql += "order by id desc) data) ";
			sql += "where rnum >=? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberDTO dto = new memberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setRank(rs.getString("rank"));
				dto.setStatus(rs.getBoolean("status"));
				
				lists.add(dto);
			}
			
		} catch (Exception e) {

		}// end catch
		
		return lists;
	}// getLists
	
	//num으로 조회한 한 개의 데이터
	public memberDTO getReadData(int num) {
		/*private int num;		// n번째 회원
		private String id;		// 회원의 id
		private String name;	// 회원의 이름
		private String email;	// 회원의 이메일
		private String create;	// 회원의 가입일
		private String rank;	// 회원의 등급
		private String status;	// 회원의 상태
		private String tel;		// 회원의 전화번호
		*/
		memberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			sql = "select num,id,name,email,create,rank,";
			sql += "status,tel ";
			sql += "from board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 데이터가 1개이므로 while X
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setCreate(rs.getString("create"));
				dto.setRank(rs.getString("rank"));
				dto.setStatus(rs.getBoolean("status"));
				dto.setTel(rs.getString("tel"));
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}// end catch
		
		return dto;
	}//getReadData
	
	// 수정
	public int updateData(memberDTO dto) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update board name=?,email=?,rank=?,status=?,tel=? where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getRank());
			pstmt.setBoolean(4, dto.getStatus());
			pstmt.setString(5, dto.getTel());
			pstmt.setInt(6, dto.getNum());
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}// updateData
	
	// 삭제
	public int deleteData(int num) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="delete board where num=?";	// ?번 보드 삭제
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}// deleteData
	
	
	
}//class
