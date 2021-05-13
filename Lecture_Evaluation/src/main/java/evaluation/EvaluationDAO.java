package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class EvaluationDAO {
	
	public int write(EvaluationDTO evaluationDTO){
		
		String SQL = "INSERT INTO Evaluation VALUES(null,?,?,?,?,?,?,?,?,?,?,?,?,0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, evaluationDTO.getUserID());
			pstmt.setString(2, evaluationDTO.getLectureName());
			pstmt.setString(3, evaluationDTO.getProfessorName());
			pstmt.setInt(4, evaluationDTO.getLectureYear());
			pstmt.setString(5, evaluationDTO.getSemesterDivide());
			pstmt.setString(6, evaluationDTO.getLectureDivide());
			pstmt.setString(7, evaluationDTO.getEvaluationContent());
			pstmt.setString(8, evaluationDTO.getEvaluationContent());
			pstmt.setString(9, evaluationDTO.getTotalScore());
			pstmt.setString(10, evaluationDTO.getCraditScore());
			pstmt.setString(11, evaluationDTO.getLectureDivide());
			pstmt.setString(12, evaluationDTO.getComfortableScore());
			return pstmt.executeUpdate();
			//executeQuery 데이터 조회시, 사용
			//executeUpdate 인서트 시 사용
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e){e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e){e.printStackTrace();}
			//데이타 베이스 접근한 다음 접근한 자원들을 해제해 줌으로써 서버에 무리가 가지 않게 해준다.
		}
		return -1;
		//데이터 베이스 오류
	}
}
