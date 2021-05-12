package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	//데이터 베이스 실제로 접근 하게 해주는
	
	public int Login(String userID,String userPW){
		
		String SQL = "SELECT userPW FROM user WHERE userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			//executeQuery 데이터 조회시, 사용
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1;
					//로그인 성공
				}else {
					return 0;
					//비밀번호 틀림
				}
			}
			return -1;
			//아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e){e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e){e.printStackTrace();}
			//데이타 베이스 접근한 다음 접근한 자원들을 해제해 줌으로써 서버에 무리가 가지 않게 해준다.
		}
		return -2;
		//데이터 베이스 오류
	}
	
	
	public int join(UserDTO user){
		
		String SQL = "INSERT INTO user VALUES(?,?,?,?,false)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e){e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e){e.printStackTrace();}
			//데이타 베이스 접근한 다음 접근한 자원들을 해제해 줌으로써 서버에 무리가 가지 않게 해준다.
		}
		return -1;
		//데이터 베이스 오류 회원가입 실패 
	}
	
	
	
	public boolean getUserEmailChecked(String userID){
		
		String SQL = "SELECT userEmailChecked FROM user WHERE userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getBoolean(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e){e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e){e.printStackTrace();}
			//데이타 베이스 접근한 다음 접근한 자원들을 해제해 줌으로써 서버에 무리가 가지 않게 해준다.
		}
		return false;
		//데이터 베이스 오류 회원가입 실패 
	}
	
	//특정 회원의 이메일 자체를 반환하는..
	public String getUserEmail(String userID){
		
		String SQL = "SELECT userEmail FROM user WHERE userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e){e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e){e.printStackTrace();}
			//데이타 베이스 접근한 다음 접근한 자원들을 해제해 줌으로써 서버에 무리가 가지 않게 해준다.
		}
		return null;
		//데이터 베이스 오류 회원가입 실패 
	}
	
	
	
	
	
	public boolean setUserEmailChecked(String userID){
		
		String SQL = "UPDATE user SET userEmailChecked = true WHERE userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e){e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e){e.printStackTrace();}
			//데이타 베이스 접근한 다음 접근한 자원들을 해제해 줌으로써 서버에 무리가 가지 않게 해준다.
		}
		return false;
		//데이터 베이스 오류 회원가입 실패 
	}
	
	
	
	
	
	
}
