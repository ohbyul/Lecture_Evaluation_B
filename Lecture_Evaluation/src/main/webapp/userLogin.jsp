<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>강의평가 웹 사이트</title>
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">

<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>

<% 

	String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID !=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
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



	<!-- 본문 -->
	<section class="container mt-3" style="max-width: 560px;">

	<% System.out.println("로그인 페이지 출력"); %>


		<form action="./userLoginAction.jsp" method="post">
			<div class="row mt-3">
				<label>아이디</label> <input type="text" name="userID"
					class="form-control">
			</div>
			<div class="row mt-3">
				<label>비밀번호</label> <input type="password" name="userPW"
					class="form-control">
			</div>
			<div class="row mt-3">
				<div class="col">
					<button type="submit" class="btn btn-primary">로그인</button>
					<a href="./index.jsp" class="btn btn-primary">HOME</a>
				</div>

			</div>
		</form>

	</section>








<jsp:include page="./footer.jsp"></jsp:include>

	<!-- 제이쿼리 자바 스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- popper 자바 스크립트 추가하기 -->
	<script src="./js/pooper.js"></script>
	<!-- 부트스트랩 자바 스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>