package project.manager.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;
import project.manager.menu.DrinkDAO;

public class OrderDAO {
	private static OrderDAO oDAO;
	
	//singleton
	private OrderDAO(){
		
	}
	
	public static OrderDAO getInstance() {
		if(oDAO == null) {
			oDAO = new OrderDAO();
		}
		
		return oDAO;
	}
	
	/**
	 * 미수령된 주문의 수를 조회하는 일을 하는 메소드
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCountNotReceived(SearchVO sVO) throws SQLException{
		int totalCount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		try {
			conn = dbCon.getConn();
			
			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append("")
			.append("")
			.append("")
			;
			pstmt = conn.prepareStatement(selectCount.toString());
			//바인드 변수 값 설정
			//쿼리문 수행 후 결과 얻기
		}
		
		return totalCount;
	}
}
