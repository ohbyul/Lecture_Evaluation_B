package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("quf8093@gmail.com", "비번");
	}
	
	//오버라이드 빼먹음.설마..;;
	
}
