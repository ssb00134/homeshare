<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<%@ include file="cdn.jspf"%>
</head>
<body>
	<c:if test="${not empty mem_id }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button" method="post"></button>
	</c:if>

	<button type="button" class="btn btn-default" data-toggle="tooltip" 
	data-placement="left" title="Tooltip on left" id="bookcount">
	</button>
	
	
	
	
	
	
	<%@ include file="navheader.jspf"%>
	

	<%@ include file="section.jspf"%>
	<div style="border: 5px solid grey;">
		테스트영역
		<hr>
		<div>
			TODO : 1. main에서 ajax로 host정보 받기<br> 2. 만약 호스트 숙소에 예약이 들어오면, 호스트
			알람을 띄울것<br> 3. 리플에 별점 부여하기<br> 4. boot
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">@</span>
				<input type="text" class="form-control" placeholder="Username"
					aria-describedby="basic-addon1">
			</div>
		</div>
		<div id="ishostbook"></div>
		<br>
		<div>
			<a href="/homeshare/jusoPopup">
				<input type="text">
				주소테스트
			</a>
		</div>
		<br>
		<div>
			<a href="/homeshare/house/listall">
				<input type="text">
				모든 데이터 보기
			</a>
		</div>
		<br> <br>
		<div>
			<a href="/homeshare/test/websocket">
				<input type="text">
				웹소켓 테스트
			</a>
		</div>
		<br>
	</div>
	<%@ include file="footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			//예약 획수 가져오기
		
			//툴팁초기화
			

			
			
			
			
			var session = '${memId}';
			console.log('session : ' + session);
			if (session != '') {
				console.log('getAllHostBook 실행');
				//getAllHostBook();
				getsHouseNoByMemNo(); //houseno 정보 가져오기
			}
			
			function getsHouseNoByMemNo() {
				var url = '/homeshare/house/ishost/' + '${memberVO.memNo }';
				console.log('url : ' + url);
					$.getJSON(url, function(jsonData) {
						console.log(JSON.stringify(jsonData));
						var parse = [];
						parse = JSON.stringify(jsonData).replace('[','').replace(']','').split(',');
						console.log(parse[0]); //가져온 houseno 정보		
						
						if(parse.length > 0){ //만약 1개 이상의 house가 있으면 - host이면
							$(parse).each(function(index, element){
								console.log(index  + ' : ' + element);
								var url = '/homeshare/book/all/' + element;
								console.log('url : ' + url);
								var count =0;
								$.getJSON(url,function(jsonData){
									console.log(jsonData);
									var hostcheck = 0;
									$(jsonData).each(function(){
										if(this.hostCheck=== 0){
											hostcheck++;
										};
										
										console.log(this.bookNo + "hostcheck : " +this.hostCheck);
									});// end jsonEach
									console.log('hostcheck : ' + hostcheck );
									if(hostcheck > 0){
										$('#bookcount').append('새로운 예약이 있습니다');	
									}
								});//end getJSON
							});// end each
						}//end if parse>0
						
						
					});//end getJSON
				}; //end getallhostbook

			
			//todo : ajax로 리스트 받기
			//ajax로 받기
			function getAllHostBook() {
			var url = '/homeshare/book/all/' + '${memberVO.houseNo }';
			console.log('url : ' + url);
				$.getJSON(url, function(jsonData) {
					// console.log(jsonData);
					var count = 0;
					$(jsonData).each(function() {
						//console.log(jsonData);
						count++;
					}//endcallback
					);//end each 
					console.log(count);
					$('#ishostbook').html(count);
				}//end callback
				);//end getJSON
			}; //end getallhostbook
			
		}); //end document
	</script>
</body>

</html>