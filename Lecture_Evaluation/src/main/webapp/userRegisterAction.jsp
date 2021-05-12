<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%

	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPW =null;
	String userEmail=null;
	
	if(request.getParameter("userID") != null){
		userID= request.getParameter("userID");
	}
	if(request.getParameter("userPW") != null){
		userPW= request.getParameter("userPW");
	}
	if(request.getParameter("userEmail") != null){
		userEmail= request.getParameter("userEmail");
	}
	
	if(userID == null || userPW ==null || userEmail == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID,userPW,userEmail,SHA256.getSHA256(userEmail),false));
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재한느 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailsendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	
%>