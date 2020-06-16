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
	반응형 list의 크기에 따라 card 갯수 조절가능 list의 개수는 최대 3개 제한
	<c:if test="${houseList ne null }">
		<div class="card-group">
			<c:forEach var="vo" items="${houseList }">
				<!-- cardgrooup -->

				<div class="hostItem card" >
					<input type="hidden" id="imgSource" value="${vo.image }">
					<div class="card-header">header</div>
					<div class="card-body" id="imgArea">
						<div id="carouselExampleControls" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active ">
									
								</div>
								
								
							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls"
								role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carouselExampleControls"
								role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="card-body">
						<p class="card-text">
						<h5 class="card-title border">${vo.title }</h5>
						</p>
						<div class="card-text">
							<strong>유틸리티</strong> <small>${vo.utilities }</small>
						</div>
						<div class="card-text">
							<strong>준수해야할 규칙</strong> <small>${vo.rules }</small>
						</div>
						<div class="card-text">
							<strong>예약 가능한 기간</strong> <small>${vo.bookableDateBegin }</small>
							<small>${vo.bookableDateEnd }</small>
						</div>
					</div>
					<div class="card-footer">
						<small class="text-muted">footer</small>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- end cardgroup -->
	</c:if>

	<div>
		<form id="pagingForm" style="display: none;">

			<input type="text" name="houseNo">
		</form>
	</div>
	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			
			var list='';
			$('.hostItem').each(function(index, element){
				console.log('index : ' + index + ' element : ' + element);
				var imgSource = $(element).children('#imgSource').val();
				console.log('imgsource : '+ imgSource);
				
				var imgSplit = imgSource.split(',');
				$.each(imgSplit, function(index2,element2){
					if(index2 < imgSplit.length / 2 -1 ){
						console.log('imgSplit[' +index2 + "] : " + element2);
						list += '<img class="img-fluid d-block w-100"'
							 	+ 'src="/homeshare/house/display/' + element2 + '"'
								+ 'alt="'
								+ index2
								+ 'slide">';
					}
				}); //end imgsource each
				console.log(list);
				$(element).find('.carousel-item').append(list);
			});
			console.log('list : ' + list);
			

		})//end document
	</script>
</body>
</html>