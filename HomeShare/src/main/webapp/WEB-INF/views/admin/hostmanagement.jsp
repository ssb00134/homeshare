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
		<h4>숙소 검색하기</h4>
		<div class="row">
			<div class="form-group col-md-4 border">
				<select class="form-control" id="option" name="option">
				<option>선택하기</option>
				<option value="houseNo" >숙소번호</option>
				<option value="memNo" >회원번호</option>
				<option value="location" >지역</option>
				</select>
			</div>
			<div class="form-group col-md-4 border" id="search">
				<button type="submit" class="btn btn-default">검색하기</button>
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
			src="/homeshare/admin/hostmanagement_result"></iframe>
	</div>
</body>
</html>