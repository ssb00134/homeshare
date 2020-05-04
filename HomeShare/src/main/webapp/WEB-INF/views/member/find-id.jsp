<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form action="/homeshare/member/find-id-post" method="post">
		<input type="text" name="MemName">
		<input type="text" name="email">
		<input type="submit" value="아이디찾기">
	</form>
</body>
</html>