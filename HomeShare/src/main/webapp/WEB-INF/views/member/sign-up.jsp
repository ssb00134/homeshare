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
<form action="/homeshare/member/sign-up-post" method="post"><br>
<input type="text" name="MemId"  placeholder="아이디 입력"><br>
<input type="password" name="password"  placeholder="password"><br>
<input type="password" name="password-check"  placeholder="password check"><br>
<input type="text" name="MemName"  placeholder="이름 입력"><br>
<input type="text" name="email"  placeholder="email입력"><br>
<input type="submit" value="가입하기"> <br>
</form>
</body>
</html>