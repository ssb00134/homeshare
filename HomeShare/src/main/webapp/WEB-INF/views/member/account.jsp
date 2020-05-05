<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>내정보</h1>
	<div>
	<p>아이디</p>
		<input type="text" readonly="readonly" id="memId" name="memId" value=${vo.memId }>
		<input type="button" id="btnMemId" value="아이디 수정하기">
	</div>
	<br>
	<div>
	<p>이름</p>
		<input type="text" readonly="readonly" id="memName" name="memName" value=${vo.memId }>
		<input type="button" id="btnMemName" value="이름 수정하기">
	</div>
	<br>
	<div>
	<p>계좌번호</p>
		<input type="text" readonly="readonly" id="account" name="account" value=${vo.memId }>
		<input type="button" id="btnMemId" value="계좌번호 수정하기">
	</div>
	<br>
	<div>
	<p>이메일</p>
		<input type="text" readonly="readonly" id="email" name="email" value=${vo.memId }>
		<input type="button" id="btnEmail" value="이메일 수정하기">
	</div>
	<br>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		 $('#btnMemId').click(function(){
			 console.log('btnMemId 클릭');
			 $('#memId').removeAttr("readonly");

		 }); //end btnMemId click
	});//end document
		
	</script>
</body>
</html>