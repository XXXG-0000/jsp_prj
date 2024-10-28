package project.manager.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			.append("	select count(cart_item_num)cnt from cart_item	")
			.append("	where	receipt_flag='N'	")
			;
			pstmt = conn.prepareStatement(selectCount.toString());
			//바인드 변수 값 설정
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}//end if
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// finally
		
		return totalCount;
	}//selectTotalCountNotReceived
	
	/**
	 * 수령한 주문의 수를 조회하는 일을 하는 메소드
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCountReceived(SearchVO sVO) throws SQLException{
		int totalCount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		try {
			conn = dbCon.getConn();
			
			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append("	select count(cart_item_num)cnt from cart_item	")
			.append("	where	receipt_flag='Y'	")
			;
			pstmt = conn.prepareStatement(selectCount.toString());
			//바인드 변수 값 설정
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}//end if
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// finally
		
		return totalCount;
	}//selectTotalCountReceived
	/**
	 * 미수령한 주문의 목록을 조회하는 일을 하는 메소드
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public List<OrderVO> selectNotReceivedList(SearchVO sVO)throws SQLException {
		List<OrderVO> list = new ArrayList<OrderVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 열기
			conn = dbCon.getConn();
			
			//쿼리문 생성 객체 얻기
			StringBuilder selectNotReceivedList = new StringBuilder();
			selectNotReceivedList
			.append("	select cart_item_num,i_name,name,input_date,quantity,receipt_flag	")
			.append("	from(select cart_item_num,(select i_name_k from item where item.item_num = cart_item.item_num)i_name,	")
			.append("	(select cus.name from	customer cus inner join	cart c on cus.cus_id = c.cus_id	")
			.append("	inner join cart_item ci on ci.cart_num = c.cart_num where c.cart_num = 0 and ci.cart_item_num = 0)name,	")
			.append("	input_date,quantity,receipt_flag,row_number() over(order by input_date asc) rnum	")
			.append("	from cart_item	")
			.append("	where receipt_flag = 'N')	")
			.append("	where rnum between ? and ?	")
			;
			
			pstmt = conn.prepareStatement(selectNotReceivedList.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, sVO.getStartNum());
			pstmt.setInt(2, sVO.getEndNum());
			
			rs = pstmt.executeQuery();
			
			OrderVO oVO = null;
			
			while(rs.next()) {
				oVO = new OrderVO();
				oVO.setCartItemNum(rs.getInt("cart_item_num"));
				oVO.setiNameK(rs.getString("i_name"));
				oVO.setName(rs.getString("name"));
				oVO.setInputDate(rs.getDate("input_date"));
				oVO.setQuantity(rs.getInt("quantity"));
				oVO.setReceiptFlag(rs.getString("receipt_flag"));
				
				list.add(oVO);
			}// end while
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return list;
	}//selectNotReceivedList
	
	/**
	* 수령한 주문의 목록을 조회하는 일을 하는 메소드
	* @param sVO
	* @return
	* @throws SQLException
	*/
	public List<OrderVO> selectReceivedList(SearchVO sVO)throws SQLException {
		List<OrderVO> list = new ArrayList<OrderVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 열기
			conn = dbCon.getConn();
			
			//쿼리문 생성 객체 얻기
			StringBuilder selectNotReceivedList = new StringBuilder();
			selectNotReceivedList
			.append("	select cart_item_num,i_name,name,input_date,quantity,receipt_flag	")
			.append("	from(select cart_item_num,(select i_name_k from item where item.item_num = cart_item.item_num)i_name,	")
			.append("	(select cus.name from	customer cus inner join	cart c on cus.cus_id = c.cus_id	")
			.append("	inner join cart_item ci on ci.cart_num = c.cart_num where c.cart_num = 0 and ci.cart_item_num = 0)name,	")
			.append("	input_date,quantity,receipt_flag,row_number() over(order by input_date asc) rnum	")
			.append("	from cart_item	")
			.append("	where receipt_flag = 'Y')	")
			.append("	where rnum between ? and ?	")
			;
			
			pstmt = conn.prepareStatement(selectNotReceivedList.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, sVO.getStartNum());
			pstmt.setInt(2, sVO.getEndNum());
			
			rs = pstmt.executeQuery();
			
			OrderVO oVO = null;
			
			while(rs.next()) {
				oVO = new OrderVO();
				oVO.setCartItemNum(rs.getInt("cart_item_num"));
				oVO.setiNameK(rs.getString("i_name"));
				oVO.setName(rs.getString("name"));
				oVO.setInputDate(rs.getDate("input_date"));
				oVO.setQuantity(rs.getInt("quantity"));
				oVO.setReceiptFlag(rs.getString("receipt_flag"));
				
				list.add(oVO);
			}// end while
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return list;
	}
	
}//OrderDAO
