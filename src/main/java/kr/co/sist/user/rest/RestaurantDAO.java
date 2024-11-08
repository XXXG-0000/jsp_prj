package kr.co.sist.user.rest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.board.BoardVO;

public class RestaurantDAO {
	
	private static RestaurantDAO rDAO;
	private RestaurantDAO() {
		
	}
	
	public static RestaurantDAO getInstance() {
		if(rDAO == null) {
			rDAO = new RestaurantDAO();
		}//end if
		
		return rDAO;
	}//getInstance
	
	public List<RestaurantVO> selectAllRest(String id)throws SQLException {
		List<RestaurantVO> list = new ArrayList<RestaurantVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			conn = dbCon.getConn();
			StringBuilder selectAllRest = new StringBuilder();
			selectAllRest
			.append("	select num,restaurant,menu,info,lng,lat,input_date	")
			.append("	from bookmark_rest	")
			.append("	where id=?	")
			.append("	order by input_date desc	")
			;
			
			pstmt = conn.prepareStatement(selectAllRest.toString());
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			RestaurantVO rVO = null;
			
			while(rs.next()) {
				rVO = new RestaurantVO();
				rVO.setNum(rs.getInt("num"));
				rVO.setRestaurant(rs.getString("restaurant"));
				rVO.setMenu(rs.getString("menu"));
				rVO.setInfo(rs.getString("info"));
				rVO.setLng(rs.getDouble("lng"));
				rVO.setLat(rs.getDouble("lat"));
				rVO.setInput_date(rs.getDate("input_date"));
				
				list.add(rVO);
			}//end while
			
			
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}//selectAllRest
	
	
	public void insertRest(RestaurantVO rVO) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder insertRest = new StringBuilder();
			insertRest
			.append("	insert into bookmark_rest(num, restaurant, menu, info, lng, lat, id)	")
			.append("	values(rest_seq.nextval, ?, ?, ?, ?, ?, ?)	")
			;
			
			pstmt = conn.prepareStatement(insertRest.toString());
			//바인드 변수에 값 설정
			pstmt.setString(1, rVO.getRestaurant());
			pstmt.setString(2, rVO.getMenu());
			pstmt.setString(3, rVO.getInfo());
			pstmt.setDouble(4, rVO.getLng());
			pstmt.setDouble(5, rVO.getLat());
			pstmt.setString(6, rVO.getId());
			
			// 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}//end finally
		
	}//insertBoard
}
