package project.manager.menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class DessertIceDAO {
	private static DessertIceDAO dDAO;
	
	private DessertIceDAO() { }
	
	public static DessertIceDAO getInstance() {
		if(dDAO == null) {
			dDAO = new DessertIceDAO();
		}
		return dDAO;
	}
	
	//1. JNDI 사용 객체 생성
	//2. DBCP에서 DataSource 얻기
	//3. Connection 얻기
	//4. 쿼리문 생성 객체 얻기
	//5. 바인드 변수 값 설정
	//6. 쿼리문 수행 후 결과 얻기
	//7. 연결 끊기
	
	/**
	 * DB에 저장된 디저트의 총 메뉴 수를 구하는 일을 하는 메소드
	 * @param dsVO
	 * @return totalCount 디저트의 총 메뉴 수
	 * @throws SQLException
	 */
	public int selectTotalCountDessert(SearchVO sVO)throws SQLException{
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
			.append("	select 	count(categories_num) cnt	")
			.append("	from 	item						")
			.append("	where 	categories_num = 2 AND item_flag='N'		")
			;
			// (categories_num = 2) = 디저트
			pstmt = conn.prepareStatement(selectCount.toString());
		//5. 바인드 변수 값 설정
		//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}// end if
		} finally {
			//7. 연결 끊기
				dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return totalCount;
	}//selectTotalCount
	
	/**
	 * DB에 저장된 아이스크림의 총 메뉴 수를 구하는 일을 하는 메소드
	 * @param dsVO
	 * @return totalCount 아이스크림의 총 메뉴 수
	 * @throws SQLException
	 */
	public int selectTotalCountIcecream(SearchVO sVO)throws SQLException{
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
			.append("	select 	count(categories_num) cnt	")
			.append("	from 	item						")
			.append("	where 	categories_num = 3 AND item_flag='N'		")
			;
			// (categories_num = 2) = 디저트
			pstmt = conn.prepareStatement(selectCount.toString());
			//5. 바인드 변수 값 설정
			//6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}// end if
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return totalCount;
	}//selectTotalCount
	
	/**
	 * 디저트 메뉴 목록을 조회하는 일
	 * @param csVO
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectDessertBoard(SearchVO sVO) throws SQLException {
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 열기
			conn = dbCon.getConn();
			// 쿼리문 생성객체 얻기
			StringBuilder selectCoffeeBoard = new StringBuilder();
			selectCoffeeBoard
			.append("	select 	item_num,item_name,price,category_name	")
			.append("	from (select item_num,i_name_k item_name,price,(select categorie_name from categories	")
			.append("	where 	categories.categories_num = item.categories_num) category_name, item_flag,	")
			.append("	row_number() over(order by input_date desc) rnum	")
			.append("	from item	")
			.append("	where categories_num = 2)	")
			.append("	where rnum between ? and ? and item_flag='N'	")
			;
			
			pstmt = conn.prepareStatement(selectCoffeeBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, sVO.getStartNum());
			pstmt.setInt(2, sVO.getEndNum());
			
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			// while로 받아올 때는 query 테이블 컬럼명 기준으로!
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setItemNum(rs.getInt("item_num"));
				pVO.setiNameK(rs.getString("item_name"));
				pVO.setPrice(rs.getInt("price"));
				pVO.setCategorieName(rs.getString("category_name"));
				
				list.add(pVO);
			}// end while
		
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return list;
	}// selectCoffeeBoard
	
	/**
	 * 디저트 메뉴 목록을 조회하는 일
	 * @param csVO
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectIcecreamBoard(SearchVO sVO) throws SQLException {
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 열기
			conn = dbCon.getConn();
			// 쿼리문 생성객체 얻기
			StringBuilder selectCoffeeBoard = new StringBuilder();
			selectCoffeeBoard
			.append("	select 	item_num,item_name,price,category_name	")
			.append("	from (select item_num,i_name_k item_name,price,(select categorie_name from categories	")
			.append("	where 	categories.categories_num = item.categories_num) category_name, item_flag,	")
			.append("	row_number() over(order by input_date desc) rnum	")
			.append("	from item	")
			.append("	where categories_num = 3)	")
			.append("	where rnum between ? and ? and item_flag='N'	")
			;
			
			pstmt = conn.prepareStatement(selectCoffeeBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, sVO.getStartNum());
			pstmt.setInt(2, sVO.getEndNum());
			
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			// while로 받아올 때는 query 테이블 컬럼명 기준으로!
			while(rs.next()) {
				pVO = new ProductVO();
				pVO.setItemNum(rs.getInt("item_num"));
				pVO.setiNameK(rs.getString("item_name"));
				pVO.setPrice(rs.getInt("price"));
				pVO.setCategorieName(rs.getString("category_name"));
				
				list.add(pVO);
			}// end while
		
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return list;
	}// selectIcecreamBoard
	
	/**
	 * 입력 값을 item 테이블에 추가하는 일
	 * @param pVO
	 * @throws SQLException
	 */
	public void insertItem(ProductVO pVO) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			// 쿼리문 생성객체 얻기
			StringBuilder insertItem = new StringBuilder();
			//ITEM_NUM	CATEGORIES_NUM	I_NAME_K	I_NAME_E
			//DESCRIPTION	IMAGE	PRICE	INPUT_DATE	ITEM_FLAG	INGREDIENT_FLAG	
			insertItem
			.append("	insert into item(item_num,categories_num,i_name_k,i_name_e,	")//3
			.append("	description,image,price,input_date,item_flag,ingredient_flag)	")//4-6
			.append("	values(item_seq.nextval,?,?,?,?,?,?,sysdate,'N',?)	")
			;
			
			pstmt = conn.prepareStatement(insertItem.toString());
			//바인드 변수에 값 설정
			//String currentDate = new SimpleDateFormat("yyMMddhhmmss").format(new java.util.Date());
			
			pstmt.setInt(1, pVO.getCategoriesNum());
			pstmt.setString(2, pVO.getiNameK());
			pstmt.setString(3, pVO.getiNameE());
			pstmt.setString(4, pVO.getDescription());
			pstmt.setString(5, pVO.getImage());
			pstmt.setInt(6, pVO.getPrice());
			pstmt.setString(7, pVO.getIngredientFlag());
			
			//쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}// end finally
	}//insertItem
	
	/**
	 * 입력 값을 ingredient 테이블에 추가하는 일
	 * @param pVO
	 * @throws SQLException
	 */
	public void insertIngredient(IngredientVO iVO) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			// 쿼리문 생성객체 얻기
			StringBuilder insertItem = new StringBuilder();
			//ITEM_NUM	CAFFEINE	NATRIUM	FATTY_ACID	CALORIE	SUGAR	PROTEIN	

			insertItem
			.append("	insert into ingredient(item_num,caffeine,natrium,fatty_acid,	")
			.append("	calorie,sugar,protein)	")
			.append("	values(item_seq.currval,?,?,?,?,?,?)	")
			;
			
			pstmt = conn.prepareStatement(insertItem.toString());
			//바인드 변수에 값 설정
			pstmt.setDouble(1, iVO.getCaffeine());
			pstmt.setDouble(2, iVO.getNatrium());
			pstmt.setDouble(3, iVO.getFattyAcid());
			pstmt.setDouble(4, iVO.getCalorie());
			pstmt.setDouble(5, iVO.getSugar());
			pstmt.setDouble(6, iVO.getCaffeine());
			
			//쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}// end finally
	}//insertItem
	
	/**
	 * 입력 값을 drink_option 테이블에 추가하는 일
	 * @param pVO
	 * @throws SQLException
	 */
	public void insertIcecreamOption(IcecreamOptionVO ioVO) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			//connection 얻기
			conn = dbCon.getConn();
			// 쿼리문 생성객체 얻기
			StringBuilder insertItem = new StringBuilder();
			//ITEM_NUM	CAFFEINE	NATRIUM	FATTY_ACID	CALORIE	SUGAR	PROTEIN	

			insertItem
			.append("	insert into drink_option(icecream_option_num,item_num,add_chocolate,add_strawberry)	")
			.append("	values(ice_option_seq.nextval,item_seq.currval,?,?)	")
			;
			
			pstmt = conn.prepareStatement(insertItem.toString());
			//바인드 변수에 값 설정
			pstmt.setString(1, ioVO.getAddChocolate());
			pstmt.setString(2, ioVO.getAddStrawberry());
			
			//쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		} finally {
			dbCon.dbClose(null, pstmt, conn);
		}// end finally
	}//insertItem
	
	/**
	 * 특정 아이템 번호의 상품의 상세 정보를 조회하는 일
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public ProductVO selectDetailItemBoard(int itemNum) throws SQLException {
		ProductVO pVO = null;
		
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
			.append("	select	item_num,categories_num,i_name_k,i_name_e,description,image,price,input_date,ingredient_flag	")
			.append("	from	item	")
			.append("	where	item_num=?	")
			;
			
			pstmt = conn.prepareStatement(selectOneBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, itemNum);
			
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			//하나만 조회 => if
			if(rs.next()) {
				pVO = new ProductVO();
				pVO.setItemNum(itemNum);
				pVO.setCategoriesNum(rs.getInt("categories_num"));
				pVO.setiNameK(rs.getString("i_name_k"));
				pVO.setiNameE(rs.getString("i_name_e"));
				pVO.setDescription(rs.getString("description"));
				pVO.setImage(rs.getString("image"));
				pVO.setPrice(rs.getInt("price"));
				pVO.setInputDate(rs.getDate("input_date"));
				pVO.setIngredientFlag(rs.getString("ingredient_flag"));
			}//end if
			
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return pVO;
	}
	
	/**
	 * 특정 아이템 번호의 성분 정보를 조회하는 일
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public IngredientVO selectDetailIngredientBoard(int itemNum) throws SQLException {
		IngredientVO iVO = null;
		
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
			.append("	select	item_num,caffeine,natrium,fatty_acid,calorie,sugar,protein	")
			.append("	from	ingredient	")
			.append("	where	item_num=?	")
			;
			
			pstmt = conn.prepareStatement(selectOneBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, itemNum);
			
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			//하나만 조회 => if
			if(rs.next()) {
				iVO = new IngredientVO();
				iVO.setItemNum(itemNum);
				iVO.setCaffeine(rs.getInt("caffeine"));
				iVO.setNatrium(rs.getInt("natrium"));
				iVO.setFattyAcid(rs.getInt("fatty_acid"));
				iVO.setCalorie(rs.getInt("calorie"));
				iVO.setSugar(rs.getInt("sugar"));
				iVO.setProtein(rs.getInt("protein"));
			}//end if
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return iVO;
	}
	
	/**
	 * 특정 아이템 번호의 아이스크림 상품의 옵션 정보를 조회하는 일
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public IcecreamOptionVO selectDetailIcecreamOptionBoard(int itemNum) throws SQLException {
		IcecreamOptionVO ioVO = null;
		
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
			.append("	select	icecream_option_num,item_num,add_chocolate,add_strawberry	")
			.append("	from	icecream_option	")
			.append("	where	item_num=?	")
			;
			
			pstmt = conn.prepareStatement(selectOneBoard.toString());
			//바인드 변수에 값 설정
			pstmt.setInt(1, itemNum);
			
			//쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			//하나만 조회 => if
			if(rs.next()) {
				ioVO = new IcecreamOptionVO();
				ioVO.setIcecreamOptionNum(rs.getInt("icecream_option_num"));
				ioVO.setItemNum(itemNum);
				ioVO.setAddChocolate(rs.getString("add_chocolate"));
				ioVO.setAddStrawberry(rs.getString("add_strawberry"));
			}//end if

		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}// end finally
		
		return ioVO;
	}
	
}// class
