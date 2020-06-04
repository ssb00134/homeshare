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
	<h1>신고내역 결과</h1>
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>신고번호</th>
					<th>신고아이디</th>
					<th>신고된숙소번호</th>
					<th>신고내용</th>
				</tr>
			</thead>
			<c:forEach var="vo" items="${reportList }">
				<tr>
					<td>${vo.reportNo }</td>
					<td>${vo.reportMemNo }</td>
					<td>${vo.reportHouseNo }</td>
					<td>${vo.reason }</td>
				</tr>
			</c:forEach>

		</table>
	</div>

</body>
</html>