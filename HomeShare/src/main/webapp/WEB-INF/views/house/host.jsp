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
			<div class="houselist_item card border">

				<!-- Card deck -->
				<div class="card-deck row">
					<div class="col-md-8">
						<div class="house_list_item card">
							<input type="hidden" id="houseNo" value="${vo.houseNo }">
							<input type="hidden" id="imageSource" value="${vo.image }">
							
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
						</div>




					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">
						<!-- Card -->
						<div class="card">

							<!--Card image-->
							<!-- 이미지슬라이더 -->
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner">
									<div class="carousel-item active">
										
									
								</div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
							<!-- End 이미지슬라이더 -->

							<!--Card content-->
							<div class="card-body">

								<!--Title-->
								<h4 class="card-title">1 Card title</h4>
								<!--Text-->
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
								<button type="button" class="btn btn-light-blue btn-md">Read
									more</button>

							</div>

						</div>

					</div>


				</div>
				<!-- Card deck -->


			</div>
		</c:forEach>
	</c:if>
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="..." alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="..." alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="..." alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>





	<div>
		<form id="pagingForm" style="display: none;">

			<input type="text" name="houseNo">
		</form>
	</div>
	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {

							$('.house_list_item').each(function(index, element) {
												console.log('index : ' + index + ' element : ' + element);
												$(element).find('ul').attr('id', index);
												//이미지 출력기능
												var imgSource = $(this).children('#imageSource').val();
												console.log("imgSource : " + imgSource);
												if (imgSource === ''
														|| imgSource === null) {
													console
															.log('imgSource is null ');
													list += '<li><img width="100" height="100" src="/homeshare/house/display"></li>';
												} else {
													var imgsplit = imgSource.split(',');
													console.log('imgsplit  : '+ imgsplit);
													var list = '';
												
													imgsplit.forEach(function(
																	index) {
																if (imgsplit[imgsplit.length - 1] != index) {
																	console
																			.log("index : "
																					+ index);
																	
																	list += '<div class="carousel-item active">'
																		    + '<img class="d-block w-100" src="/homeshare/house/display/'
																			+ index
																			+ '" alt="Second slide">'		
																			+ '</div>';
																	}
															});
												} //end else
												console.log('list : ' + list);
												$('.carousel-inner').append(list);
											});

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