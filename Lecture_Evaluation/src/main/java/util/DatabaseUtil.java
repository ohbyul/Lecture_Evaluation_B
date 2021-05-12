package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3307/LectureEvaluation?serverTimezone=Asia/Seoul&useSSL=false";
			//SSL 관련 에러 servertime 추가 
			String dbID = "root";
			String dbPassword ="root";
			Class.forName("com.mysql.jdbc.Driver");
			//저 이름의 클래스를 찾아서 사용하겠다.
			return DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
