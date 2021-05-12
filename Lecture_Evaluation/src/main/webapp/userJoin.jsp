<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<jsp:include page="./nav.jsp"></jsp:include>


	<!-- 본문 -->
	<section class="container mt-3" style="max-width: 560px;">

		<form action="./userRegisterAction.jsp" method="post">
			<div class="row mt-3">
				<label>아이디</label> 
				<input type="text" name="userID"
					class="form-control">
			</div>
			<div class="row mt-3">
				<label>이메일</label> 
				<input type="email" name="userEmail"
					class="form-control">
			</div>
			<div class="row mt-3">
				<label>비밀번호</label> 
				<input type="password" name="userPW"
					class="form-control">
			</div>
			<div class="row mt-3">
				<div class="col">
					<button type="submit" class="btn btn-primary">회원가입</button>
					<a href="./index.jsp" class="btn btn-primary">취소</a>
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