package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class UserDAO {
    private static UserDAO instance;

    private UserDAO() {
    }

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    public UserVO findUserByName(String name) throws SQLException {
        UserVO user = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn();
            StringBuilder query = new StringBuilder();
            query.append("SELECT email, password, zipcode, address, address2, phone FROM user_info WHERE name = ?");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, name);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new UserVO();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setZipcode(rs.getString("zipcode"));
                user.setAddress1(rs.getString("address"));
                user.setAddress2(rs.getString("address2"));
                user.setPhone(rs.getString("phone")); // 전화번호 추가
            }
        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }

        return user;
    }

    public int updateUser(UserVO user) throws SQLException {
        int rowCount = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn();
            StringBuilder query = new StringBuilder();
            query.append("UPDATE user_info SET password = ?, zipcode = ?, address = ?, address2 = ?, phone = ? WHERE email = ?");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, user.getPassword());
            pstmt.setString(2, user.getZipcode());
            pstmt.setString(3, user.getAddress1());
            pstmt.setString(4, user.getAddress2());
            pstmt.setString(5, user.getPhone()); // 전화번호 추가
            pstmt.setString(6, user.getEmail());

            rowCount = pstmt.executeUpdate();
        } finally {
            dbCon.dbClose(null, pstmt, con);
        }

        return rowCount;
    }

    // 비밀번호 존재 여부를 확인하는 메서드 추가
    public boolean checkPassword(String password) throws SQLException {
        String sql = "SELECT COUNT(*) FROM user_info WHERE password = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; // 비밀번호가 존재하면 true, 아니면 false
            }
        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }
        return false;
    }
}
