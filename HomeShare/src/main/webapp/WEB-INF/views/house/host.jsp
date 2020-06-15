<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../cdn.jspf"%>
<!-- bxslider -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<!-- 헤더정보 가져오기 -->
	<%@ include file="../navheader.jspf"%>
	<h1>내 호스트 목록</h1>

	<c:if test="${houseList ne null }">
		<c:forEach var="vo" items="${houseList }">
			<div class="houselist_item container-fluid border">
				<input type="hidden" id="houseNo" value="${vo.houseNo }">
				<div class="row">
					<div id="${vo.houseNo }" class="houselist_item_click col-md-8">
						<div class="row">
							<div class="col-md2 border">숙소번호</div>
							<div class="col-md1 border">${vo.houseNo}</div>
							<div class="col-md-4">최대 이용가능 인원</div>
							<div class="1">${vo.maxCapacity }명</div>
							<div class="col-md-3">${vo.scope }</div>
							<div class="col-md-3">${vo.type }</div>
						</div>
						<div class="row">
							<div class="col-md-3">화장실 ${vo.bathroom }개</div>
							<div class="col-md-3">침대 ${vo.bed }개</div>
							<div class="col-md-3">침실 ${vo.bedroom }개</div>
						</div>
						<div class="row"></div>
						<div class="col-md-12 border">${vo.title }</div>
						<div class="col-md-12 border">${vo.info }</div>
						<div class="col-md-12 border">${vo.location }</div>
						<div class="col-md-12 border">${vo.rules }</div>
					</div>
					<div class="col-md-4 border">
					
						<div class="row border">사진영역</div>
						<div class="row">
							<input type="text" value="${vo.houseNo }">
							<button class="btn_house_update btn col-md-4">숙소 정보 수정</button>
							<button class="btn_house_delete btn col-md-4">숙소 삭제</button>
							<button  class="btn_image_update btn col-md-4">사진 수정하기</button>
						</div>
					</div>
				</div>
				<hr>
			</div>


		</c:forEach>
	</c:if>





	<div>
		<form id="pagingForm" style="display: none;">

			<input type="text" name="houseNo">
		</form>
	</div>
	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.bxslider').bxSlider({
				autoplay : true, //자동실행
				arrows : true, //좌우화살표끄기
				dots : true, //페이지버튼나오기
				swipe : false, //마우스드래그 이동 끄기
				pauseOnHover : false, //마우스올렸을때 멈춤기능 끄기
				slidesToShow : 1, //보여질 썸네일 갯수,한번에 보여줄 슬라이드 개수
				slidesToScroll : 1, // 스크롤되는 썸네일 갯수,2는 2개씩 1은 1개씩
				autoplaySpeed : 2000
			//자동으로 실행되어지느 시간
			});

			$(".bx-stop").click(function() { // 중지버튼 눌렀을때	
				$('.bxslider').stopAuto();
				$(".bx-stop").hide();
				$(".bx-start").show();
				return false;
			});

			$(".bx-start").click(function() { //시작버튼 눌렀을때
				$('.bxslider').startAuto();
				$(".bx-start").hide();
				$(".bx-stop").show();
				return false;
			});// end click

			$('.houselist_item_click').click(function() {
				event.preventDefault();
				var houseNo = this.id;
				console.log(houseNo);
				var frm = $('#pagingForm');
				frm.attr('action', 'house-detail');
				frm.attr('method', 'get');
				frm.find('[name="houseNo"]').val(houseNo);
				frm.submit();
			}); // end click()

			$('.btn_house_update').click(function() {
				event.preventDefault();
				
				var houseNo = $(this).prevAll('input').val();
				console.log('houseNo : ' + houseNo);
				var frm = $('#pagingForm');
				frm.attr('action', 'house-update');
				frm.attr('method', 'get');
				frm.find('[name="houseNo"]').val(houseNo);
				frm.submit(); // form 데이터 전송 
			});

		})//end document
	</script>
</body>
</html>