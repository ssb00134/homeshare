<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jspf"%>
	<div class="house_list" OnClick="location.href ='http://house-test-detail'" style="cursor:pointer;">
		<pre>
		<a aria-label="수원시 권선구" data-check-info-section="true" href="house-test-detail">썸네일사진주소</a>
		<div class="houseNo">번호</div>
		<div class="title">제목</div>
		<div class="ranking">별점 점</div>
		<div class="max_copacity">인원 명</div>
		<div class="badroom">침실 개</div>
		<div class="bathroom">욕실 개</div>
		<div class="utilities">유틸리티</div>
		<div style="border: 1px solid #bcbcbc;"></div>
		<!-- end margin-top -->
		</pre>
	</div>
	<!-- end house_list -->
</body>
</html>