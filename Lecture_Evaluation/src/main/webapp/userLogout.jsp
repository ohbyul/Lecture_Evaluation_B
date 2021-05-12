<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%
	System.out.println("로그아웃 프로세스  출력");
	session.invalidate();
%>

<script>
	location.href = 'userLogin.jsp';
</script>