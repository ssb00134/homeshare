<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>하우스 리스트</h1>
	<hr>
	<div>
		<!-- 하우스 리스트를 가져오는 곳 -->
		<div id="house-lists"></div>
	</div>

	<hr>
	<!-- 페이저 영역 -->
	<div>
	페이지메이커 : ${startNum}
		<ul class="pager">
			<c:if test="${pageMakger.hasPrev }">
				<li><a href="${pageMaker.startPageNo -1 }">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPageNo }"
			end="${pageMaker.endPageNo }" var="num">
				<li><a href="${num }">${num }</a>
			
			</c:forEach>
			<c:if test="${pageMakger.hasNext }">
				<li><a href="${pageMaker.startPageNo +1 }">다음</a></li>
			</c:if>
		</ul>
	</div>
	<!-- page -->
	<div>
	<form id = "pagingForm" style="display:none">
		<input type="text" name="page">
	</form>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			getAllHouseList(); //전체 하우스 정보 가져오기

			function getAllHouseList() {
				var url = "house-list/all";
				console.log(url);
				$.getJSON(url, function(jsonData) {
					console.log('jsondata : ' + jsonData);
					var list = '';
					$(jsonData).each(
							function(){
							//list += '<div class= "house_list_item_'+ this.houseNo +'"'
							list += '<div class= "house_list_item" id = "' + this.houseNo +'">'
							+'<pre>'
							+ '<div class="houseNo">번호 : '+ this.houseNo+'</div>'
							+ '<div class="title">제목 :'+this.title+'</div>'
							+ '<div class="ranking">별점 '+this.ranking+'점</div>'
							+ '<div class="max_copacity">인원 '+this.maxCapacity+'명</div>'
							+ '<div class="badroom">침실 '+this.bedroom+'개</div>'
							+ '<div class="bathroom">욕실 '+this.bathroom+'개</div>'
							+ '<div class="utilities">유틸리티 :'+this.utilities+'</div>'
							+ '<div style="border: 1px solid #bcbcbc;"></div>'
							+'</pre>'
							+'</div>';	
							});//end each
				$('#house-lists').html(list);
				$('.house_list_item').click(function(){
					//location.href='house-detail/' + ;
					console.log('house-lists 클릭');
					location.href='/homeshare/house/house-detail?houseNo=' + this.id;
				});//end click
				}// end callback();
				);//end getJSON
			}//end getAllHouseList
			
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
		 
		  
		}); //end document
	</script>
</body>
</html>