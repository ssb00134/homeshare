<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입하기</h1>
<form action="/homeshare/member/sign-up-post" method="post">
<input type="text" name="MemId"  placeholder="아이디 입력">
<input type="password" name="password"  placeholder="password">
<input type="password" name="password-check"  placeholder="password check">
<input type="text" name="MemName"  placeholder="이름 입력">
<input type="text" name="email"  placeholder="email입력">
<input type="text" name="account"  placeholder="account 입력">
<input type="submit" value="가입하기"> 
</form>
</body>
</html>