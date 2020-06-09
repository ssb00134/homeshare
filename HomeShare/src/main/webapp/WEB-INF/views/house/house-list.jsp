<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<%@ include file="../cdn.jspf"%>

<!-- bxslider -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<meta charset="UTF-8">
<title>게시판 메인 페이지</title>
</head>
<body>

	<!-- 헤더정보 가져오기 -->
	<%@ include file="../navheader.jspf"%>
	<h1>검색결과</h1>
	
	<div class="inner-addon left-addon">
    <i class="glyphicon glyphicon-user">유저</i>
   
</div>
	
	
	<hr>
	<br>
	<div id="house-lists">
		<c:forEach var="vo" items="${houseList }">
			<div class="container-fluid">
				<div class="house_list_item" >
					<div class="row" >
					<div class="house_list_item_click col-md-7"  id="${vo.houseNo }">
						<div class="row col-md-12">${vo.title}
						</div>
						<div class="row border">
						<div class="col-md-8">${vo.type } ${vo.scope }</div>
						<div class="col-md-4"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>${vo.score}</div>
						</div>
						<div class="row col-md-12">${vo.location}</div>
						<div class="row" >
							<div class="col-md-2">인원 ${vo.maxCapacity }명 *</div>
							<div class="col-md-2">침실 ${vo.bedroom }개 *</div>
							<div class="col-md-2">침대 ${vo.bed }개 *</div>
							<div class="col-md-2">화장실 ${vo.bathroom }개 </div>
						</div>
						<input type="hidden" id="utilities" value="${vo.utilities }">
						<div id="utilDiv"></div>
						</div>

								<!-- 이미지슬라이더 -->
					<div class="home__slider col-md-5 border">
						<ul class="bxslider"></ul>
					</div>	
					</div>
					<div class="sessionchk">
						<button type="submit" id="btn_update">수정</button>
						<button type="submit" id="btn_delete">삭제</button>
					</div>
					<!-- 삭제시, 하우스번호, memid전송할것 -->
					<div class="memNo" id="${vo.memNo }">${vo.memNo }</div>
					<input class="imgSource" type="hidden" value="${vo.image }" />
					<br>
				</div>
				<hr>
			</div>
		</c:forEach>
	</div>

	
	<hr>
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

	<div></div>
	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							 // 유틸리티 영역
	                        var utilities = $('#utilities').val();
	                        $.each(utilities.split(','), function(index, element)
	                        {
	                        	console.log('util element ' + element);
	                                $('#utilDiv').append('<div class ="row col-md-12 border">' + element + '</div>');
	                        }); //end each
							
							
							
							
							
							
							
							console.log('home__slider col-md-5 : ' + $('.home__slider').width());
							//업데이트시 동작설정
							$('#btn_delete')
									.click(
											function() {
												var frm = $('#pagingForm');
												frm
														.attr('action',
																'/homeshare/house/house-delete');
												frm.attr('method', 'post');
												frm.submit();
											});

							//클릭시 detail로 전송
							$('.house_list_item_click')
									.click(
											function() {
												//event.preventDefault();
												var houseNo = this.id;
												console.log(houseNo);
												var frm = $('#pagingForm');
												frm
														.attr('action',
																'/homeshare/house/house-detail');
												frm.attr('method', 'get');
												frm.find('[name="houseNo"]')
														.val(houseNo);
												frm.submit();
											}); // end click()

							$('.house_list_item')
									.each(
											function(index, element) {
												$(element).find('ul').attr(
														'id', index);

												//세션 일치하는지 확인해서 수정/삭제버튼 보이기
												var sessionMemNo = '${memberVO.memNo}';
												var itemsMemNo = $(element)
														.find('.memNo').attr(
																'id');
												console.log('sessionmemNo : '
														+ sessionMemNo);
												console.log('items memNo : '
														+ itemsMemNo);

												if (itemsMemNo === sessionMemNo) {
													console
															.log('세션No itemsno 일치');
													$('.sessionchk').show();
												} else {
													$('.sessionchk').hide();
												}
												//이미지 출력기능
												var imgSource = $(this)
														.children('input')
														.val();
												if(imgSource==='' ||imgSource===null){
													console.log('imgSource is null ');
													list += '<li><img width="100" height="100" src="/homeshare/house/display"></li>';
												}else{

												var imgsplit = imgSource
														.split(',');
												console.log('imgsplit  : ' +  imgsplit.value);
												var list = '';
												var width = $('.home__slider').width();
												var height = $('.home__slider').height();
												console.log('width : ' + width + ' height : ' + height);
												imgsplit.forEach(function(index) {
															if (imgsplit[imgsplit.length - 1] != index) {
																console
																		.log("index : "
																				+ index);
																list += '<li><img width="'
																+	width
																+'" height="'
																+ height
																+ '" src="/homeshare/house/display/'
																		+ index
																		+ '"></li>';
															}
														});
												} //end else
												console.log('list : ' + list);
												$(element).find('ul').html(list);
											});

							//bxslider	
							$('.bxslider').bxSlider({
								auto : true,
								speed : 5000,
								pause : 4000,
								mode : 'fade',
								slideWidth  : $('.home__slider').width(),
								slideHeight : $('.home__slider').height(),
								autoControls : true,
								pager : true,
							});

							// 클릭한 a태그의 정보를 가져오는 코드
							$('.pager li a').click(function() {
								// .pager 클래스의 하위 li 요소의 하위 a 요소를 찾아감
								event.preventDefault(); // a 태그의 기본 동작(페이지 이동)을 금지
								var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
								console.log(targetPage);

								var frm = $('#pagingForm'); // form의 정보를 frm에 저장
								frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
								frm.attr('action', 'house-list'); // form에 action 속성 추가
								frm.attr('method', 'get'); // form에 method 속성 추가
								frm.submit(); // form 데이터 전송 
							}); // end click()

						}); // end document
	</script>

</body>
</html>



