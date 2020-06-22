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
	<form action="/homeshare/member/update" method="post">
	<h1>개인정보</h1>
	<div class="form-group">
		<label for="memId" class="col-md-2 control-label">Id</label>
		<input type="text" readonly id="memId" name="memId"
			value=${vo.memId }>
		<input type="button" id="btnMemId" class="btn  btn-danger" value="아이디 변경하기">
	</div>

	<div class="form-group">
		<label for="memName" class="col-md-2 control-label">Name</label>
		<input type="text" readonly id="memName" name="memName"
			value=${vo.memName }>
		<input type="button" id="btnMemName" class="btn  btn-danger" value="이름 변경하기">
	</div>
	<div class="form-group">
		<label for="account" class="col-md-2 control-label">phone</label>
		<input type="text" readonly id="phone" name="phone"
			value=${vo.phone }>
		<input type="button" id="btnAccount" class="btn btn-danger" value="전화번호 변경하기">
	</div>
	<div class="form-group">
		<label for="email" class="col-md-2 control-label">email</label>
		<input type="text" readonly="readonly" id="email" name="email"
			value=${vo.memName }>
		<input type="button" id="btnEmail" class="btn  btn-danger" value="이메일 변경하기">
	</div>

	<div class="form-group">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="gender" value="male" name="gender"
				  required="required">
				  <label class="form-check-label" for="inlineCheckbox1">male</label>
				  <input class="form-check-input" type="checkbox" id="gender" value="femail" name="gender"
				  required="required">
				  <label class="form-check-label" for="inlineCheckbox1">female</label>
				</div>
		</div>
		<button class="btn" type="submit">정보 수정하기</button>
</form>

	<script type="text/javascript">
		$(document).ready(function() {
			
			$('.btn-danger').click(function(){
				console.log('btn click');
				var input = $(this).siblings('input');
				console.log(input);
				input.attr('readonly',false);
			});
			
		});//end document
	</script>
</body>
</html>