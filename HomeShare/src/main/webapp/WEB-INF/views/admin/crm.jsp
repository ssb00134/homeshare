<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn.jspf"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<h4>회원 검색하기</h4>
		<div class="row">
			<div class="form-group col-md-1 border">
				<label for="searchbyname">이름</label>
			</div>
			<div class="form-group col-md-2">
				<input type="text" class="form-control" id="searchbyname">
			</div>

			<div class="form-group col-md-1 border">
				<label for="searchbyid">아이디</label>
			</div>
			<div class="form-group col-md-2">
				<input type="text" class="form-control" id="searchbyid">
			</div>
			<div class="form-group col-md-1 border">
				<label for="searchbyid">이메일</label>
			</div>
			<div class="form-group col-md-2">
				<input type="email" class="form-control" id="searchbyemail">
			</div>
		</div>
		<!-- end row -->

		<div class="row">
			<div class="form-group col-md-1 border">
				<label for="orderby">정렬기준</label>
			</div>
			<div class="form-group col-md-2">
				<select class="form-control" id="searchbyname" name="orderby">
					<option value="memId">아이디</option>
					<option value="memName">이름</option>
					<option value="memName">이름</option>
				</select>
			</div>
			<div class="form-group col-md-1 border">
				<button type="submit" class="btn btn-default">전체검색하기</button>
			</div>
			<div class="form-group col-md-1 border">
				<button type="submit" class="btn btn-default">검색</button>
			</div>
			<div class="form-group col-md-1 border">
				<button type="submit" class="btn btn-default">초기화</button>
			</div>
		</div>
	</div>
	<div id= "crmResult"></div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#crmResult").load("/homeshare/admin/crm_result");
		});//end script
	</script>
</body>
</html>