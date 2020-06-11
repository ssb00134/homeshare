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

	<div id="book-lists">
		<c:forEach var="vo" items="${list }">
			<div class="host_list_item" id="${vo.houseNo }">
				<div>번호${vo.houseNo }</div>
				<div>title : ${vo.title}</div>
				<div>${vo.price}$</div>
				<div>${vo.scope}</div>
				<div>${vo.location}</div>
				<input class="imgSource" id="items" type="hidden"
					value="${vo.image }" />
				<br>
				<!-- 이미지슬라이더 -->
				<div class="home__slider">
					<ul class="bxslider"></ul>
				</div>
			</div>
			<hr>
		</c:forEach>
	</div>
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

			$('.host_list_item').click(function() {
				event.preventDefault();
				var houseNo = this.id;
				console.log(houseNo);
				var frm = $('#pagingForm');
				frm.attr('action', 'house-detail');
				frm.attr('method', 'get');
				frm.find('[name="houseNo"]').val(houseNo);
				frm.submit();
			}); // end click()

		})//end document
	</script>
</body>
</html>