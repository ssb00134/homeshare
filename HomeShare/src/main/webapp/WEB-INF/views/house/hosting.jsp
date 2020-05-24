<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내 호스트 목록</h1>

	<div id="book-lists">
		<c:forEach var="vo" items="${list }">
			<hr>
			<div class="house_hosting_item" id="${vo.bookNo }">
			<div>번호 ${vo.houseNo }</div>
			<div>지역 ${vo.location }</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>