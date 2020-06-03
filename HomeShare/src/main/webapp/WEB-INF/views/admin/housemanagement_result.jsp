<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>숙소 검색결과</h1>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>숙소번호</th>
				<th>호스트번호</th>
				<th>지역</th>
			</tr>
		</thead>
		<c:forEach var="vo" items="${houseList }">
			<tr>
				<td>${vo.houseNo }</td>
				<td>${vo.memNo }</td>
				<td>${vo.location }</td>
			
				<td><button type="submit" class="btn btn-default">수정하기</button></td>
				<td><button type="submit" class="btn btn-default">삭제하기</button></td>
			</tr>
		</c:forEach>
		<tbody>
		</tbody>
	</table>
</body>
</html>