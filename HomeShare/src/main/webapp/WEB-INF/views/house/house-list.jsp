<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>하우스 테스트</h1>

	<div>
		<!-- 리플을 가져오는 곳 -->
		<div id="house-lists"></div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		 getAllHouseList(); //전체 하우스 정보 가져오기
		 
		 function getAllHouseList(){
			var url = "house/house-list/all";
			console.log(url);
		 }
	}); //end document
	</script>
</body>
</html>