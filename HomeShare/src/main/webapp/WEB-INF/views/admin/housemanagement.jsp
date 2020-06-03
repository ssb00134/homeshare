<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="container-fluid" id="adminHouseForm" target="iframe1">
		<h4>숙소 검색하기</h4>
		<h4>단일검색</h4>
		<div class="row border">
			<div class="form-group col-md-4 border">
				<select class="form-control" id="option" name="option">
					<option>선택하기</option>
					<option value="houseNo">숙소번호</option>
					<option value="memNo">회원번호</option>
					<option value="location">지역</option>
				</select>
			</div>
			<div class="col-md-4">
				<input id="searchHouseItem" class="col-md-4">
			</div>
			<div class="form-group col-md-1 border">
				<button type="submit" id="searchHouse" class="btn btn-default">전체검색하기</button>
			</div>
		</div>
	</form>
	<!-- end row -->
	<h4>조건검색</h4>
	<form class="form-inline form-fluid" id="multySearchForm" target="iframe1">
		<div class="form-group">
			<label for="location">location</label>
			<input type="text" class="form-control" id="location" name="location">
		</div>
		<div class="form-group">
			<label for="bookableDateBegin">예약시작일</label>
			<input type="date" class="form-control" id="bookableDateBegin"
				name="bookableDateBegin">
		</div>
		<div class="form-group">
			<label for="bookableDateEnd">예약종료일</label>
			<input type="date" class="form-control" id="bookableDateEnd"
				name="bookableDateEnd">
		</div>
		<div class="col-md-3">
			<button type="submit" id="multySearch" class="btn btn-default">다중조건검색하기</button>
		</div>
	</form>


	<div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" name="iframe1" id="iframe1"
			src="/homeshare/admin/housemanagement_result"></iframe>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							//로딩시 iframe을 숨긴다.
							$("#iframe1").hide(); // display 속성을 none 으로 바꾼다.

							$('#searchHouse')
									.click(
											function() {
												event.preventDefault();
												console
														.log('searchHouse click ');
												console.log('option : '
														+ $('#option').val());
												var frm = $('#adminHouseForm');
												frm.attr('method', 'post'); // form에 method 속성 추가
												var url = '/homeshare/admin/housemanagement_result/'
														+ $('#option').val()
														+ "/"
														+ $('#searchHouseItem')
																.val();
												console.log('url : ' + url);
												frm.attr('action', url);
												frm.submit();
												$('#iframe1').load(function() {
													console.log('iframe 로드 ');
													$('#iframe1').show();
												});
											}); //end searchHouse click
											
											$('#multySearch').click(function(){
												event.preventDefault();
												console.log('multySearch 실행');
												var frm = $('#multySearchForm');
												frm.attr('action', '/homeshare/admin/housemanagement_result'); // form에 action 속성 추가
												frm.attr('method', 'post'); // form에 method 속성 추가
												frm.submit();
												$('#iframe1').load(function(){
													console.log('iframe 로드 ');
													$('#iframe1').show();
												});
											});//end multySearch click

						})//end script
	</script>
</body>
</html>
