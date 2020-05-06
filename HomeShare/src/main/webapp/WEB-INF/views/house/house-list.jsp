<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					location.href='/house-detail/' + this.id;
				});//end click
				}// end callback();

				);//end getJSON

			}//end getAllHouseList
		}); //end document
	</script>
</body>
</html>