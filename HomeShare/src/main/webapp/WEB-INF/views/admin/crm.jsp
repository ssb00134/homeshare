<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<form class="container-fluid" id="adminCrmForm" target="iframe1">
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
			<div class="form-group col-md-1 border">
				<button type="submit" class="btn btn-default">검색</button>
			</div>
			<div class="form-group col-md-1 border">
				<button type="submit" class="btn btn-default">초기화</button>
			</div>
		</div>
		<!-- end row -->

		<div class="row">
			<div class="form-group col-md-1 border">
				<label for="orderby">정렬기준</label>
			</div>
			<div class="form-group col-md-2">
				<select class="form-control" id="orderby" name="orderby">
					<option value="memId">아이디</option>
					<option value="memName">이름</option>
					<option value="email">이메일</option>
				</select>
			</div>
			<div class="form-group col-md-1 border" id="selectall">
				<button type="submit" class="btn btn-default">전체검색하기</button>
			</div>
		</div>
	</form>
	<div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" name="iframe1" id="iframe1"
			src="/homeshare/admin/crm_result"></iframe>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			//로딩시 iframe을 숨긴다.
			$("#iframe1").hide(); // display 속성을 none 으로 바꾼다.

			$('#selectall').click(function() {
				event.preventDefault();
				var frm = $('#adminCrmForm'); // form의 정보를 frm에 저장
				frm.attr('action', '/homeshare/admin/crm_result'); // form에 action 속성 추가
				frm.attr('method', 'post'); // form에 method 속성 추가
				frm.submit();
				$('#iframe1').show();
			});//end click
		});//end script
	</script>
</body>
</html>