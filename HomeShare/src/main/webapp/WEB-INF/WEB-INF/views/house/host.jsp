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

				<div class="hostItem card">
					<input type="hidden" id="imgSource" value="${vo.image }">
					<input type="hidden" id="houseNo" value="${vo.houseNo }">
					<div class="card-header">${vo.title }</div>
					<div class="card-body" id="imgArea">
						<div id="carouselExampleControls" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" id="carousel-inner"></div>
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
						<h5 class="card-title border">${vo.info }</h5>
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
					<div class="card-footer row">
					
						<form class="frm" style="display: none;">
							<input type="text" value="${vo.houseNo }" name="houseNo">
							<input type="text" name="memNo" value="${vo.memNo }">
						</form>
						<form class="imgFrm col-md-12" style="display: none;">
							<input type="hidden" value="${vo.houseNo }" name="houseNo" class="houseNo">
							<input type="hidden" value="${vo.memNo }" Name="memNo" class="memNo">
							<input type="hidden"  Name="item" >
							<input type="text" class="imgSource2" value="${vo.image }">
							<div class="imgSplit form-group">
								
							</div>
						</form>
						<input type="hidden" value="${vo.houseNo }" id="houseNo">
						<button class="btnUpdate btn col-md-4 border">숙소정보
							수정하기</button>
						<button class="btnImgUpdate btn col-md-4 border">이미지
							수정하기</button>
						<button class="btnDelete btn btn-danger col-md-4 border">숙소
							삭제하기</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- end cardgroup -->
	</c:if>

		<div>
		<form id=deleteItemForm style="display: none;">
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
			
			
			$('.btnUpdate').click(function(event){
				console.log('update click' + event);
				//var imgSource = $(element).children('#imgSource').val();
				var houseNo = $(this).siblings('#houseNo').val();
				console.log('houseNo : ' + houseNo);
				document.location.href='/homeshare/house/house-update?houseNo=' + houseNo;
			});
			
			
			$('.imgFrm').each(function(index,element){
				console.log('imgfrm index : '+ index + ' element : ' + element);
				var imgFrm = $(element);
				var imgSource2 = imgFrm.children('.imgSource2').val();
				var houseNo = $('');
				var memNo ='';
				console.log('imgFrm houseno : ' + houseNo);
				console.log('imgSource2 : ' + imgSource2);
				var imgSplit = imgSource2.split(',');
				var list='';
				$.each(imgSplit,function(index2,element2){
					
						console.log('imgSplit[' +index2 + "] : " + element2);
						list += '<div class="imgItems">'
							 +'<img class="img-fluid d-block w-100" src="/homeshare/house/display/'
							 + element2 
							 + '" alt="'
							 + index
							 +'slide">'
							 +'<button type="button" id="' 
							 +element2.split('\\')[1]
							 +'" class="btnDeleteItem btn btn-danger col-md-12">삭제하기</button>'
							 + '</div>';

				}); //end imgsplit each
				imgFrm.children('.imgSplit').append(list);				
			});
			
			
			
			//그 이후 실행했을때
			$('.btnImgUpdate').on('click',function(){
				$(this).siblings('.imgFrm').toggle();
			});
			
	 		$('.btnDelete').click(function(event){
				if(confirm("정말 이 숙소를 삭제하시겠습니까??") == true){
					console.log('삭제 확인');
					var frm = $(this).siblings('.frm');
					frm.attr('action','/homeshare/house/house-delete');
					frm.attr('method', 'post');
					frm.submit();
				}
			}); 
	 		
	 		$('.btnDeleteItem').click(function(e){
	 			var imgFrm = $(this).parents('form');
 				console.log('imgFrm : '+ imgFrm.html());
 				var item = $(this).attr('id');
 				console.log('item : '+item);
 				
	 			if(confirm("정말 이 사진을 삭제하시겠습니까?") == true){
	 				
	 				imgFrm.attr('action','/homeshare/house/house-deleteItem');
	 				imgFrm.attr('method', 'post');
	 				imgFrm.find('[name="item"]').val(item);
	 				imgFrm.submit();
	 			}
	 		});//end click
	 		
	 		
			

		})//end document
	</script>
</body>
</html>