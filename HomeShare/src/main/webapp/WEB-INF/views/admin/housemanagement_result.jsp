<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../cdn.jspf"%>
</head>
<body>
	<h1>숙소 검색결과</h1>

	<c:if test="${houseList eq null }">
		<h1>검색결과가 없습니다.</h1>
	</c:if>
	<c:if test="${houseList ne null }">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>숙소번호</th>
						<th>호스트번호</th>
						<th>지역</th>
						<th>예약가능일</th>
						<td>예약종료일</td>
						<td>숙소유형</td>
						<td>최대이용가능인원</td>
						<td>침실</td>
						<td>침대</td>
						<td>욕실</td>
						<td>유틸리티</td>
						<td>이용가능시설</td>
						<td>제목</td>
						<td>소개</td>
						<td>규칙</td>
						<td>x박
						<td>
						<td>x일</td>
						<td>체크인여유</td>
						<td>숙소이용가격</td>
						<td>리플수</td>
						<td>별점</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${houseList }">
						<tr>
							<td>${vo.houseNo }</td>
							<td>${vo.memNo }</td>
							<td>${vo.location }</td>
							<td>${vo.bookableDateBegin }</td>
							<td>${vo.bookableDateEnd }</td>
							<td>${vo.scope}</td>
							<td>${vo.maxCapacity}</td>
							<td>${vo.bedroom}</td>
							<td>${vo.bed}</td>
							<td>${vo.bathroom}</td>
							<td>${vo.utilities}</td>
							<td>${vo.spaces}</td>
							<td>${vo.title}</td>
							<td>${vo.info}</td>
							<td>${vo.rules}</td>
							<td>${vo.stayNight}박
							<td>
							<td>${vo.stayDay}일</td>
							<td>${vo.checkinInterval}일</td>
							<td>${vo.price}</td>
							<td></td>
							<td></td>

							<td><button type="submit" class="btn btn-default">수정하기</button></td>
							<td><button type="submit" class="btn btn-default">삭제하기</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<nav>
		<ul class="pagination">
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
	</nav>
	<form id="pagingForm" style="display: none;">
		<input type="text" name="page" value="${pageMaker.criteria.page }">
		<input type="text" name="orderby" value="${orderby }">
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.pagination li a').click(function() {
				event.preventDefault();
				var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
				console.log(targetPage);

				var frm = $('#pagingForm'); // form의 정보를 frm에 저장
				frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
				frm.find('#orderby').val($('#orderby'));// orderby에 crm orderby 추가
				frm.attr('action', 'housemanagement_result'); // form에 action 속성 추가
				frm.attr('method', 'get'); // form에 method 속성 추가
				frm.submit(); // form 데이터 전송 
			});//end paging
		});//end document
	</script>
</body>
</html>