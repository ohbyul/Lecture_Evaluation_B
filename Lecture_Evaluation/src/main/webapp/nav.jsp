<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>



<% 

	String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID ==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

/*
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked ==false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'emailSendConfirm.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
*/	

// 이 nav는 인덱스랑... 이메일 모시깽이에 들어있음
//위에 불린 주석 처리 지우면 , 이메일 체크드 되서 false값임
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><h1>강의평가 웹 사이트</h1></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           	회원 관리
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          
<%
	if(userID == null){
%>       
            <li><a class="dropdown-item" href="./userLogin.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="./userJoin.jsp">회원가입</a></li>
<%
	}else{
%>
            <li><a class="dropdown-item" href="userLogout.jsp">로그아웃</a></li>
<%
	}
%>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">오별짱</a>
        </li>
      </ul>
      <!-- 검색창 -->
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>