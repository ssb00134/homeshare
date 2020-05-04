<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<a href="member/sign-host">호스트 되기</a>
		</div>
		
		<div id="sign-up">
			<a href="member/sign-up/">sign-up</a>
		</div>
	

		<div id="login">
			<c:if test="${empty memId }">
				<a href="member/login">
					<input type="button" value="로그인">
				</a>
			</c:if>
			<c:if test="${not empty memId }">
				<a href="member/logout">
					<input type="button" value="로그아웃">
				</a>
			</c:if>
		</div>
	</header>
	<%@ include file="section.jspf" %>

</body>
</html>