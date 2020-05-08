<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${houseVO.title }</h1>
	<hr>
	인원 ${houseVO.maxCapacity }명 · 침실 ${houseVO.bedroom }개 · 욕실
	${houseVO.bathroom }개
	<hr>
	houseVO.info
	<hr>
	<div dir="rtl">
		계산 폼
		<form id="reservationForm"></form>
	</div>

	<!-- 리플 영역 -->
	<hr>
	
	<script type="text/javascript">
	
	
	</script>
</body>
</html>