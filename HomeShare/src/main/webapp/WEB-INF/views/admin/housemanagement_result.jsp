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
<link href="/homeshare/resources/css/docs.min.css" rel="stylesheet">
</head>
<body>
	<h1>숙소 검색결과</h1>

	<c:if test="${houseList eq null }">
		<h1>검색결과가 없습니다.</h1>
	</c:if>
	<c:if test="${houseList ne null }">
		<div class="table-responsive">
			<table class="table table-bordered table-hover text-overflow ">
				<thead>
					<tr class="text">
						<th>숙소번호</th>
						<th>호스트번호</th>
						<th class="text">지역</th>
						<th>예약가능일</th>
						<td>예약종료일</td>
						<td>숙소유형</td>
						<td>최대이용가능인원</td>
						<td>침실</td>
						<td>침대</td>
						<td>욕실</td>
						<td><div class="text">유틸리티</div></td>
						<td><div class="text">이용가능시설</div></td>
						<td><div class="text">제목</div></td>
						<td><div class="text">소개</div></td>
						<td><div class="text">규칙</div></td>
						<td>x박</td>
						<td>x일</td>
						<td>체크인여유</td>
						<td>숙소이용가격</td>
						<td>누적신고횟수</td>
						<td>후기수</td>
						<td>별점</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${houseList }">
						<tr class="text" >
							<td>${vo.houseNo }</td>
							<td>${vo.memNo }</td>
							<td class="text">${vo.location }</td>
							<td>${vo.bookableDateBegin }</td>
							<td>${vo.bookableDateEnd }</td>
							<td>${vo.scope}</td>
							<td>${vo.maxCapacity}</td>
							<td>${vo.bedroom}</td>
							<td>${vo.bed}</td>
							<td>${vo.bathroom}</td>
							<td ><div class="text">${vo.utilities}</div></td>
							<td ><div class="text">${vo.spaces}</div></td>
							<td><div class="text">${vo.title}</div></td>
							<td><div class="text">${vo.info}</div></td>
							<td><div class="text">${vo.rules}</div></td>
							<td>${vo.stayNight}박
							<td>
							<td>${vo.stayDay}일</td>
							<td>${vo.checkinInterval}일</td>
							<td>${vo.price}</td>
							<td>${vo.reportCount }</td>
							<td></td>
							<td></td>

							<td><button type="submit" class="btn btn-default">수정</button></td>
							<td><button type="submit" class="btn btn-default">삭제</button></td>
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