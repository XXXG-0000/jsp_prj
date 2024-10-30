package project.manager.manager;

import  kr.co.sist.dao.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author : user
 * @fileName : ManagerDAO
 * @since : 24. 10. 22.
 */
//싱글톤 패턴
public class ManagerDAO {

    private static ManagerDAO mDAO;

    private ManagerDAO() {
    }
    // 싱글톤 패턴
    public static ManagerDAO getInstance() {
        if (mDAO == null) {
            mDAO = new ManagerDAO();

        }
        return mDAO;
    }

    /*
    * myJstar
    * selectManager
    * managerVO를 전달받아 조희
    *
    */
    public String selectManager(ManagerVO managerVO) throws SQLException {
        String SelectResult = "";
        DbConnection dbConnection = DbConnection.getInstance();
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        ResultSet resultSet = null;

        try {
            connection = dbConnection.getConn();
            String sql = "SELECT manager_id FROM MANAGER WHERE manager_id=? and manager_pass=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, managerVO.getManagerId()); // 폼에서 전달된 매니저 ID 사용
            preparedStatement.setString(2, managerVO.getManagerPass());

            // 아이디로 조회된 결과가 있으면
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                SelectResult = resultSet.getString("manager_id");
            }
        } finally {
            dbConnection.dbClose(null, preparedStatement, connection);
        }
        return SelectResult;
    }



} // ManagerDAO 끝 
