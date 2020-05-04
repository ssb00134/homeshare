<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 폼</h1>
	<!-- 
	form에서 action의 주소 표시 방법 
	1) 절대경로 : /ex04/member/login-post
	2) 상대경로 : ./login-post 또는 login-post
	상대경로(패스)에서 .은 현재 폴더(위치)를 의미, ..은 상위 폴더를 의미
	-->
	<form action="login-post" method="post">
		<input type="text" name="memId" id="memId" placeholder="USER ID"
			required="required">
		<br>
		<input type="password" id="password" name="password" placeholder="PASSWORD"
			required="required">
		<br>
		<input type="hidden" name="targetUrl" value="${targetUrl }">
		<input type="submit" value="로그인">
		<c:if test="${login_fail eq 'login_fail'}">
			<p>아이디 또는 비밀번호가 일치하지 않습니다.</p><br>
			<p>아이디가 생각이 안나세요?</p>
			<a href="find-id"><input type="button" value="아이디 찾기"></a>
		</c:if>
	</form>
	<script type="text/javascript">
	$(document).ready(function(){
		var memId = $('#memId').val; // 아이디 값
		var password = $('#password').val; // 비밀번호 값
		ㅍㅁㄱ
	});//end document
	
	</script>
</body>
</html>