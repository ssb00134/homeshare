<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신고내역 관리하기</h1>
	1. 숙소별 신고내역 조회하기 
	<form class="form-inline form-fluid" id="reportSearchAllForm"
		target="iframe1" action="/homeshare/admin/reportmanagement_result">
		<div class="form-group col-md-1 border">
				<button type="submit" id="readReportAll" class="btn btn-default">전체검색하기</button>
			</div>
	</form>

	<div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" name="iframe1" id="iframe1"
			src="/homeshare/admin/reportmanagement_result"></iframe>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#readReportAll').click(function(){
				
				
				
				$('#iframe1').load(function() {
					console.log('iframe 로드 ');
					$('#iframe1').show();
				});
			});//end click
		});//end document
	</script>
</body>
</html>
