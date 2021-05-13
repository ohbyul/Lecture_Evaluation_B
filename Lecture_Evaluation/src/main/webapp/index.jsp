<%@page import="javax.net.ssl.SSLContext"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>강의평가 웹 사이트</title>
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>

<jsp:include page="./nav.jsp"></jsp:include>

	<section class="container">

	<% System.out.println("index.jsp 출력");
	System.out.println(Arrays.toString(SSLContext.getDefault().getSupportedSSLParameters().getProtocols()));
	//Java 가상 머신(JVM)에서 지원되는 TLS 버전을 확인
	%>

		<!-- 본문 -->
		<form action="./index.jsp" method="get" class="form-inline mt-3">
			<div class="row">
				<div class="col-2">
					<select name="lectureDivide" class="form-select mx-1 mt-2">
						<option value="전체">전체</option>
						<option value="전공">전공</option>
						<option value="교양">교양</option>
						<option value="기타">기타</option> 
					</select>
				</div>
				<div class="col">
					<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력해주세요.">
				</div>
				<div class="col-1 d-grid gap-2">
					<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
				</div>
				<div class="col-1 d-grid gap-2">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary mx-1 mt-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
					 등록
					</button>
				</div>
				<div class="col-1 d-grid gap-2">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-danger mx-1 mt-2" data-bs-toggle="modal" data-bs-target="#reportModal">
					 신고
					</button>
					
				</div>
			</div>

		</form>

	<div class="card bg-light mt-3">
	  <div class="card-header bg-light">
	  	<div class="row">
	  		<div class="col-8 text-left">강의 명 &nbsp;<small>교수명</small></div>
	  		<div class="col-4" style="text-align: right;">
	  			종합 <span style="color: red">A</span>
	  		</div>
	  	</div>
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">정말 좋은 강의 제목 &nbsp <small>(2021년 여름 강의)</small></h5>
	    <p class="card-text">강의 내용이 너무 좋아요 강의 내용이 너무 좋아요 강의 내용이 너무 좋아요 강의 내용이 너무 좋아요 </p>
	    <div class="row">
	    	<div class="col-9 text-left">
	    		성적 <span style="color: red">A</span>
	    		널널 <span style="color: red">A</span>
	    		강의 <span style="color: red">A</span>
	    		<span style="color:green;">(추천 : 15)</span>
	    	</div>
	    	<div class="col-3" style="text-align: right;">
	    		<a onclick="return confirm('추천 하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
	    		<a onclick="return confirm('삭제 하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
	    	</div>
	    </div>
	  </div>
	</div>

	</section>
	












<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">평가 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="./evaluationRegisterAction.jsp" method="post">
      <div class="modal-body">

        	
        	<div class="row">
        		<div class="form-group col-6">
        			<label>강의명</label>
        			<input type="text" name="lectureName" class="form-control" maxlength="20">
        		</div>
        		<div class="form-group col-6">
        			<label>교수명</label>
        			<input type="text" name="professorName" class="form-control" maxlength="20">
        		</div>
        	</div>
        	
        	<div class="row">
        		
        		<div class="col-4">
        			<label>수강 연도</label>
        			<select name="lectureYear" class="form-select">
        				<option value="2011">2011</option>
        				<option value="2012">2012</option>
        				<option value="2013">2013</option>
        				<option value="2014">2014</option>
        				<option value="2015">2015</option>
        				<option value="2016">2016</option>
        				<option value="2017">2017</option>
        				<option value="2018">2018</option>
        				<option value="2019">2019</option>
        				<option value="2020">2020</option>
        				<option value="2021" selected>2021</option>
        			</select>
        		</div>
        		
        		<div class="col-4">
        			<label>수강 학기</label>
        			<select name="semesterDivide" class="form-select">
        				<option value="1학기" selected>1힉기</option>
        				<option value="여름학기">여름학기</option>
        				<option value="2학기">2학기</option>
        				<option value="겨울학기">겨울학기</option>
        			</select>
        		</div>
        		
        		<div class="col-4">
        			<label>강의 구분</label>
        			<select name="lectureDivide" class="form-select">
        				<option value="전공" selected>전공</option>
        				<option value="교양">교양</option>
        				<option value="기타">기타</option>
        			</select>
        		</div>
        		
        	</div>
        	
        	<div class="row">
        		<label>제목</label>
        		<div class="col">
					<input type="text" name="evaluationTitle" class="form-control" maxlength="30">
        		</div>	
        	</div>
        	
        	<div class="row">
        		<label>평가 내용</label>
        		<div class="col">
        			<textarea name="evaluationContent" rows="5" class="form-control" placeholder="내용을 입력하세요."maxlength="2048"></textarea>	
        		</div>	
        	</div>
        	
        	<div class="row">
        		
        		<div class="col">
        			<label>종합</label>
        			<select name="totalScore" class="form-select">
        				<option value="A" selected>A</option>
        				<option value="B">B</option>
        				<option value="C">C</option>
        				<option value="D">D</option>
        				<option value="F">F</option>
        			</select>
        		</div>
        		
        		<div class="col">
        			<label>성적</label>
        			<select name="creditScore" class="form-select">
        				<option value="A" selected>A</option>
        				<option value="B">B</option>
        				<option value="C">C</option>
        				<option value="D">D</option>
        				<option value="F">F</option>
        			</select>
        		</div>
        		
        		<div class="col">
        			<label>널널</label>
        			<select name="comfortableScore" class="form-select">
        				<option value="A" selected>A</option>
        				<option value="B">B</option>
        				<option value="C">C</option>
        				<option value="D">D</option>
        				<option value="F">F</option>
        			</select>
        		</div>
        		
        		<div class="col">
        			<label>강의</label>
        			<select name="lectureScore" class="form-select">
        				<option value="A" selected>A</option>
        				<option value="B">B</option>
        				<option value="C">C</option>
        				<option value="D">D</option>
        				<option value="F">F</option>
        			</select>
        		</div>
        		
        	</div>
        	  
      </div>
		<!-- 모달 바디 끝 -->
	  <div class="modal-footer">
	     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	     <button type="submit" class="btn btn-primary">등록하기</button>
	  </div>
       	
       </form>
       
    </div>
  </div>
</div>
<!-- 모달 끝 -->


<!-- Modal 신고하기 모달-->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">🚨신고하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="./reportAction.jsp" method="post">
      <div class="modal-body">

        	<div class="row">
        		<label>제목</label>
        		<div class="col">
					<input type="text" name="reportTitle" class="form-control" maxlength="30">
        		</div>	
        	</div>
        	
        	<div class="row">
        		<label>내용</label>
        		<div class="col">
        			<textarea name="reportContent" rows="5" class="form-control" placeholder="내용을 입력하세요."maxlength="2048"></textarea>	
        		</div>	
        	</div>
      </div>
		<!-- 모달 바디 끝 -->
	  <div class="modal-footer">
	     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	     <button type="submit" class="btn btn-danger">신고하기</button>
	  </div>
       	
       </form>
       
    </div>
  </div>
</div>
<!-- 모달 끝 -->




<jsp:include page="./footer.jsp"></jsp:include>


	<!-- 제이쿼리 자바 스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- popper 자바 스크립트 추가하기 -->
	<script src="./js/pooper.js"></script>
	<!-- 부트스트랩 자바 스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>