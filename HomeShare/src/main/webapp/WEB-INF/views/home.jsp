<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
header {
	width:100%;
	height:80px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}
</style>
</head>
<body>

	<br>
	<c:if test="${not empty mem_id }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button" method="post"></button>
	</c:if>
	<!-- 헤더바 -->
	<header>

		<div id="main-button">
			<a href="/homeshare/">go main</a>
		</div>
		<div id="sign-host">
			<a href="member/became-a-host">호스트 되기</a>
		</div>

		<div id="sign-up">
			<a href="member/sign-up/">sign-up</a>
		</div>



		<c:if test="${empty memId }">
			<div id="login">
				<a href="member/login">
					<input type="button" value="로그인">
				</a>
			</div>
		</c:if>
		<c:if test="${not empty memId }">
			<div id="myPageToggle">${memId }</div>
			<div id="mypage">
				<a href="member/account">
					<input type="button" value="계정">
				</a>
				<a href="member/alerm">
					<input type="button" value="알람설정">
				</a>
				<a href="member/logout">
					<input type="button" value="로그아웃">
				</a>
				<c:if test="${not empty houseNo }">
				<a href="">
					<input type="button" value="숙소관리하기">
				</a>
				</c:if>
			</div>

		</c:if>
	</header>
	<div><a href="house/house-list">숙소 검색하기</a></div>
	
	<%@ include file="section.jspf"%>

</body>
<script type="text/javascript">
	/* 로그인 버튼을  */
</script>
</html>