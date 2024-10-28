package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class customDAO {
	
	// 의존성 주입(객체 생성과 동시에 초기화)
	private Connection conn;

	public void setConn(Connection conn) {
		this.conn = conn;
	}	
	
	// num의 최대값 구하기
	
}
