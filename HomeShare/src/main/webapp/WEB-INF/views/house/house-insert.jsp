<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#floatMenu {
	position: absolute;
	width: 70%;
	height: 200px;
	left: 50px;
	top: 350px;
	background-color: #606060;
	color: #fff;
}

.btn .btnCircle {
	border-border-radius: 50%;
}





</style>


<!-- proj4 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.2/proj4-src.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b76b064de112b5b283e72470515766f4"></script>
	
	
	
	
	
	
	
	
<link href="/homeshare/resources/css/bootstrap.css" rel="stylesheet">



<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
	 <script src="/homeshare/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script>
	
<script src="/homeshare/resources/js/bootstrap.min.js"
	type="text/javascript"></script>
	
	
	
	
	
	
	
	
	
</head>
<body>
<%@ include file="../navbar.jspf"%>
	<!-- <header class="border-0">
		<div class="row">
		<div class="col-md-2 border-0">
		<a href="/homeshare/">
		<svg fill="#000000" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48px" height="48px"><path d="M 12 3.90625 L 11.75 4.0625 L 0.25 11.0625 L 0.75 11.9375 L 12 5.09375 L 23.25 11.9375 L 23.75 11.0625 L 20 8.78125 L 20 4 L 18 4 L 18 7.5625 L 12.25 4.0625 Z M 12 6.5 L 2 12.5 L 2 24 L 22 24 L 22 12.5 Z M 9 13 L 15 13 L 15 22 L 9 22 Z"/></svg>
		</a>
		MAIN
		</div>
		<div class="col-md-8"><h1>숙소 등록하기</h1></div>
		</div>
	</header> -->
	<div class="row">
		<div class="col-md-2"></div>
		<form action="/homeshare/house/house-insert-post"
			enctype="multipart/form-data" class="form-horizontal col-md-8"
			method="post">


			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div id="class1">
				<h1>1단계 기본 사항 입력</h1>
			</div>

			<input type="hidden" name="houseNo" value="0">
			<input type="hidden" name="replies" value="0">
			<input type="hidden" name="score" value="0">
			<input type="hidden" name="memNo" value="${memberVO.memNo }">
			<input type="hidden" name="reportCount" value="0">
			<input type="hidden" name="hostId" value="${memberVO.memId }">
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<h4>등록하시려는 숙소의 범위를 입력해 주세요</h4>
			<div class="form-group border-0">
				<select name="scope" required="required"
					class="form-control col-md-4">
					<option value="">집전체</option>
					<option value="개인실">개인실</option>
					<option value="다인실">다인실</option>
				</select>
			</div>
			<h4>등록하려는 숙소의 유형을 입력해 주세요</h4>
			<div class="form-group">
				<select name="type" class="col-md-4" required="required">
					<option value="">유형선택</option>
					<option value="아파트">아파트</option>
					<option value="주택">주택</option>
					<option value="별채">별채</option>
					<option value="독특한숙소">독특한숙소</option>
				</select> <select name="maxCapacity" class="col-md-4" id="maxCapacity"
					required="required">
				</select>
			</div>

			<p>사용할 수 있는 침실은 몇개인가요?</p>

			<div class="form-group">
				<button type="button" class="btn btnCircle" id="bedroomDecrease">-</button>
				<input type="text" name="bedroom" id="bedroom" value="0"
					class="col-md-1" required="required" readonly>

				<button type="button" class="btn btn-default" id="bedroomIncrease">+</button>
			</div>
			<br>
			<p>사용할 수 있는 침대는 몇개인가요?</p>
			<br>
			<div class="form-group">
				<button type="button" class="btn btn-default" id="bedDecrease">-</button>
				<input type="text" name="bed" id="bed" value="0" class="col-md-1"
					required="required" readonly>
				<button type="button" class="btn btn-default" id="bedIncrease">+</button>
			</div>


			<p>사용할 수 있는 욕실은 몇개인가요?</p>
			<div class="form-group">
				<button type="button" class="btn btn-default" id="bathroomDecrease">-</button>
				<input type="text" name="bathroom" id="bathroom" value="0"
					required="required" class="col-md-1" readonly>
				<button type="button" class="btn btn-default" id="bathroomIncrease">+</button>
			</div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>



			<p>숙소의 위치를 알려주세요</p>
			<div class="form-group border-0">
				<button type="button" class="btn" id="btnLocation">주소 입력</button>
			</div>
			<div class="form-group border-0">
				<input type="text" class="form-control" name="location"
					id="roadFullAddr" required="required" readonly>
				<input type="text" id="local" name="local" required="required"
					readonly>
				<input type="hidden" id="entX">
				<input type="hidden" id="entY">
				<input type="hidden" id="wgsX" name="wgsX">
				<input type="hidden" id="wgsY" name="wgsY">

			</div>
			<div id="map" class="border-0" style="width: 500px; height: 400px;"></div>
			<div id="mapOption"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>

			<p>어떤 편의시설을 제공하나요?</p>
			<div class="">
				<div class="checkbox">
					<input type="checkbox" name="utilities" value="필수품목">
					침대 시트, 비누, 화장지, 베개
				</div>
				<div>
					<input type="checkbox" name="utilities" value="internet">
					무선인터넷
				</div>
				<div>
					<input type="checkbox" name="utilities" value="tv">
					TV
				</div>
				<div>
					<input type="checkbox" name="utilities" value="heating">
					난방
				</div>
				<div>
					<input type="checkbox" name="utilities" value="airconditioning">
					에어콘
				</div>
				<div>
					<input type="checkbox" name="utilities" value="shampoo">
					샴푸
				</div>
				<div>
					<input type="checkbox" name="utilities" value="Hair dryer">
					헤어 드라이어
				</div>
			</div>

			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>



			<div>게스트가 어떤 시설을 이용할 수 있나요?</div>
			<div>
				<input type="checkbox" name="spaces" value="주방">
				주방
			</div>
			<div>
				<input type="checkbox" name="spaces" value="세탁기">
				세탁기
			</div>
			<div>
				<input type="checkbox" name="spaces" value="건조기">
				건조기
			</div>
			<div>
				<input type="checkbox" name="spaces" value="주차">
				주차
			</div>
			<div>
				<input type="checkbox" name="spaces" value="헬스장">
				헬스장
			</div>

			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>

			<div id="class2">
				<h1>2단계 상세 정보 입력하기</h1>
			</div>

			<h1>최대 10개의 파일을 올려주세요</h1>
			<input type="file" name="files" multiple>

			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>


			<p>숙소의 제목을 입력해 주세요</p>
			<div class="form-group">
				<textarea name="title" class="form-control" required="required"></textarea>
			</div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>

			<p>게스트에게 숙소에 대해 설명해 주세요</p>
			<div class="form-group">
				<textarea name="info" class="form-control" required="required"></textarea>
			</div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>

			<hr>
			<div id="class3">
				<h1>3단계 게스트를 맞이할 준비를 해주세요</h1>
			</div>
			<div>게스트가 지켜야 할 숙소 이용규칙을 정하세요. 게스트는 예약하기 전에 숙소 이용규칙에 동의해야 합니다.</div>
			<div>
				어린이(2~12세) 숙박에 적합함
				<input type="checkbox" name="rules" value="어린이(2~12세) 숙박에 적합함">
			</div>
			<div>
				반려동물 동반에 적합함
				<input type="checkbox" name="rules" value="반려동물 동반에 적합함">
			</div>
			<div>
				흡연 가능
				<input type="checkbox" name="rules" value="흡연 가능">
			</div>
			<div>
				행사나 파티 허용
				<input type="checkbox" name="rules" value="행사나 파티 허용">
			</div>
			<div>체크인까지 최소한 어느정도 시간이 필요하세요?</div>
			<br> <select name="checkinInterval" id="checkinInterval"
				class="form-control" required="required">
			</select>
			<div>체크인 가능 시간을 선택해 주세요</div>
			<div class="form-group">
				<div class="form-group col-md-4">
					<label for="checkinTime">시작</label> <select name="checkinTime"
						id="checkinTime" required="required"></select>
				</div>

				<div class="form-group col-md-4">
					<label for="checkinTime">종료</label> <select name="checkoutTime"
						id="checkoutTime" required="required"></select>
				</div>
			</div>

			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<p>게스트가 얼마나 숙박할 수 있나요?</p>
			<input type="text" name="stayNight" required="required">
			박<br>
			<input type="text" name="stayDay" required="required">
			일<br>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>

			<p>예약 가능한 시간 정하기</p>
			최소
			<input type="date" name="bookableDateBegin" id="bookableDateBegin"
				min="sysdate" required="required">
			<br> 최대
			<input type="date" name="bookableDateEnd" id="bookableDateEnd"
				min="sysdate" required="required">
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>

			<p>숙소요금 설정하기</p>
			<input type="text" name="price" required="required">
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>
			<div class="form-group border-0"></div>

			<button class="btn" type="submit">등록하기</button>
		</form>
		<div class="col-md-2">
			<div id="floatMenu" class="form-control">
				<button class="btn">prev</button>
				<div data-target="#class1">1단계 기본 사항 입력</div>
				<div data-target="#class2">2단계 상세 정보 입력하기</div>
				<div data-target="#class3">3단계 게스트를 맞이할 준비</div>
			</div>

		</div>
	</div>
	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
    $(document).ready(function() {
    	$('#navbar').addClass("navbar-dark");
    	$('#navbar').addClass("bg-dark");
    	
    	
                $('#btnLocation').click(function() {
                            // 주소검색을 수행할 팝업 페이지를 호출합니다.
                            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
                            var pop = window
                                .open(
                                    "/homeshare/test/jusoPopup",
                                    "pop",
                                    "width=570,height=420, scrollbars=yes, resizable=yes");

                            $('#map').html(
                                    '<div id="mapClick" >클릭해서 주소를 확인해 주세요<input type="text" required="required"></div>'
                                    );
                            $('#mapClick').on('click',function() {
                                        console.log('mapClick click');

                                        /* 지도 그리기 */
                                        var entX = $(
                                                '#entX')
                                            .val() * 1; //ent x : grs80 좌표
                                        var entY = $(
                                                '#entY')
                                            .val() * 1; //entY : grs80 좌표

                                        /*proj4 좌표변환 라이브러리 */
                                        proj4.defs["EPSG:5179"] = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs"; //제공되는 좌표 

                                        var grs80 = proj4
                                            .Proj(proj4.defs["EPSG:5179"]);
                                        var wgs84 = proj4
                                            .Proj(proj4.defs["EPSG:4326"]); //경위도 

                                        var p = proj4.Point(entX,entY); // x,y가 바뀜 주의할것
                                        p = proj4.transform(grs80,wgs84,p);
                                        console
                                            .log(p.x +
                                                " " +
                                                p.y);
                                        /*end proj4 좌표변환 라이브러리 */

                                        var container = document
                                            .getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                                        var options = { //지도를 생성할 때 필요한 기본 옵션
                                            center: new kakao.maps.LatLng(
                                                p.y,
                                                p.x), //지도의 중심좌표.
                                            level: 3
                                            //지도의 레벨(확대, 축소 정도)
                                        };

                                        var map = new kakao.maps.Map(
                                            container,
                                            options); //지도 생성 및 객체 리턴
                                        /* 주소 저장하기*/
                                        $('#wgsX')
                                            .val(
                                                p.y);
                                        $('#wgsY')
                                            .val(
                                                p.x);

                                        $(
                                                '#mapOption')
                                            .append(
                                                '<div>선택한 주소가 맞습니까?<div>' +
                                                '<button id="mapYes">네 맞습니다. </button>' +
                                                '<button id="mapNo">아니오 주소지가 다릅니다. </button>');

                                        $('#mapYes').click(function() {
                                                    $('#mapOption').html('');
                                                    $('#mapClick').html('');
                                         });
                                        $('#mapNo').click(function() { //모두 초기화하기
                                            $('#mapOption').html('');
                                            $('#map').html('');
                                            $('#wgsX').val('');
                                            $('#wgsY').val('');
                                            $('#entX').val('');
                                            $('#entY').val('');
                                            $('#location').val('');
                                            $('#local').val('');

                                        });

                                    }); //end mapClick click

                        });

                /* 클릭시 이동*/
                $("#floatMenu div").click(
                    function() {
                        var scrollPosition = $(
                                $(this).attr("data-target"))
                            .offset().top;
                        console.log('scrollPosition : ' +
                            scrollPosition);
                        $("html").animate({
                            scrollTop: scrollPosition - 100
                        }, 500);
                    }); //end click

                var offset = $("#floatMenu").offset();
                var topPadding = 200;
                console.log('offset : ' + offset);
                $(window)
                    .scroll(
                        function() {
                            if ($(window).scrollTop() > offset.top) {
                                $("#floatMenu")
                                    .stop()
                                    .animate({
                                        marginTop: $(
                                                window)
                                            .scrollTop() -
                                            offset.top +
                                            topPadding
                                    });
                            } else {
                                $("#floatMenu").stop()
                                    .animate({
                                        marginTop: 0
                                    });
                            };
                        });

                /*end 스크롤 이동*/

                //max capacity 값 넣기
                for (var i = 1; i <= 15; i++) {
                    $('#maxCapacity').append(
                        '<option value="' + i + '">최대 ' + i +
                        '명 숙박가능</option>');
                }

                //checkinInterval 값 넣기
                $('#checkinInterval').append(
                    '<option value="0">당일</option>');
                for (var i = 1; i <= 7; i++) {
                    $('#checkinInterval').append(
                        '<option value="' + i + '">' + i +
                        ' 일</option>');
                }

                //체크인 시간 넣기
                $('#checkinTime').append(
                    '<option value="flexible">조절가능</option>');
                for (var i = 8; i <= 25; i++) {
                    if (i < 12) {
                        $('#checkinTime').append(
                            '<option value="' + i + '">오전' + i +
                            ' :00 </option>');
                    } else if (i == 12) {
                        $('#checkinTime')
                            .append(
                                '<option value="' + i + '">오후 12:00 </option>');
                    } else if (i > 12 && i < 25) {
                        $('#checkinTime').append(
                            '<option value="' + i + '">오후' +
                            (i - 12) +
                            ' :00 </option>');
                    } else {
                        $('#checkinTime')
                            .append(
                                '<option value="' + i + '">오전 1:00 </option>');
                    }

                }

                //체크아웃 시간 넣기
                $('#checkoutTime').append(
                    '<option value="flexible">조절가능</option>');
                for (var i = 8; i <= 25; i++) {
                    if (i < 12) {
                        $('#checkoutTime').append(
                            '<option value="' + i + '">오전' + i +
                            ' :00 </option>');
                    } else if (i == 12) {
                        $('#checkoutTime')
                            .append(
                                '<option value="' + i + '">오후 12:00 </option>');
                    } else if (i > 12 && i < 25) {
                        $('#checkoutTime').append(
                            '<option value="' + i + '">오후' +
                            (i - 12) +
                            ' :00 </option>');
                    } else {
                        $('#checkoutTime')
                            .append(
                                '<option value="' + i + '">오전 1:00 </option>');
                    }

                }

                /*bedroom 증감 */
                $('#bedroomIncrease').on(
                    'click',
                    function() {
                        console.log('increase click');
                        console.log('value : ' +
                            $('#bedroom').val() * 1);
                        $('#bedroom').val(
                            $('#bedroom').val() * 1 + 1);
                    }); //end bedroomIncrease

                $('#bedroomDecrease').on(
                    'click',
                    function() {
                        console.log('decrease click');
                        console.log('value : ' +
                            $('#bedroom').val() * 1);
                        $('#bedroom').val(
                            $('#bedroom').val() * 1 - 1);
                        if ($('#bedroom').val() * 1 < 0) {
                            $('#bedroom').val(0);
                        }
                    }); //end bedroomIncrease

                /*bed 증감 */
                $('#bedIncrease').on('click', function() {
                    console.log('increase click');
                    console.log('value : ' + $('#bed').val() * 1);
                    $('#bed').val($('#bed').val() * 1 + 1);
                }); //end bedroomIncrease

                $('#bedDecrease').on('click', function() {
                    console.log('decrease click');
                    console.log('value : ' + $('#bed').val() * 1);
                    $('#bed').val($('#bed').val() * 1 - 1);
                    if ($('#bed').val() * 1 < 0) {
                        $('#bed').val(0);
                    }
                }); //end bedroomIncrease

                /*욕실 증감 */
                $('#bathroomIncrease').on(
                    'click',
                    function() {
                        console.log('increase click');
                        console.log('value : ' +
                            $('#bathroom').val() * 1);
                        $('#bathroom').val(
                            $('#bathroom').val() * 1 + 1);
                    }); //end bedroomIncrease

                $('#bathroomDecrease').on(
                    'click',
                    function() {
                        console.log('decrease click');
                        console.log('value : ' +
                            $('#bathroom').val() * 1);
                        $('#bathroom').val(
                            $('#bathroom').val() * 1 - 1);
                        if ($('#bathroom').val() * 1 < 0) {
                            $('#bathroom').val(0);
                        }
                    }); //end bedroomIncrease

            }); //end document
</script>
</body>
</html>