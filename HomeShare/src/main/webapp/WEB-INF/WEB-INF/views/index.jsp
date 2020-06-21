<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<title>Sssoon Page</title>

<link href="/homeshare/resources/css/bootstrap.css" rel="stylesheet">
<link href="/homeshare/resources/css/coming-sssoon.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>

</head>

<body>
	<nav class="navbar navbar-transparent navbar-fixed-top"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a class="info-text" href="/homeshare/">Main</a></li>
					<li class="nav-item"><a class="info-text" data-toggle="modal"
							data-target="#SignUpModal">SignUp</a></li>
					<%@ include file="signup_modal.jspf"%>
					<li class="dropdown">
						<!-- 로그인 토글 --> <c:if test="${empty memId }">
							<a class="info-text" data-toggle="modal"
							data-target="#LoginModal">로그인</a>
							<!-- 로그인모달 폼 -->
							<%@ include file="login_modal.jspf"%>
							
						</c:if> 
						<c:if test="${not empty memId}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								MyPage <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">

								<li><a href="#" class="motto"> Account English(UK) </a></li>

								
								<li><a href="#">
										<img src="/homeshare/resources/images/flags/ES.png" />
										EspaÃ±ol
										<span class="label label-default">soon</span>
									</a></li>
									<li class="divider"></li>
							</ul>
						</c:if>
					</li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">
							<i class="fa fa-facebook-square"></i> Share
						</a></li>
					<li><a href="#">
							<i class="fa fa-twitter"></i> Tweet
						</a></li>
					<li><a href="#">
							<i class="fa fa-envelope-o"></i> Email
						</a></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="main" id="1"
		style="background-image: url('/homeshare/resources/images/default.jpg');">

		<!--    Change the image source '//homeshare/resources/images/default.jpg' with your favourite image.     -->

		<div class="cover black" data-color="black"></div>

		<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->

		<div class="container">
			<h1 class="logo cursive">homeShare</h1>
			<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->

			<div class="content">
				<h4 class="motto">Find the best Bootstrap 3 freebies and themes
					on the web.</h4>
				<div class="subscribe">
					<h5 class="info-text">어디로 여행가세요?</h5>
					<div class="row">
						<form action="" class="form-inline col-md-12">
							<input type="text">
							<input type="text">
							<input type="text">
							<input type="text">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="container">
			<a>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA>
			
			</a>
			
			</div>
		</div>
	</div>

	<div class="main" id="2"
		style="background-image: url('/homeshare/resources/images/about.jpg')">
		<div class="cover black" data-color="black"></div>
		<div class="container">
			<h1 class="logo cursive">About HomeShare</h1>
			<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->
			<div class="content">
				<div class="subscribe">
						<h4 class="info-text">편견과 소속감 이해하기</h4>
						<p class="info-text">무의식적 편견 훈련을 통해 차별을 철폐해 나갈 수 있습니다. 에어비앤비는 차별과 차별을 야기하는 편견에
							대해 회원님이 보다 잘 이해하실 수 있도록 이 자료실을 만들었습니다. 사람들이 자신도 인식하지 못하는 상태에서 어떻게
							편견과 기타 요인에 의해 의사 결정을 하는지를 연구한 내용입니다.</p>
						함께 만들어 나가는 홈셰어링의 미래
						<p class="info-text">Airbnb Citizen은 홈셰어링의 미래를 위해 전 세계 에어비앤비 호스트와 함께 협력을 펼치는
							곳입니다. 홈셰어링에 대해 배우고 이에 대한 지지를 표명할 수 있는 방법, 오피니언 리더의 아이디어, 홈셰어링의
							현황과 실천 방법 등을 공유하는 장소입니다.</p>
						게스트에게 편안함을 제공하고자 하는 호스트의 든든한 조력자
						<p class="info-text">에어비앤비에서의 경험이 보다 따뜻하고 모두를 포용할 수 있으려면 서로를 이해하고 받아들여야 합니다. 도움말
							센터를 방문하시면 에어비앤비 차별 금지 정책에 대한 유용한 질문과 답변을 확인하실 수 있습니다.</p>
						호스트를 위한 열린 공간
						<p class="info-text">커뮤니티 센터에서는 호스트들이 활발하게 이야기와 아이디어를 나누고 있습니다. 이렇게 활발한 활동이
							이루어지는 것을 보며 저희는 더욱 좋은 플랫폼을 만들어야겠다는 동기 부여를 받습니다. 호스트로서 게스트와 인간적인
							교감을 나누었던 에피소드를 공유하고 대화를 시작해 보세요.</p>
					</div>
				
			</div>
		</div>

	</div>
	
	
	
	<div class="main" id="3"
		style="background-image: url('/homeshare/resources/images/restaurant.jpg')">
		<div class="cover black" data-color="black"></div>
		<div class="footer footer-last">
			<div class="container">
				Made with <i class="fa fa-heart heart"></i> by
				<a href="http://www.creative-tim.com">Creative Tim</a>
				. Free download
				<a href="http://www.creative-tim.com/product/coming-sssoon-page">here.</a>
			</div>
		</div>
	</div>
	
</body>





<script src="/homeshare/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="/homeshare/resources/js/bootstrap.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	jQuery(document).on("ready", function() {
		jQuery(".main").each(function() {
			$('#1').show();
			$('#2').hide();
			$('#3').hide();
			var count=0;

			// 개별적으로 Wheel 이벤트 적용
			jQuery(this).on("mousewheel DOMMouseScroll", function(event) {

				var delta = 0;
				var moveTop = null;
				var mainMax = jQuery(".main").length - 1;

				var winEvent = "";

				if (!winEvent) {
					winEvent = window.event;
				}

				if (winEvent.wheelDelta) {

					delta = winEvent.wheelDelta / 150;
					if (window.opera) {
						delta = -delta;
					}
				}

				else if (winEvent.detail) {
					delta = -winEvent.detail / 3;
				}

				// 마우스휠을 위에서 아래로 이동
				if (delta < 0) {

					// 마지막 BOX 보다 순서값이 작은 경우에 실행
					if (jQuery(this).index() < mainMax ) {
						console.log("▼");
						if (jQuery(this).next() != undefined) {
							moveTop = jQuery(this).next().offset().top;
							console.log("111▼");
							count = count-1;
							console.log('count : ' + count );
							showEvent();
							if(count < -4){
								alert("마지막 페이지 입니다." + count);
								
								return false;
							} 
						}
						
					}

					
				}

				// 마우스휠을 아래에서 위로 이동
				else {

					// 첫번째 BOX 보다 순서값이 큰 경우에 실행
					if (jQuery(this).index() > 0) {
						console.log('jQuery(this).index() : ' + jQuery(this).index());
						console.log("▲");
						if (jQuery(this).prev() != undefined) {
							moveTop = jQuery(this).prev().offset().top;
							count++;
							console.log('count : ' + count );
							showEvent();
						}
					}
					// 첫번째 BOX 더 위로 올라가려고 하는 경우 알림창 출력
					else {
						alert("첫번째 페이지 입니다.");
						return false;
					}
				}

				// 화면 이동 0.8초(800)
				jQuery("html,body").stop().animate({
					scrollTop : moveTop + "px"
				}, {
					duration : 800,
					complete : function() {
					}
				});
			}); //end mousewheel
			
			function showEvent(){
				if(count >0){
					$('#1').show();
					$('#2').hide();
					$('#3').hide();
					console.log('evnet1 실행');
				}
				if(count <-1  && count >= -2){
					$('#1').hide();
					$('#2').show();
					$('#3').hide();
					console.log('evnet2 실행');
				}
				if(count <-3){
					$('#1').hide();
					$('#2').hide();
					$('#3').show();
					console.log('evnet3 실행');
				}
			}
			
		});
	});
</script>
</html>