package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("메일 주소 ", "비밀번호");
	}
	
}
