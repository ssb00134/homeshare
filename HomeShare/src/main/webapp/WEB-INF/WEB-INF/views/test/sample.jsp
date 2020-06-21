<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../cdn.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b76b064de112b5b283e72470515766f4"></script>
	<!-- 지도 url -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	
<script language="javascript">
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
		var pop = window.open("/homeshare/test/jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	
	$.fn.jusoCallBack = function(roadFullAddr, entX, entY){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;

		document.form.entX.value = entX;
		document.form.entY.value = entY;
	};


</script>
<title>주소 입력 샘플</title>
</head>
<body>
	todo 좌표계 변환
	GRS80 UTM-K to wgs84
	<form name="form" id="form" method="post">

		<input type="button" onClick="goPopup();" value="팝업_domainChk" />
		<div id="list"></div>
		<div id="callBackDiv">
			<div>
				<div>
					도로명주소 전체(포멧)
					<input type="text" style="width: 500px;" id="roadFullAddr"
						name="roadFullAddr" />
				</div>
				<div id = "coordinate">
					<div>
						X 좌표
						<input type="text" style="width: 500px;" id="entX" name="entX" />
					</div>
					<div>
						Y 좌표
						<input type="text" style="width: 500px;" id="entY" name="entY" />
					</div>
				</div>
			</div>
		</div>
		<div id="map" style="width: 500px; height: 400px;"></div>
	</form>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#entX').click(function(){
						console.log('change 실행');
						console.log('$(#entX) : ' + $('#entX').val());
						console.log('$(#entY) : ' + $('#entY').val());
						var container = document.getElementById('map');
						var options = {
							center : new kakao.maps.LatLng($('#entX').val(), $(
									'#entY').val()),
							level : 3
						};
						var map = new kakao.maps.Map(container, options);	
					}); //end click
					console.log('$(#entX) : ' + $('#entX').val());
					
					
					



						var container = document.getElementById('map');
						var options = {
								center : new kakao.maps.LatLng(33.450701, 126.570667),
							level : 3
						};
						var map = new kakao.maps.Map(container, options);	
				}); //end document
	</script>
</body>
</html>