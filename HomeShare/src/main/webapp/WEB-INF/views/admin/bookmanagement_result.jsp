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
<h1>예약 결과</h1>





<c:if test="${bookListPaging ne null }">
				<div class="row">
					<table class="table table-bordered table-hover text">
						<thead class="text">
							<tr class="text">
								<td>예약번호</td>
								<td>체크인</td>
								<td>체크아웃</td>
								<td>예약인원</td>
								<td>총 가격</td>
								<td>수락여부</td>
		
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${bookListPaging }">
								<tr class="bookItem text">
									<td>${vo.bookNo}</td>
									<td class="checkin">${vo.checkin.split(" ")[0]}</td>
									<td class="checkout">${vo.checkout.split(" ")[0]}</td>
									<td>${vo.bookMem}</td>
									<td>${vo.totalPrice}</td>
									<td class="cancleAble">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
		
		
			</c:if>

<div>
		<ul class="pager">
			<c:if test="${pageMaker.hasPrev }">
				<li><a href="${pageMaker.startPageNo - 1}">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPageNo }"
				end="${pageMaker.endPageNo }" var="num">
				<li><a href="${num }">${num }</a></li>
			</c:forEach>
			<c:if test="${pageMaker.hasNext }">
				<li><a href="${pageMaker.endPageNo + 1}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<div>
		<form id="pagingForm" style="display: none;">
			<input type="text" name="page" value="${pageMaker.criteria.page }">
			<input type="text" name="houseNo">
		</form>
	</div>
	

</body>
</html>