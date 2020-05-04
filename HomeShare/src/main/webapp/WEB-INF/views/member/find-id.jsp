<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form action="find-id-post" method="post">
		<input type="text" name="MemName" placeholder="이름입력">
		<input type="text" name="email" placeholder="이메일 입력">
		<input type="submit" value="아이디찾기">
	</form>
	<c:if test="${find_id_fail eq 'find_id_fail' }">
	<p>아이디 찾기 실패</p>
	</c:if>
	<c:if test="${not empty memId }">
	<p> 당신의 아이디는 ${memId }입니다. </p>
	</c:if>
</body>
</html>