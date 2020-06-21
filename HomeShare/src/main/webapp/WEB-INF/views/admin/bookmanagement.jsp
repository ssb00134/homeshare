<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>예약 검색하기</h4>
	<form class="form-inline form-fluid" id="multySearchForm"
		target="iframe1" action="/homeshare/admin/bookmanagement_result">
		<div class="form-group row">
			<label for="hostId">호스트아이디</label>
			<input type="text" id="hostId" name="hostId">
		</div>
		
		<div class="form-group">
			<select class="form-control" id="hostCheck" name="hostCheck">
				<option>호스트승인여부</option>
				<option value="1">승인</option>
				<option value="0">미승인</option>
			</select>
		</div>
		<div class="col-md-3">
			<button type="submit" id="multySearch" class="btn btn-default">다중조건검색하기</button>
		</div>
	</form>
	<div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" name="iframe1" id="iframe1"
			src="/homeshare/admin/bookmanagement_result"></iframe>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#iframe1").hide();

			$('#multySearch').click(function() {
				$('#iframe1').load(function() {
					console.log('iframe 로드 ');
					$('#iframe1').show();
				});//end load
			}); //end click

		}); //end document;
	</script>
</body>
</html>