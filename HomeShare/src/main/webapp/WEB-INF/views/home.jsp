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
	</div>
	<div class="col-md-3" role="complementary" style="height: auto !important; min-height: 0px !important;">
          <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix">
            <ul class="nav bs-docs-sidenav">
              
                <li class="">
  <a href="#glyphicons">아이콘 (Glyphicons)</a>
  <ul class="nav">
    <li><a href="#glyphicons-glyphs">사용가능한 기호</a></li>
    <li><a href="#glyphicons-how-to-use">사용법</a></li>
    <li><a href="#glyphicons-examples">예제</a></li>
  </ul>
</li>
<li>
  <a href="#dropdowns">드롭다운</a>
  <ul class="nav">
    <li><a href="#dropdowns-example">예제</a></li>
    <li><a href="#dropdowns-alignment">정렬</a></li>
    <li><a href="#dropdowns-headers">헤더</a></li>
    <li><a href="#dropdowns-divider">구분선</a></li>
    <li><a href="#dropdowns-disabled">비활성화된 메뉴 항목</a></li>
  </ul>
</li>
<li>
  <a href="#btn-groups">버튼 그룹</a>
  <ul class="nav">
    <li><a href="#btn-groups-single">기본 예제</a></li>
    <li><a href="#btn-groups-toolbar">버튼 툴바</a></li>
    <li><a href="#btn-groups-sizing">크기 조절</a></li>
    <li><a href="#btn-groups-nested">중첩하기</a></li>
    <li><a href="#btn-groups-vertical">수직으로 변형</a></li>
    <li><a href="#btn-groups-justified">양쪽정렬로 변형</a></li>
  </ul>
</li>
<li>
  <a href="#btn-dropdowns">버튼 드롭다운</a>
  <ul class="nav">
    <li><a href="#btn-dropdowns-single">단버튼 드롭다운</a></li>
    <li><a href="#btn-dropdowns-split">분할된 버튼 드롭다운</a></li>
    <li><a href="#btn-dropdowns-sizing">크기조절</a></li>
    <li><a href="#btn-dropdowns-dropup">드롭업으로 변형</a></li>
  </ul>
</li>
<li>
  <a href="#input-groups">입력 그룹</a>
  <ul class="nav">
    <li><a href="#input-groups-basic">기본 예제</a></li>
    <li><a href="#input-groups-sizing">크기 조절</a></li>
    <li><a href="#input-groups-checkboxes-radios">체크박스와 라디오 에드온</a></li>
    <li><a href="#input-groups-buttons">버튼 에드온</a></li>
    <li><a href="#input-groups-buttons-dropdowns">드롭다운 버튼</a></li>
    <li><a href="#input-groups-buttons-segmented">분할된 버튼</a></li>
  </ul>
</li>
<li class="active">
  <a href="#nav">네비게이션</a>
  <ul class="nav">
    <li><a href="#nav-tabs">탭형</a></li>
    <li><a href="#nav-pills">알약형</a></li>
    <li><a href="#nav-justified">양쪽정렬된</a></li>
    <li><a href="#nav-disabled-links">비활성화된 링크</a></li>
    <li class="active"><a href="#nav-dropdowns">드롭다운 사용하기</a></li>
  </ul>
</li>
<li class="">
  <a href="#navbar">네비게이션 바</a>
  <ul class="nav">
    <li class=""><a href="#navbar-default">기본 네비게이션 바</a></li>
    <li class=""><a href="#navbar-brand-image">브랜드 이미지</a></li>
    <li class=""><a href="#navbar-forms">폼</a></li>
    <li><a href="#navbar-buttons">버튼</a></li>
    <li><a href="#navbar-text">텍스트</a></li>
    <li><a href="#navbar-links">일반 링크</a></li>
    <li><a href="#navbar-component-alignment">콤포넌트 정렬</a></li>
    <li><a href="#navbar-fixed-top">상단에 고정된</a></li>
    <li><a href="#navbar-fixed-bottom">하단에 고정된</a></li>
    <li><a href="#navbar-static-top">정적 상단</a></li>
    <li><a href="#navbar-inverted">반전된 네비게이션 바</a></li>
  </ul>
</li>
<li><a href="#breadcrumbs">경로</a></li>
<li>
  <a href="#pagination">페이지네이션</a>
  <ul class="nav">
    <li><a href="#pagination-default">기본 페이지네이션</a></li>
    <li><a href="#pagination-pager">페이저</a></li>
  </ul>
</li>
<li><a href="#labels">라벨</a></li>
<li><a href="#badges">배지</a></li>
<li><a href="#jumbotron">점보트론</a></li>
<li><a href="#page-header">페이지 제목</a></li>
<li>
  <a href="#thumbnails">썸네일</a>
  <ul class="nav">
    <li><a href="#thumbnails-default">기본 예제</a></li>
    <li><a href="#thumbnails-custom-content">맞춤 콘텐츠</a></li>
  </ul>
</li>
<li>
  <a href="#alerts">경보</a>
  <ul class="nav">
    <li><a href="#alerts-examples">예제</a></li>
    <li><a href="#alerts-dismissible">없앨 수 있는 경보</a></li>
    <li><a href="#alerts-links">경보 내 링크</a></li>
  </ul>
</li>
<li>
  <a href="#progress">진행바</a>
  <ul class="nav">
    <li><a href="#progress-basic">기본 예제</a></li>
    <li><a href="#progress-label">라벨</a></li>
    <li><a href="#progress-alternatives">맥락적인 의미</a></li>
    <li><a href="#progress-striped">줄무늬</a></li>
    <li><a href="#progress-animated">움직이는</a></li>
    <li><a href="#progress-stacked">쌓이는</a></li>
  </ul>
</li>
<li>
  <a href="#media">미디어 객체</a>
  <ul class="nav">
    <li><a href="#media-default">기본 미디어</a></li>
    <li><a href="#media-list">미디어 목록</a></li>
  </ul>
</li>
<li>
  <a href="#list-group">목록 그룹</a>
  <ul class="nav">
    <li><a href="#list-group-basic">기본 예제</a></li>
    <li><a href="#list-group-badges">배지</a></li>
    <li><a href="#list-group-linked">링크 있는 항목</a></li>
    <li><a href="#list-group-disabled">비활성화된 항목</a></li>
    <li><a href="#list-group-contextual-classes">맥락 클래스</a></li>
    <li><a href="#list-group-custom-content">맞춤 콘텐츠</a></li>
  </ul>
</li>
<li>
  <a href="#panels">패널</a>
  <ul class="nav">
    <li><a href="#panels-basic">기본 예제</a></li>
    <li><a href="#panels-heading">상단이 있는 패널</a></li>
    <li><a href="#panels-alternatives">맥락적인 의미</a></li>
    <li><a href="#panels-tables">테이블</a>
    </li><li><a href="#panels-list-group">목록 그룹</a>
  </li></ul>
</li>
<li><a href="#responsive-embed">반응성 임베드</a></li>
<li><a href="#wells">웰 (Wells)</a></li>

              
            </ul>
            <a class="back-to-top" href="#top">
              상단으로 돌아가기
            </a>
            
            <a href="#" class="bs-docs-theme-toggle" role="button">
              Preview theme
            </a>
            
          </nav>
    <div class="google-auto-placed" style="width: 100%; height: auto; clear: both; text-align: center;">
	<nav class="bs-docs-sidebar">sidebar test</nav>
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
										$('#bookcount').html('새로운 예약이 있습니다');	
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