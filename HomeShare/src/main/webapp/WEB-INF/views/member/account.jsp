<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../cdn.jspf"%>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@ include file="../navheader.jspf"%>
	<h1>내정보</h1>
	<div class="form-group">
		<label for="memId" class="col-md-2 control-label">Id</label>
		<input type="text" readonly="readonly" id="memId" name="memId"
			value=${vo.memId }>
		<input type="button" id="btnMemId" value="아이디 변경하기">
	</div>

	<div class="form-group">
		<label for="memName" class="col-md-2 control-label">Name</label>
		<input type="text" readonly="readonly" id="memName" name="memName"
			value=${vo.memName }>
		<input type="button" id="btnMemName" value="이름 변경하기">
	</div>
	<div class="form-group">
		<label for="account" class="col-md-2 control-label">account</label>
		<input type="text" readonly="readonly" id="account" name="account"
			value=${vo.memName }>
		<input type="button" id="btnAccount" value="계좌번호 변경하기">
	</div>
	<div class="form-group">
		<label for="email" class="col-md-2 control-label">email</label>
		<input type="text" readonly="readonly" id="email" name="email"
			value=${vo.memName }>
		<input type="button" id="btnEmail" value="이메일 변경하기">
	</div>
	


	<script type="text/javascript">
		$(document).ready(function() {
			$('#btnMemId').click(function() {
				console.log('btnMemId 클릭');
				$('#memId').removeAttr("readonly");
			}); //end btnMemId click
		});//end document
	</script>
</body>
</html>