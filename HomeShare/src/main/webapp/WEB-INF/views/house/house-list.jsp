<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b76b064de112b5b283e72470515766f4"></script>

<style type="text/css">
img { max-width: 100%; height: auto; }


.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}






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
	
	<c:if test="${houseList ne null }">
		<div class="row">
			<c:forEach var="vo" items="${houseList }">
				<!-- cardgrooup -->

				<div class="hostItem card col-md-4">
					<input type="hidden" id="imgSource" value="${vo.image }">
					<input type="hidden" class="houseNo" value="${vo.houseNo }">
					<div class="card-body" id="imgArea">
						<div id="carouselExampleControls" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" id="carousel-inner" style="max-height:250px"></div>
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
					<div>
					 <span class="starR on"></span>
						${vo.score }(${vo.replies })
					</div>
					<div >
						${vo.type }
						&middot; 
						${vo.scope }
						&middot; 
					</div>
					<div>
						<h5 class="">${vo.location }</h5>
					</div>
					<div>
						<h5 class="">${vo.title }</h5>
					</div>
					<div class="card-footer row">
					
						footer
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- end cardgroup -->
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

	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
							$('.hostItem').each(function(index, element){
								console.log('index : ' + index + ' element : ' + element);
								var imgSource = $(element).children('#imgSource').val();
								console.log('imgsource : '+ imgSource);
								
								var imgSplit = imgSource.split(',');
								imgSplit.splice(imgSplit.length-1,imgSplit.length-1); //마지막 요소 삭제
								console.log(' imgSplit 개수 : ' + imgSplit.length);
								
								var list='';	
								$.each(imgSplit, function(index2,element2){
										console.log('imgSplit[' +index2 + "] : " + element2);
											if(index2==0){
												list +=  '<div class="carousel-item active">'
											}else{
												list +=  '<div class="carousel-item">'
											}
										list += '<img class="img-fluid d-block w-100"'
											 	+ 'src="/homeshare/house/display/' + element2 + '"'
												+ 'alt="'
												+ index2
												+ 'slide">'
												+ '</div>';
									
								}); //end imgsplit each
									$(element).find('#carousel-inner').append(list);
								console.log(list);
							});
							
							//카드 클릭시 디테일 
							$('.hostItem').click(function(){
								var houseNo = $(this).children('.houseNo').val();
								console.log('houseNo : ' + houseNo);
								var frm = $('#pagingForm');
								frm.attr('action','/homeshare/house/house-detail');
								frm.attr('method', 'get');
								frm.find('[name="houseNo"]').val(houseNo);
								frm.submit();
								
							});//
							
							
							
							
						
							
							

							/* end map */
							
							$('.house_list_item_click').each(function(index,element){
								console.log('index click : ' + index + 'element : ' + element);
								var wgsX = $(element).find('#wgsX').val()*1;
								var wgsY = $(element).find('#wgsY').val()*1;
								console.log('click wgsX : ' + wgsX);
								console.log('click wgsY : ' + wgsY);

								 var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

								 console.log('container :' + container);
	                            var options = { //지도를 생성할 때 필요한 기본 옵션
			                             center: new kakao.maps.LatLng(wgsX,wgsY), //지도의 중심좌표.
			                             level: 10
	                               //지도의 레벨(확대, 축소 정도)
	                           };
	                            
								 var map = new kakao.maps.Map(container,options); //지도 생성 및 객체 리턴 
								 
								// 마커가 표시될 위치입니다 
								 var markerPosition = new kakao.maps.LatLng(wgsX, wgsY); 

								 // 마커를 생성합니다
								 var marker = new kakao.maps.Marker({
								     position: markerPosition
								 });
								
								// 마커가 지도 위에 표시되도록 설정합니다
								 marker.setMap(map);
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



