package util;

import java.security.MessageDigest;

public class SHA256 {

	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			//사용자가 입력한 값을 sha256으로 알고리즘 적용하게 만들어줌
			byte[] salt = "Hello this is salt".getBytes();
			//솔트 => 샤 256를 적용하면 해킹 당할수있음으로
			digest.reset();
			digest.update(salt);
			//솔트값 적용
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			//배열값 적용해서 해쉬값 적용한 값을 넣어줌
			for (int i = 0; i < chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if (hex.length() == 1) result.append("0");
				result.append(hex);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
		//이메일값에 해쉬를 적용한 값을 반환
	}
	
	
	//복호화 되지 않은 암호화 방법 PW 를 DB에 넣을 때 사용
	
}
