<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${memId }님, 환영합니다.
	<br>
	<c:if test="${not empty mem_id }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button" method="post"></button>
	</c:if>
	<!-- 헤더바 -->
	<header>

		<div id="main-button">
			<a href="/homeshare/">go main</a>
		</div>

		<div id="login-botton">
			<c:if test="${empty memId }">
				<a href="member/login">
					<input type="button" value="로그인">
				</a>
			</c:if>
			<c:if test="${not empty memId }">
				<a href="member/logout">
					<input type="button" value="로그아웃">
				</a>
			</c:if>
		</div>


	</header>


	<footer id="doz_footer_wrap">
		<div id="doz_footer">
			<div class="footer-section footer-type03 _footer_font_preview">
				<div class="inside">
					<div class="footer-wrap">
						<div class="foot-custom">
							<div class="custom-text _footer_text">
								<div class="site-brand _site_name" style="">pisca pisca:
									피스카피스카</div>
								<div class="custom-text-info _text_editor"></div>
							</div>
							<div class="copryright-area _copy_menu" style="">Copyright
								ⓒ pisca pisca: 피스카피스카</div>
						</div>
						<div class="foot-main-nav _main_menu_wrap" style="">
							<ul class="nav nav-stacked footer-all-nav">


								<li class="_show_m201909236812f5bf5a893 " style=""><a
										href="/ABOUT" class="_fade_link _txt_m201909236812f5bf5a893 "
										data-url="ABOUT">
										<span class="plain_name" data-hover="">ABOUT</span>
									</a></li>

								<li class="_show_m2019092342d0bb289c6aa " style=""><a
										href="/shop" class="_fade_link _txt_m2019092342d0bb289c6aa "
										data-url="shop">
										<span class="plain_name" data-hover="">SHOP</span>
									</a></li>

								<li class="_show_m20190923392516044e8b4 " style=""><a
										href="/community"
										class="_fade_link _txt_m20190923392516044e8b4 "
										data-url="community">
										<span class="plain_name" data-hover="">COMMUNITY</span>
									</a></li>

								<li class="_show_m2019092396fc7e673f59d " style=""><a
										href="/contact"
										class="_fade_link _txt_m2019092396fc7e673f59d "
										data-url="contact">
										<span class="plain_name" data-hover="">CONTACT</span>
									</a></li>

							</ul>
						</div>
						<div class="foot-foot-nav _footer_menu_wrap" style="">
							<ul class="nav nav-stacked footer-all-nav">
								<div class="_footer_menu" style=""></div>
								<div class="_policy_menu" style="">
									<li class="_use_policy_menu"><a href="/?mode=policy"
											onclick="SITE.openPolicy(); return false;">이용약관</a></li>
									<li class="_use_policy_menu" style="font-weight: bold"><a
											href="/?mode=privacy"
											onclick="SITE.openPrivacy();return false;">개인정보처리방침</a></li>
								</div>
								<div class="_tour_policy_menu" style="display: none;"></div>
							</ul>
						</div>
						<div class="foot-sociallink _sns_link" style="">
							<div class="btn-group _sns_link_list" role="group">
								<a type="button" class="btn pull-right _0517os1D68 "
									href="https://www.instagram.com/piscapisca.shop" style=""
									target="_blank">
									<i aria-hidden="true" class="fa fa-instagram"></i>
									<span class="sr-only">SNS 바로가기</span>
								</a>
							</div>
						</div>
					</div>
					<div class="foot-app-menu _app_menu clearfix"
						style="display: none;"></div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>