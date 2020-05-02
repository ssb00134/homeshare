<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body
	class="doz_sys  _body_menu_m20190923404f1ba08b9b9  new_header_overlay  shopping  new_header_site   new_fixed_header_disable fixed-menu-on"
	style="" id="doz_body">
	<!--[if lt IE 9]>
<div class="browsehappy">오래된 브라우저를 사용하고 있군요. 안전하고 편리한 인터넷을 위해 <a href="http://browsehappy.com/" target="_blank">브라우저를 업그레이드</a> 하세요.</div>
<style>
	.browsehappy {
		vertical-align: middle;
		text-align: center;
		padding: 4px 0;
		font-size: 13p
		background: #fb4637;
		color: #fff;
	}
	.browsehappy > a {
		color: #fff;
		text-decoration: underline;
	}
</style>
<![endif]-->






	<div id="site_alarm_slidemenu_container"
		class="notification-canvas-container">
		<div class="notification-canvas-backdrop"
			id="site_alarm_slidemenu_backdrop" style="display: none"></div>
		<div id="site_alarm_slidemenu"
			class="notification-canvas alarm-pane alarm_slide" style="">

			<div class="tse-scrollable _scroll_wrap">
				<div class="tse-content tab-content _is_tse_content"
					style="padding-top: 60px;">
					<div class="site-alarm-head _alarm_header">
						<header id="site_alarm_title">알림</header>
						<a href="javascript:;" class="btn btn-flat goback "
							onclick="ALARM_MENU.showAlarmSlide();"><i
							class="btm bt-arrow-left" aria-hidden="true"></i><span
							class="sr-only">뒤로</span></a>
					</div>
					<div class="site-alarm-head _setting_header" style="display: none">
						<header id="site_alarm_title_setting">알림 설정</header>
						<a href="javascript:;" class="btn btn-flat goback "
							onclick="ALARM_MENU.toggleAlarmSetting();"><i
							class="btm bt-arrow-left" aria-hidden="true"></i><span
							class="sr-only">뒤로</span></a>
					</div>
					<div id="site_alarm_list_wrap" class="site_alarm_list_wrap">
						<!--알림 리스트-->

						<div id="site_alarm_tab" class="notify-body"></div>

						<div id="site_alarm_more_btn" class="notify-body"
							style="display: none;">
							<a class="tile more" href="javascript:;"
								onclick="ALARM_MENU.getHeaderAlarmList()">
								<div class="tile-content">더보기</div>
							</a>
						</div>

					</div>
					<div id="site_alarm_setting_wrap" style="display: none;"
						class="site_alarm_setting_wrap">

						<div class="offcanvas-block alarm-setting">
							<div class="_scroll_wrap" id="site_alarm_menu_tap_wrap">
								<div class="tab-content">
									<div class="tab-pane active">
										<div class="notify-body">
											<a href="javascript:;" class="board-alaram tile">게시물 알림</a> <a
												class="tile" href="javascript:;"
												onclick="ALARM_MENU.changeAlarmSetting($(this),'','my_post')">
												<div class="tile-content">
													<div class="tile-text">
														내 글 반응
														<div class="text-sm text-gray-bright">내가 작성한 게시물이나
															댓글에 다른 사람이 댓글이나 답글을 작성하면 알려줍니다.</div>
														<div class="check ">
															<div class="checkbox checkbox-styled">
																<label> <input title="내 글 반응" type="checkbox"
																		value="ok"><span></span>
																</label>
															</div>
														</div>
													</div>
												</div>
											</a> <a class="tile" href="javascript:;"
												onclick="ALARM_MENU.changeAlarmSetting($(this),'','notice')">
												<div class="tile-content">
													<div class="tile-text">
														공지사항
														<div class="text-sm text-gray-bright">사이트에서 보내는 중요한
															공지를 실시간으로 알려줍니다.</div>
														<div class="check">
															<div class="checkbox checkbox-styled">
																<label> <input title="공지사항" type="checkbox"
																		value="ok"><span></span>
																</label>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="site-alarm-body">

				<!--//알림 리스트-->
				<!--알림 설정-->

			</div>
		</div>
	</div>
	<!-- end#offcanvas-help -->
	<div id="pc_slide_menu_wrap" class="pc_slide_menu_container"
		style="width: 0; visibility: hidden; display: none">
		<div id="pc_slide_menu" class="pc_slide_menu slide_menu _slide_menu">
			<button type="button" class="pc-navbar-toggle"
				onclick="PC_SLIDE_MENU.slideNavToggle();">
				<i class="btm bt-times"></i>
			</button>
			<div class="pc_slide_menu_logo">
				<a href="/"><img alt="pisca pisca: 피스카피스카"
					src="https://cdn.imweb.me/upload/S201909233ec3d6762dffd/a72a8ca48ed7c.gif"></a>

			</div>
			<ul class="nav navbar-nav">
				<div class="viewport-nav pc _menu_wrap" style="position: relative">


					<li style="" class="depth-01   "><a class=" _fade_link "
						href="/ABOUT" data-url="ABOUT" data-has_child="N"
						data-is_folder_menu="N"> <span class="plain_name"
							data-hover="">ABOUT</span>
					</a></li>

					<li style="" class="depth-01   "><a class=" _fade_link "
						href="/shop" data-url="shop" data-has_child="Y"
						data-is_folder_menu="N"> <span class="plain_name"
							data-hover="">SHOP</span>
					</a></li>

					<li style="" class="depth-01   "><a class=" _fade_link "
						href="/community" data-url="community" data-has_child="Y"
						data-is_folder_menu="N"> <span class="plain_name"
							data-hover="">COMMUNITY</span>
					</a></li>

					<li style="" class="depth-01   "><a class=" _fade_link "
						href="/contact" data-url="contact" data-has_child="N"
						data-is_folder_menu="N"> <span class="plain_name"
							data-hover="">CONTACT</span>
					</a></li>


				</div>
			</ul>

		</div>
	</div>

	<style>
@import url("//vendor-cdn.imweb.me/css/droidserif.css");

@import url("//vendor-cdn.imweb.me/css/droidserif.css");

.pc_slide_menu_container {
	position: fixed;
	top: 0;
	bottom: 0;
	overflow-y: auto;
	overflow-x: hidden;
	width: 0;
	right: 0;
	z-index: 9999;
	visibility: visible !important;
	display: block !important;
}

.pc_slide_menu_container .pc_slide_menu_title a {
	font-family: Droid Serif;
	font-size: 28px;
	color: #3d3d3d;
	word-wrap: break-word;
	letter-spacing: 0px;
	font-weight: bold;
	font-style:;
}

.pc_slide_menu_container .slide_menu_backdrop {
	background: #000;
	opacity: .5;
	position: fixed;
	top: 0;
	right: 0;
	width: 100%;
	height: 100%;
	z-index: 1100;
}

.pc_slide_menu_container .pc-navbar-toggle {
	font-size: 16px;
	position: absolute;
	right: 0;
	top: 0;
	padding: 9px 15px;
	margin-top: 8px;
	margin-bottom: 8px;
	background-color: transparent;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #3d3d3d;
}

.pc_slide_menu_container .pc-navbar-toggle:hover {
	color: rgba(52, 30, 6, 0.4);;
}

.pc_slide_menu_container .pc_slide_menu {
	min-width: 0;
	width: 300px;
	position: absolute;
	top: 0;
	bottom: 0;
	left: -300px;
	background: #f5f3f2;
	z-index: 9999;
	padding: 40px 0 0 0;
}

.pc_slide_menu_container .pc_slide_menu.animation {
	transition: transform 300ms ease 0s;
	transform: translate3d(0px, 0px, 0px);
}

.pc_slide_menu_container.slide_open .pc_slide_menu {
	transform: translate3d(300px, 0px, 0px);
	overflow-y: auto;
}

.pc_slide_menu_container.right-slide .pc_slide_menu {
	left: auto;
	right: -300px;
}

.pc_slide_menu_container.right-slide .pc_slide_menu.animation {
	transition: transform 300ms ease 0s;
	transform: translate3d(0px, 0px, 0px);
}

.pc_slide_menu_container.right-slide.slide_open .pc_slide_menu {
	transform: translate3d(-300px, 0px, 0px);
}

.pc_slide_menu_container .pc_slide_menu_logo {
	text-align: center;
	margin: 10px 0;
	padding: 0 24px;
}

.pc_slide_menu_container .pc_slide_menu_logo img {
	display: inline-block;
	max-width: 100%;
	height: 30px;
	margin-bottom: 6px;
	image-rendering: -webkit-optimize-contrast;
}

.pc_slide_menu_container .nav.navbar-nav {
	float: none;
	text-align: center;
	padding: 0 24px;
}

.pc_slide_menu .viewport-nav li.use_sub_name:hover>a>.plain_name:before
	{
	color: rgba(52, 30, 6, 0.4);
	text-align: center;
}

.pc_slide_menu_container .nav.navbar-nav:before {
	content: '';
	display: inline-block !important;
	vertical-align: top;
}

.pc_slide_menu_container .nav.navbar-nav .viewport-nav {
	max-width: 100%;
	max-height: 100%;
	display: inline-block;
	vertical-align: middle;
}

.pc_slide_menu_container .viewport-nav li>a {
	font-family: Droid Serif, Apple SD Gothic Neo, Malgun Gothic,
		Nanum Gothic, sans-serif, serif, Arial;
	font-size: 14px;
	letter-spacing: 1px;
	color: #3d3d3d;
	padding: 15px 0;
	display: inline-block;
}

.pc_slide_menu_container .viewport-nav li {
	
}

.pc_slide_menu_container .viewport-nav li:first-child {
	margin-top: 0;
}

.pc_slide_menu_container .viewport-nav li>a:hover {
	color: rgba(52, 30, 6, 0.4);
}

.pc_slide_menu_container .pc_slide_menu {
	border-right: 1px solidrgba(56, 56, 56, 0.52);
}

.pc_slide_menu_container .viewport-nav li.active>a {
	color: #3d3d3d;
}
</style>
	<div id="mobile_slide_menu_wrap" class="mobile_slide_menu_container">
		<div id="mobile_slide_menu"
			class="mobile_slide_menu slide_menu _slide_menu">
			<ul class="nav navbar-nav navbar-right">

				<div class="viewport-nav mobile _menu_wrap "
					style="position: relative">
					<!-- 모바일 메뉴서랍내 프로필 -->
					<input type="hidden" value="/common/img/app_login.png"
						id="imagepath">
					<div class="profile-area">
						<a href="/login?back_url=Lw%3D%3D&amp;used_login_btn=Y"
							class="btn nav-btn-icon profile no-padding btn-flat"> <img
							src="https://vendor-cdn.imweb.me/images/default_profile.png"
							alt="">
							<div class="member-info guest">로그인이 필요합니다.</div>
						</a>
						<div class="btn-group"></div>
					</div>



					<li style="" class="depth-01 "><a href="/ABOUT"
						data-url="ABOUT" data-has_child="N" data-is_folder_menu="N"
						class=" " onclick=""> <span class="plain_name" data-hover="">ABOUT</span>
							<span class="_toggle_btn toggle-btn"></span>
					</a></li>

					<li style="" class="depth-01 "><a href="/shop" data-url="shop"
						data-has_child="Y" data-is_folder_menu="N" class="has_child"
						onclick=""> <span class="plain_name" data-hover="">SHOP</span>
							<span class="_toggle_btn toggle-btn"></span>
					</a>

						<ul data-index="2" style="height: 0px;">

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="24" data-has_child="N" data-is_folder_menu="N"
								href="/24" class=" " onclick=""> <span class="plain_name"
									data-hover="">Living</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="25" data-has_child="N" data-is_folder_menu="N"
								href="/25" class=" " onclick=""> <span class="plain_name"
									data-hover="">Cushion</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="26" data-has_child="N" data-is_folder_menu="N"
								href="/26" class=" " onclick=""> <span class="plain_name"
									data-hover="">Kitchen&amp;Table</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="705508823" data-has_child="N" data-is_folder_menu="N"
								href="/705508823" class=" " onclick=""> <span
									class="plain_name" data-hover="">Pisca made</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="29" data-has_child="N" data-is_folder_menu="N"
								href="/29" class=" " onclick=""> <span class="plain_name"
									data-hover="">Holiday</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="27" data-has_child="N" data-is_folder_menu="N"
								href="/27" class=" " onclick=""> <span class="plain_name"
									data-hover="">Insert(솜류)</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="28" data-has_child="N" data-is_folder_menu="N"
								href="/28" class=" " onclick=""> <span class="plain_name"
									data-hover="">Personal</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

						</ul></li>

					<li style="" class="depth-01 "><a href="/community"
						data-url="community" data-has_child="Y" data-is_folder_menu="N"
						class="has_child" onclick=""> <span class="plain_name"
							data-hover="">COMMUNITY</span> <span
							class="_toggle_btn toggle-btn"></span>
					</a>

						<ul data-index="10" style="height: 0px;">

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="notice" data-has_child="N" data-is_folder_menu="N"
								href="/notice" class=" " onclick=""> <span
									class="plain_name" data-hover="">NOTICE</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="qna" data-has_child="N" data-is_folder_menu="N"
								href="/qna" class=" " onclick=""> <span class="plain_name"
									data-hover="">Q&amp;A</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

							<li class="depth-02 " style=""><a tabindex="-1"
								data-url="review" data-has_child="N" data-is_folder_menu="N"
								href="/review" class=" " onclick=""> <span
									class="plain_name" data-hover="">REVIEW</span> <span
									class="_toggle_btn toggle-btn"></span>
							</a></li>

						</ul></li>

					<li style="" class="depth-01 "><a href="/contact"
						data-url="contact" data-has_child="N" data-is_folder_menu="N"
						class=" " onclick=""> <span class="plain_name" data-hover="">CONTACT</span>
							<span class="_toggle_btn toggle-btn"></span>
					</a></li>


				</div>
			</ul>
		</div>
		<button type="button" class="navbar-toggle close slide-close"
			onclick="MOBILE_SLIDE_MENU.slideNavToggle();">
			<i class="btm bt-times" aria-hidden="true"></i><span class="sr-only">닫기</span>
		</button>

	</div>
	<ul class="dropdown-menu animation-dock member_profile"
		id="member_profile">
		<li class="dropdown-profile text-center"><a href="javascript:;"
			class="nav-btn-icon profile alarm-toggle _show_alarm"
			onclick="ALARM_MENU.showAlarmSlide();" id="slide-alarm"
			style="right: 0; position: absolute; right: 0; top: 0; font-size: 20px; padding: 20px;"><i
				class="icon-bell"></i><span class="sr-only">Alarm</span></a> <span
			class="profile-info">
				<div onclick="SITE_MEMBER.editProfile()">
					<img src="/common/img/default_profile.png"
						class="img-circle dropdown-avatar-big _profile_img" alt="프로필 이미지">
				</div>
				<div class="sm-padding no-padding-bottom"></div>
		</span></li>
		<li class="profile-footer btn-group-justified"><a
			href="/login?back_url=L3Nob3BfbXlwYWdl&amp;type=mypage"
			class="btn btn-flat">마이페이지</a> <a href="/logout.cm?back_url=Lw%3D%3D"
			class="btn btn-flat right">로그아웃</a></li>
	</ul>
	<header id="doz_header_wrap">
		<div id="doz_header" data-newheader="Y">
			<div class="new_org_header _new_org_header">
				<div id="inline_header_normal" style="min-height: 30px;" class="">
					<div data-type="section-wrap"
						class="extend  inline-section-wrap fixed_transform"
						id="s20190923c98f8cff74df3">
						<div
							class="section_bg _section_bg fixed_transform _interactive_bg  "></div>
						<div class="section_bg_color _section_bg_color fixed_transform"
							style="background-color: #2f2f2f; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
						<div data-type="inside" class="inline-inside _inline-inside">
							<div data-type="section" class="inline-section"
								section-code="s20190923c98f8cff74df3">
								<div data-type="col-group" data-col-group="center"
									class="inline-col-group inline-col-group-center">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w20190923d6a20fdb6ea21"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_text">


												<div doz_type="text"
													class="widget inline_widget _text_wrap widget_text_wrap fr-view   default_padding "
													id="text_w20190923d6a20fdb6ea21">
													<div class="text-table _text_table">
														<div class="text-table-cell fixed_transform _text_preview">
															<h6>
																<span style="font-size: 12px;"><strong>small
																		things. collect. select.</strong></span>
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-type="section-wrap"
						class="extend  inline-section-wrap fixed_transform _fixed_header_section"
						id="s20190923d21cb33567e11">
						<div
							class="section_bg _section_bg fixed_transform _interactive_bg  "></div>
						<div class="section_bg_color _section_bg_color fixed_transform"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
						<div data-type="inside" class="inline-inside _inline-inside">
							<div data-type="section" class="inline-section"
								section-code="s20190923d21cb33567e11">
								<div data-type="col-group" data-col-group="left"
									class="inline-col-group inline-col-group-left"
									style="width: 341px;"></div>
								<div data-type="col-group" data-col-group="center"
									class="inline-col-group inline-col-group-center">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w20190923e44842005e4c8"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_logo">
												<div class="widget inline_widget logo  text_inline"
													id="logo_w20190923e44842005e4c8">
													<div class="img_box _img_box" style="position: relative;">
														<a class="" href="/"><span class="sr-only">사이트
																로고</span> <img class="normal_logo _front_img"
															src="https://cdn.imweb.me/thumbnail/20200222/b0a0a3190a4f6.gif"
															alt="pisca pisca: 피스카피스카" width="527.215189873"
															style="max-width: 100%; height: auto; image-rendering: -webkit-optimize-contrast;">
															<img class="scroll_logo fixed_transform"
															src="https://cdn.imweb.me/thumbnail/20200222/b0a0a3190a4f6.gif"
															alt="pisca pisca: 피스카피스카" width="527.215189873"
															style="max-width: 100%; height: auto; image-rendering: -webkit-optimize-contrast;">
														</a>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
								<div data-type="col-group" data-col-group="right"
									class="inline-col-group inline-col-group-right"
									style="width: 341px;">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w20190923969a135a6c08d"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_login_btn">
												<div
													class="widget inline_widget login_btn button  button_text txt_l text-xx-small">
													<div>
														<div class="inline-blocked login_btn_item ">
															<a
																class="_fade_link   btn_text btn_7W03M66140   btn_custom "
																href="/login?back_url=Lw%3D%3D&amp;used_login_btn=Y"
																style="border-radius: 0px;"><span
																class="text fixed_transform ">LOGIN</span></a>
														</div>
														<div class="inline-blocked login_btn_item ">
															<a
																class="_fade_link   btn_text btn_4u2M0f66VO   btn_custom "
																href="/site_join_type_choice?back_url=Lw%3D%3D"
																style="border-radius: 0px;"><span
																class="text fixed_transform ">JOIN</span></a>
														</div>
														<div class="inline-blocked login_btn_item ">
															<a
																class="_fade_link   btn_text btn_8KVFEN6SU6   btn_custom "
																href="/shop_cart" style="border-radius: 0px;"><span
																class="sr-only">로그인 위젯 문구</span><span
																class="icon_class "><i
																	class="fixed_transform simple icon-handbag"
																	aria-hidden="true"></i></span><span
																class="text fixed_transform no_text"></span><span
																class="badge_wrap"><sup
																	class="badge _shop_cart_badge_cnt_wrap"
																	style="top: auto; bottom: -5px; right: -5px"></sup></span></a>
														</div>
													</div>
												</div>





											</div>
										</div>
									</div>
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w201909239f9930505325c"
											class="inline-widget">
											<div class="_widget_data"
												data-widget-type="inline_search_btn">

												<div class="widget inline_widget search_btn">
													<div class="search_type fixed_transform search_btn_type01">
														<div class="inline-blocked holder ">
															<form class=" icon_on" action="/search" method="get"
																id="inline_s_form_w201909239f9930505325c">
																<input class="search_btn_form" name="keyword"
																	style="display: none" placeholder="Search" value=""
																	title="site search">
																<a class="fixed_transform inline-blocked " href="#"
																	onclick="SITE_SEARCH.openSearch(search_option_data_w201909239f9930505325c);"><i
																	class="simple icon-magnifier"></i><span class="sr-only">site
																		search</span></a>
															</form>
														</div>
													</div>
												</div>






											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div></div>
					<div data-type="section-wrap"
						class="extend  inline-section-wrap fixed_transform _fixed_header_section"
						id="s20190923a4d26f1ce9d9a">
						<div
							class="section_bg _section_bg fixed_transform _interactive_bg  "></div>
						<div class="section_bg_color _section_bg_color fixed_transform"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
						<div data-type="inside" class="inline-inside _inline-inside">
							<div data-type="section" class="inline-section"
								section-code="s20190923a4d26f1ce9d9a">
								<div data-type="col-group" data-col-group="left"
									class="inline-col-group inline-col-group-left"
									style="width: 81px;">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w20190923607cd98b33b49"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_menu_btn">
												<div class="widget inline_widget icon_type_menu st00">
													<a href="javascript:;"
														class="_no_hover fixed_transform inline-blocked"
														onclick=""> <span
														class="holder icon_code simple icon-menu"
														id="inline_menu_alarm_badge"></span> <span class="text">MENU</span>
													</a>
												</div>








											</div>
										</div>
									</div>
								</div>
								<div data-type="col-group" data-col-group="center"
									class="inline-col-group inline-col-group-center"
									style="visibility: visible;">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w2019092331b03116111c6"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_menu">
												<ul
													class="nav navbar-nav _inline_menu_container sub_mega_drop"
													style="visibility: visible;">
													<div class="viewport-nav desktop _main_menu">
														<li class="dropdown _more_menu"><a
															data-toggle="dropdown"
															class="fixed_transform dropdown-toggle disabled dropdown-more _header_dropdown"
															aria-expanded="false"><i
																class="icon-options vertical-middle" aria-hidden="true"></i></a>
														<ul class="dropdown-menu more_list _more_list"></ul></li>
													</div>
													<div
														style="position: absolute; top: -9999px; left: -9999px;">
														<div
															class="viewport-nav desktop _main_clone_menu main_clone_menu">


															<li class="dropdown _show_m201909236812f5bf5a893"
																style="" id="dropdown_m201909236812f5bf5a893"
																data-code="m201909236812f5bf5a893"><a href="/ABOUT"
																class="fixed_transform dropdown-toggle disabled _header_dropdown   _fade_link "
																data-url="ABOUT" data-toggle="dropdown"> <span
																	class="_txt_m201909236812f5bf5a893 plain_name"
																	data-hover="">ABOUT</span>
															</a></li>

															<li class="dropdown _show_m2019092342d0bb289c6aa"
																style="" id="dropdown_m2019092342d0bb289c6aa"
																data-code="m2019092342d0bb289c6aa"><a href="/shop"
																class="fixed_transform dropdown-toggle disabled _header_dropdown   _fade_link "
																data-url="shop" data-toggle="dropdown"> <span
																	class="_txt_m2019092342d0bb289c6aa plain_name"
																	data-hover="">SHOP</span>
															</a></li>

															<li
																class="dropdown _show_m20190923392516044e8b4 pulldown-hide"
																style="" id="dropdown_m20190923392516044e8b4"
																data-code="m20190923392516044e8b4"><a
																href="/community"
																class="fixed_transform dropdown-toggle disabled _header_dropdown   _fade_link "
																data-url="community" data-toggle="dropdown"
																aria-expanded="false"> <span
																	class="_txt_m20190923392516044e8b4 plain_name"
																	data-hover="">COMMUNITY</span>
															</a></li>

															<li class="dropdown _show_m2019092396fc7e673f59d"
																style="" id="dropdown_m2019092396fc7e673f59d"
																data-code="m2019092396fc7e673f59d"><a
																href="/contact"
																class="fixed_transform dropdown-toggle disabled _header_dropdown   _fade_link "
																data-url="contact" data-toggle="dropdown"
																aria-expanded="false"> <span
																	class="_txt_m2019092396fc7e673f59d plain_name"
																	data-hover="">CONTACT</span>
															</a></li>

														</div>
													</div>
													<div
														style="position: absolute; top: -9999px; left: -9999px;">
														<div class="viewport-nav desktop main_clone_menu">
															<li class="dropdown _more_menu"><a
																data-toggle="dropdown"
																class="fixed_transform dropdown-toggle disabled dropdown-more _header_dropdown"
																aria-expanded="false"><i
																	class="icon-options vertical-middle" aria-hidden="true"></i></a>
															<ul class="dropdown-menu more_list _more_list"></ul></li>
														</div>
													</div>
												</ul>



												<!-- 템플릿별 레이아웃 구조 -->
												<!-- 템플릿별 레이아웃 구조 -->




											</div>
										</div>
									</div>
								</div>
								<div data-type="col-group" data-col-group="right"
									class="inline-col-group inline-col-group-right"
									style="width: 81px;"></div>
							</div>
						</div>
						<div id="dropdown_w20190923607cd98b33b49"
							class=" text-center _mega_dropdown_container_w20190923607cd98b33b49 "
							style="display: none; top: 44.6px;"
							data-widget-type="inline_menu_btn">
							<div class="clearfix mega_dropdown_wrap _mega_dropdown_wrap">
								<div class="tse-scrollable _tse_scrollable">
									<div class="tse-scrollbar" style="display: none;">
										<div class="drag-handle"></div>
									</div>
									<div class="tse-scroll-content"
										style="width: 100px; height: 100px;">
										<div class="tse-content">
											<div class="inline-blocked" style="max-width: 2320px;">
												<div class="mega_dropdown clearfix _mega_dropdown_sync"
													style="visibility: visible;">


													<div class="title_menu _item  clear-both"
														data-code="m201909236812f5bf5a893" style="">
														<a href="/ABOUT" class=" _title_anchor  _fade_link "
															data-url="ABOUT"> <span
															class="_txt_m201909236812f5bf5a893 _title_txt plain_name"
															data-hover="">ABOUT</span>
														</a>

													</div>

													<div class="title_menu _item"
														data-code="m2019092342d0bb289c6aa" style="">
														<a href="/shop" class=" _title_anchor  _fade_link "
															data-url="shop"> <span
															class="_txt_m2019092342d0bb289c6aa _title_txt plain_name"
															data-hover="">SHOP</span>
														</a>

														<ul class="sub_menu">

															<li class="" style=""><a tabindex="-1" href="/24"
																data-url="24"
																class="_fade_link _txt_m2019092309df0cbab7b78 "><span
																	class="plain_name" data-hover="">Living</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/25"
																data-url="25"
																class="_fade_link _txt_m201909234a9fd6b4958fa "><span
																	class="plain_name" data-hover="">Cushion</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/26"
																data-url="26"
																class="_fade_link _txt_m2019121193639a471d0ab "><span
																	class="plain_name" data-hover="">Kitchen&amp;Table</span></a>
															</li>

															<li class="" style=""><a tabindex="-1"
																href="/705508823" data-url="705508823"
																class="_fade_link _txt_m20190923e688c496f906f "><span
																	class="plain_name" data-hover="">Pisca made</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/29"
																data-url="29"
																class="_fade_link _txt_m201912119ed1ab0683a2c "><span
																	class="plain_name" data-hover="">Holiday</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/27"
																data-url="27"
																class="_fade_link _txt_m20190925a3fd52987eb7a "><span
																	class="plain_name" data-hover="">Insert(솜류)</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/28"
																data-url="28"
																class="_fade_link _txt_m20191007047a4395b99fc "><span
																	class="plain_name" data-hover="">Personal</span></a></li>

														</ul>

													</div>

													<div class="title_menu _item"
														data-code="m20190923392516044e8b4" style="">
														<a href="/community" class=" _title_anchor  _fade_link "
															data-url="community"> <span
															class="_txt_m20190923392516044e8b4 _title_txt plain_name"
															data-hover="">COMMUNITY</span>
														</a>

														<ul class="sub_menu">

															<li class="" style=""><a tabindex="-1"
																href="/notice" data-url="notice"
																class="_fade_link _txt_m20190923b075cfc921ccf "><span
																	class="plain_name" data-hover="">NOTICE</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/qna"
																data-url="qna"
																class="_fade_link _txt_m201909236072d89938f37 "><span
																	class="plain_name" data-hover="">Q&amp;A</span></a></li>

															<li class="" style=""><a tabindex="-1"
																href="/review" data-url="review"
																class="_fade_link _txt_m201909233724d657abc1d "><span
																	class="plain_name" data-hover="">REVIEW</span></a></li>

														</ul>

													</div>

													<div class="title_menu _item"
														data-code="m2019092396fc7e673f59d" style="">
														<a href="/contact" class=" _title_anchor  _fade_link "
															data-url="contact"> <span
															class="_txt_m2019092396fc7e673f59d _title_txt plain_name"
															data-hover="">CONTACT</span>
														</a>

													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="dropdown_w2019092331b03116111c6"
							class=" text-center _mega_dropdown_container_w2019092331b03116111c6 "
							style="top: 50px; display: none;" data-widget-type="inline_menu">
							<div class="clearfix mega_dropdown_wrap _mega_dropdown_wrap">
								<div class="tse-scrollable _tse_scrollable">
									<div class="tse-scrollbar" style="display: none;">
										<div class="drag-handle"></div>
									</div>
									<div class="tse-scroll-content"
										style="width: 100px; height: 100px;">
										<div class="tse-content">
											<div class="inline-blocked" style="max-width: 2320px;">
												<div class="mega_dropdown clearfix _mega_dropdown_sync"
													style="visibility: visible;">


													<div class="title_menu _item  clear-both"
														data-code="m201909236812f5bf5a893" style="">
														<a href="/ABOUT" class=" _title_anchor  _fade_link "
															data-url="ABOUT"> <span
															class="_txt_m201909236812f5bf5a893 _title_txt plain_name"
															data-hover="">ABOUT</span>
														</a>

													</div>

													<div class="title_menu _item"
														data-code="m2019092342d0bb289c6aa" style="">
														<a href="/shop" class=" _title_anchor  _fade_link "
															data-url="shop"> <span
															class="_txt_m2019092342d0bb289c6aa _title_txt plain_name"
															data-hover="">SHOP</span>
														</a>

														<ul class="sub_menu">

															<li class="" style=""><a tabindex="-1" href="/24"
																data-url="24"
																class="_fade_link _txt_m2019092309df0cbab7b78 "><span
																	class="plain_name" data-hover="">Living</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/25"
																data-url="25"
																class="_fade_link _txt_m201909234a9fd6b4958fa "><span
																	class="plain_name" data-hover="">Cushion</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/26"
																data-url="26"
																class="_fade_link _txt_m2019121193639a471d0ab "><span
																	class="plain_name" data-hover="">Kitchen&amp;Table</span></a>
															</li>

															<li class="" style=""><a tabindex="-1"
																href="/705508823" data-url="705508823"
																class="_fade_link _txt_m20190923e688c496f906f "><span
																	class="plain_name" data-hover="">Pisca made</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/29"
																data-url="29"
																class="_fade_link _txt_m201912119ed1ab0683a2c "><span
																	class="plain_name" data-hover="">Holiday</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/27"
																data-url="27"
																class="_fade_link _txt_m20190925a3fd52987eb7a "><span
																	class="plain_name" data-hover="">Insert(솜류)</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/28"
																data-url="28"
																class="_fade_link _txt_m20191007047a4395b99fc "><span
																	class="plain_name" data-hover="">Personal</span></a></li>

														</ul>

													</div>

													<div class="title_menu _item"
														data-code="m20190923392516044e8b4" style="">
														<a href="/community" class=" _title_anchor  _fade_link "
															data-url="community"> <span
															class="_txt_m20190923392516044e8b4 _title_txt plain_name"
															data-hover="">COMMUNITY</span>
														</a>

														<ul class="sub_menu">

															<li class="" style=""><a tabindex="-1"
																href="/notice" data-url="notice"
																class="_fade_link _txt_m20190923b075cfc921ccf "><span
																	class="plain_name" data-hover="">NOTICE</span></a></li>

															<li class="" style=""><a tabindex="-1" href="/qna"
																data-url="qna"
																class="_fade_link _txt_m201909236072d89938f37 "><span
																	class="plain_name" data-hover="">Q&amp;A</span></a></li>

															<li class="" style=""><a tabindex="-1"
																href="/review" data-url="review"
																class="_fade_link _txt_m201909233724d657abc1d "><span
																	class="plain_name" data-hover="">REVIEW</span></a></li>

														</ul>

													</div>

													<div class="title_menu _item"
														data-code="m2019092396fc7e673f59d" style="">
														<a href="/contact" class=" _title_anchor  _fade_link "
															data-url="contact"> <span
															class="_txt_m2019092396fc7e673f59d _title_txt plain_name"
															data-hover="">CONTACT</span>
														</a>

													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div></div>
				</div>
				<div id="inline_header_mobile" style="min-height: 30px;"
					class="first_scroll_fixed">
					<div data-type="section-wrap"
						class="inline-section-wrap fixed_transform _fixed_header_section"
						id="s201909236d5ade6137c4b">
						<div
							class="section_bg _section_bg fixed_transform _interactive_bg  "></div>
						<div class="section_bg_color _section_bg_color fixed_transform"
							style="background-color: #ffffff; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
						<div data-type="inside" class="inline-inside _inline-inside">
							<div data-type="section" class="inline-section"
								section-code="s201909236d5ade6137c4b">
								<div data-type="col-group" data-col-group="left"
									class="inline-col-group inline-col-group-left"
									style="width: 75px;">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w2019092393d305a9b57c3"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_menu_btn">
												<div class="widget inline_widget icon_type_menu st00">
													<a href="javascript:;"
														class="_no_hover fixed_transform inline-blocked"
														onclick="MOBILE_SLIDE_MENU.slideNavToggle($(this))"> <span
														class="holder icon_code btm bt-bars"
														id="inline_menu_alarm_badge"></span> <span class="text">MENU</span>
													</a>
												</div>





											</div>
										</div>
									</div>
								</div>
								<div data-type="col-group" data-col-group="center"
									class="inline-col-group inline-col-group-center">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w201909230b330b0bd7c5f"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_logo">
												<div class="widget inline_widget logo  text_inline"
													id="logo_w201909230b330b0bd7c5f">
													<div class="img_box _img_box" style="position: relative;">
														<a class="" href="/"><span class="sr-only">사이트
																로고</span> <img class="normal_logo _front_img"
															src="https://cdn.imweb.me/thumbnail/20200222/4f9c31a9b412f.gif"
															alt="pisca pisca: 피스카피스카" width="203.35443038"
															style="max-width: 100%; height: auto; image-rendering: -webkit-optimize-contrast;">
															<img class="scroll_logo fixed_transform"
															src="https://cdn.imweb.me/thumbnail/20200222/4f9c31a9b412f.gif"
															alt="pisca pisca: 피스카피스카" width="203.35443038"
															style="max-width: 100%; height: auto; image-rendering: -webkit-optimize-contrast;">
														</a>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
								<div data-type="col-group" data-col-group="right"
									class="inline-col-group inline-col-group-right"
									style="width: 75px;">
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w2019092331a21d97624d6"
											class="inline-widget">
											<div class="_widget_data" data-widget-type="inline_login_btn">
												<div
													class="widget inline_widget login_btn button  button_text txt_l text-xx-small">
													<div>
														<div class="inline-blocked login_btn_item ">
															<a
																class="_fade_link   btn_text btn_59e036883ad24   btn_custom "
																href="/shop_cart" style="border-radius: 0px;"><span
																class="sr-only">로그인 위젯 문구</span><span
																class="icon_class "><i
																	class="fixed_transform simple icon-handbag"
																	aria-hidden="true"></i></span><span
																class="text fixed_transform no_text"></span><span
																class="badge_wrap"><sup
																	class="badge _shop_cart_badge_cnt_wrap"
																	style="top: auto; bottom: -5px; right: -5px"></sup></span></a>
														</div>
													</div>
												</div>





											</div>
										</div>
									</div>
									<div data-type="grid" class="inline-col">
										<div data-type="widget" id="w20190923273818f73540f"
											class="inline-widget">
											<div class="_widget_data"
												data-widget-type="inline_search_btn">

												<div class="widget inline_widget search_btn">
													<div class="search_type fixed_transform search_btn_type01">
														<div class="inline-blocked holder ">
															<form class=" icon_on" action="/search" method="get"
																id="inline_s_form_w20190923273818f73540f">
																<input class="search_btn_form" name="keyword"
																	style="display: none" placeholder="Search" value=""
																	title="site search">
																<a class="fixed_transform inline-blocked " href="#"
																	onclick="SITE_SEARCH.openSearch(search_option_data_w20190923273818f73540f);"><i
																	class="simple icon-magnifier"></i><span class="sr-only">site
																		search</span></a>
															</form>
														</div>
													</div>
												</div>






											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div></div>
				</div>
			</div>
		</div>
	</header>
	<div doz_type="section"
		class="section_wrap visual_section  pc_section    section_first _section_first   mobile_section_first  "
		id="s201909236184de126635f" doz_mobile_section="N" doz_mobile_hide="N"
		doz_header_repeat="N" doz_footer_repeat="N" doz_category="visual"
		doz_fullpage="N" style="">
		<div class="visual_section  _visual_section  full_screen_show "
			id="visual_s201909236184de126635f">
			<!-- 비주얼 영역이
없는 경우 .no-visual 추가 -->

			<!-- 비주얼 영역-->
			<div class="owl-carousel owl-theme _slide owl-loaded">
				<div class="owl-item" style="width: 100%; float: none;">
					<div class="item holder section "
						style="background-image: url(https://cdn.imweb.me/thumbnail/20190924/7007e4e6d3549.jpg); background-color: #e6e4df; background-repeat: no-repeat; background-size: cover; background-position: 50% 50%;">
						<div class="op _op" style="position: relative; z-index: 11;">
							<div class="header-content _visual_height m_ratio">
								<div class="text _text_wrap">
									<div class="text-wrap _text fr-view">
										<h1 style="text-align: center;">
											<span style="font-size: 30px;">small things. collect.
												select.</span>
										</h1>
										<p style="text-align: center; margin-bottom: 20px;">
											<span style="font-size: 13px;">select and introduce a
												variety of interior design products from all over the world<br>to
												make every moment of our daily life twinkle
											</span>
										</p>
										<p style="text-align: center;">
											<a class="btn btn-sm" href="/shop">shop now</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end.비주얼 영역 -->
		</div>
	</div>
	<div doz_type="section"
		class="section_wrap  pc_section       side_     "
		id="s20190923d6afb7c4efecc" style="" doz_change_mobile="N"
		doz_aside="N" doz_side_width="230" doz_side_margin="0" doz_extend="N"
		doz_mobile_section="N" doz_mobile_hide="N" doz_header_repeat="N"
		doz_footer_repeat="N" doz_category="default">
		<div class="section_bg _section_bg _interactive_bg  "
			style="background-size: cover; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
		<div class="section_bg_color _section_bg_color"
			style="position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>



		<main>
			<div doz_type="inside" class="inside">
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w201909230e39eeb609d41">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="50"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w201909230e39eeb609d41"
										style="width: 100%; min-height: 1px; height: 50px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w2019092321e59ba146ef3">
							<div class="_widget_data " data-widget-name="텍스트"
								data-widget-type="text" data-widget-anim="none"
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div doz_type="text"
									class="widget _text_wrap widget_text_wrap fr-view  default_padding "
									id="text_w2019092321e59ba146ef3">

									<div class="text-table ">
										<div>
											<h2 style="text-align: center;">
												<span style="font-size: 26px;">NEW PRODUCTS</span>
											</h2>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w201909233bc3486299c33">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="50"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w201909233bc3486299c33"
										style="width: 100%; min-height: 1px; height: 50px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w201909239f47cdcc8c062">
							<div class="_widget_data " data-widget-name="쇼핑"
								data-widget-type="shopping" data-widget-anim="none"
								data-widget-anim-duration="0.7" data-widget-anim-delay="0"
								data-widget-parent-is-mobile="N">
								<div class="shop-content widget">
									<div class="shop-grid">
										<div class="thumb-fluid _item_container  ">
											<div class="shop-tools clearfix" style="display:">
												<div class="down-btn" style="display: none">
													<select class="form-control" name="deliv_option_type"
														onchange="document.location.href = encodeURI('/?sort='+$(this).val())"
														title="정렬 바꾸기">
														<option value="recent">등록순</option>
														<option value="like">인기순</option>
														<option value="min_price">낮은가격순</option>
														<option value="max_price">높은가격순</option>
														<option value="comment">상품평 많은순</option>
														<option value="abc">이름순</option>
														<option value="descabc">이름역순</option>
													</select>
												</div>
											</div>
											<div
												class="thumb-row m-list-type2 hover_bright thumb-item-3 _item_wrap "
												id="container_w201909239f47cdcc8c062"
												style="visibility: visible; margin: 0px -12.5px;">
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=69"
															class="_fade_link shop-item-thumb hover_img_none"> <img
															data-prodcode="s202004304f77a6030fb9f" alt=""
															src="https://cdn.imweb.me/thumbnail/20200430/a35ab7bdee773.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20200430/a35ab7bdee773.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20200430/a35ab7bdee773.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Little pony</h2>
																		<p class="pay no-margin" style="">168,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=69">Little pony</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">168,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('69', 'https://pisca-pisca.co.kr/?idx=69')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=25" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191027fd5b826b38814" alt=""
															src="https://cdn.imweb.me/thumbnail/20191027/0fa9c64de5b28.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191027/0fa9c64de5b28.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191027/0fa9c64de5b28.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Shell pendant mobile: S size *12차</h2>
																		<p class="pay no-margin" style="">41,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=25">Shell pendant
																	mobile: S size *12차</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">41,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('25', 'https://pisca-pisca.co.kr/?idx=25')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=26" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191027c07fb5971cced" alt=""
															src="https://cdn.imweb.me/thumbnail/20191027/83195f0b5d942.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191027/83195f0b5d942.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191027/83195f0b5d942.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Shell pendant mobile: M size *12차</h2>
																		<p class="pay no-margin" style="">58,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=26">Shell pendant
																	mobile: M size *12차</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">58,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('26', 'https://pisca-pisca.co.kr/?idx=26')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=27" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191027f13c7c1f3a367" alt=""
															src="https://cdn.imweb.me/thumbnail/20191027/b1108febd2f21.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191027/b1108febd2f21.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191027/b1108febd2f21.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Shell pendant mobile: XL size *12차</h2>
																		<p class="pay no-margin" style="">154,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																			<div class="prod_icon sold_out">SOLDOUT</div>
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=27">Shell pendant
																	mobile: XL size *12차</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">154,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
																<div class="prod_icon sold_out">SOLDOUT</div>
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('27', 'https://pisca-pisca.co.kr/?idx=27')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=62" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20200316c413caf750d8d" alt=""
															src="https://cdn.imweb.me/thumbnail/20200316/4e3d8bad8b14f.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20200316/4e3d8bad8b14f.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20200316/4e3d8bad8b14f.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Spring kitchen cloth</h2>
																		<p class="pay no-margin" style="">19,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=62">Spring kitchen
																	cloth</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">19,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('62', 'https://pisca-pisca.co.kr/?idx=62')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=63" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s202003164cf4855c5f2ec" alt=""
															src="https://cdn.imweb.me/thumbnail/20200316/1e7e9f51c43ee.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20200316/1e7e9f51c43ee.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20200316/1e7e9f51c43ee.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Pisca kitchen cloth</h2>
																		<p class="pay no-margin" style="">18,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=63">Pisca kitchen
																	cloth</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">18,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('63', 'https://pisca-pisca.co.kr/?idx=63')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=60" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s2020031692bc4c6f12306" alt=""
															src="https://cdn.imweb.me/thumbnail/20200316/e1b4338261249.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20200316/e1b4338261249.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20200316/e1b4338261249.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Sunny plaid_Table runner</h2>
																		<p class="pay no-margin" style="">33,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=60">Sunny
																	plaid_Table runner</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">33,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('60', 'https://pisca-pisca.co.kr/?idx=60')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=59" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s202003163efad3022137b" alt=""
															src="https://cdn.imweb.me/thumbnail/20200316/46994df5571c1.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20200316/46994df5571c1.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20200316/46994df5571c1.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Spring garden_Table runner</h2>
																		<p class="pay no-margin" style="">33,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=59">Spring
																	garden_Table runner</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">33,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('59', 'https://pisca-pisca.co.kr/?idx=59')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=61" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s2020031658168823d143d" alt=""
															src="https://cdn.imweb.me/thumbnail/20200316/21731269c4100.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20200316/21731269c4100.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20200316/21731269c4100.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Orange gingham_Table runner</h2>
																		<p class="pay no-margin" style="">33,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=61">Orange
																	gingham_Table runner</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">33,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('61', 'https://pisca-pisca.co.kr/?idx=61')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=12" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s201909255e2b1bad29ca7" alt=""
															src="https://cdn.imweb.me/thumbnail/20190926/0f9b02bb51b9d.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20190926/0f9b02bb51b9d.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20190926/0f9b02bb51b9d.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>blue banana *5차</h2>
																		<p class="pay no-margin" style="">39,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																			<div class="prod_icon sold_out">SOLDOUT</div>
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=12">blue banana
																	*5차</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">39,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
																<div class="prod_icon sold_out">SOLDOUT</div>
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('12', 'https://pisca-pisca.co.kr/?idx=12')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=1" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20190923b09132db4a0aa" alt=""
															src="https://cdn.imweb.me/thumbnail/20190926/3e03876d4bd4e.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20190926/3e03876d4bd4e.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20190926/3e03876d4bd4e.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Yellow bell</h2>
																		<p class="pay no-margin" style="">36,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=1">Yellow bell</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">36,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('1', 'https://pisca-pisca.co.kr/?idx=1')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=5" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20190923766506f4435b3" alt=""
															src="https://cdn.imweb.me/thumbnail/20190926/84c5cc2b72ceb.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20190926/84c5cc2b72ceb.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20190926/84c5cc2b72ceb.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Sunny plaid</h2>
																		<p class="pay no-margin" style="">35,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=5">Sunny plaid</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">35,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('5', 'https://pisca-pisca.co.kr/?idx=5')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=4" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20190923e403f510b38d5" alt=""
															src="https://cdn.imweb.me/thumbnail/20190926/469e3b7d749d0.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20190926/469e3b7d749d0.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20190926/469e3b7d749d0.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Spring garden</h2>
																		<p class="pay no-margin" style="">35,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=4">Spring garden</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">35,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('4', 'https://pisca-pisca.co.kr/?idx=4')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=8" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s201909235b02bfb9636d4" alt=""
															src="https://cdn.imweb.me/thumbnail/20190926/f333920730ed5.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20190926/f333920730ed5.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20190926/f333920730ed5.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Orange gingham</h2>
																		<p class="pay no-margin" style="">35,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=8">Orange gingham</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">35,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('8', 'https://pisca-pisca.co.kr/?idx=8')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=18" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191006cdf81b6e548fd" alt=""
															src="https://cdn.imweb.me/thumbnail/20191006/9add6e08493b3.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191006/9add6e08493b3.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191006/9add6e08493b3.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Caramel plaid</h2>
																		<p class="pay no-margin" style="">35,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=18">Caramel plaid</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">35,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('18', 'https://pisca-pisca.co.kr/?idx=18')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=17" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191006b7a703ac17f7c" alt=""
															src="https://cdn.imweb.me/thumbnail/20191006/2c8a6055b8ded.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191006/2c8a6055b8ded.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191006/2c8a6055b8ded.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Happy fall</h2>
																		<p class="pay no-margin" style="">35,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=17">Happy fall</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">35,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('17', 'https://pisca-pisca.co.kr/?idx=17')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=43" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191216aa4ff1bb4bc29" alt=""
															src="https://cdn.imweb.me/thumbnail/20191216/a09de9e572c90.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191216/a09de9e572c90.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191216/a09de9e572c90.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Marron marron</h2>
																		<p class="pay no-margin" style="">36,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=43">Marron marron</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">36,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('43', 'https://pisca-pisca.co.kr/?idx=43')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=44" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s201912160877b83ef072a" alt=""
															src="https://cdn.imweb.me/thumbnail/20191216/c1b3f844b886e.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191216/c1b3f844b886e.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191216/c1b3f844b886e.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>BIBA mocha</h2>
																		<p class="pay no-margin" style="">32,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=44">BIBA mocha</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">32,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('44', 'https://pisca-pisca.co.kr/?idx=44')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=45" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s2019121697b0aab20e9e8" alt=""
															src="https://cdn.imweb.me/thumbnail/20191216/42016fcad1566.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191216/42016fcad1566.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191216/42016fcad1566.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>BIBA ivory</h2>
																		<p class="pay no-margin" style="">31,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=45">BIBA ivory</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">31,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('45', 'https://pisca-pisca.co.kr/?idx=45')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=33" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191124f5b46752e9ef5" alt=""
															src="https://cdn.imweb.me/thumbnail/20191124/275f463418c7b.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191124/275f463418c7b.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191124/275f463418c7b.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Sally enamel plate set</h2>
																		<p class="pay no-margin" style="">35,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=33">Sally enamel
																	plate set</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">35,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('33', 'https://pisca-pisca.co.kr/?idx=33')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 394px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=14" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s2019100307baf994c40dc" alt=""
															src="https://cdn.imweb.me/thumbnail/20191003/097053e6df9d8.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191003/097053e6df9d8.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191003/097053e6df9d8.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>마이크로화이바 쿠션솜(40/45)</h2>
																		<p class="pay no-margin" style="">17,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=14">마이크로화이바
																	쿠션솜(40/45)</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">17,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('14', 'https://pisca-pisca.co.kr/?idx=14')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=13" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191003bc67b53680ef0" alt=""
															src="https://cdn.imweb.me/thumbnail/20191003/bb8bbae262acf.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191003/bb8bbae262acf.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191003/bb8bbae262acf.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>구름솜(40/45)</h2>
																		<p class="pay no-margin" style="">8,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=13">구름솜(40/45)</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">8,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('13', 'https://pisca-pisca.co.kr/?idx=13')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=42" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191216012bce8d585ac" alt=""
															src="https://cdn.imweb.me/thumbnail/20191216/8c905023c98f7.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191216/8c905023c98f7.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191216/8c905023c98f7.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>(warm) Yellow bell</h2>
																		<p class="pay no-margin" style="">36,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																			<div class="prod_icon sold_out">SOLDOUT</div>
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=42">(warm) Yellow
																	bell</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">36,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
																<div class="prod_icon sold_out">SOLDOUT</div>
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('42', 'https://pisca-pisca.co.kr/?idx=42')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: 428px;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=46" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191216a0b94b0b3921d" alt=""
															src="https://cdn.imweb.me/thumbnail/20191216/8685f160c3878.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191216/8685f160c3878.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191216/8685f160c3878.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>BIBA leopard</h2>
																		<p class="pay no-margin" style="">31,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																			<div class="prod_icon sold_out">SOLDOUT</div>
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=46">BIBA leopard</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">31,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
																<div class="prod_icon sold_out">SOLDOUT</div>
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('46', 'https://pisca-pisca.co.kr/?idx=46')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
												<div class="shop-item _shop_item"
													style="width: 308px; padding: 0px 12.5px; height: auto;">
													<div class="item-wrap" style="position: relative;">
														<a href="/?idx=15" class="_fade_link shop-item-thumb ">
															<img data-prodcode="s20191003cbd6462777775" alt=""
															src="https://cdn.imweb.me/thumbnail/20191003/0cabd942f04d8.jpg"
															class="_org_img org_img _lazy_img"
															data-original="https://cdn.imweb.me/thumbnail/20191003/0cabd942f04d8.jpg"
															data-src="https://cdn.imweb.me/thumbnail/20191003/0cabd942f04d8.jpg">
															<div class="item-overlay">
																<div class="item-pay">
																	<div>
																		<h2>Cream bell</h2>
																		<p class="pay no-margin" style="">37,000원</p>
																		<div class="ns-icon clearfix">
																			<!--<span class="new bg-brand">NEW</span>-->
																			<div class="prod_icon sold_out">SOLDOUT</div>
																		</div>
																	</div>
																</div>
															</div>
														</a>
													</div>
													<div class="item-detail" style="">
														<div class="item-pay">
															<h2 style="display:">
																<a class="_fade_link" href="/?idx=15">Cream bell</a>
															</h2>
															<div class="item-pay-detail">
																<p class="pay" style="">37,000원</p>
															</div>
															<div class="ns-icon clearfix">
																<!--<span class="new bg-brand">NEW</span>-->
																<div class="prod_icon sold_out">SOLDOUT</div>
															</div>
														</div>
														<div class="item-icon">
															<span> <a href="javascript:;"
																onclick="SITE_SHOP_DETAIL.openProdDetailFromShoppingList('15', 'https://pisca-pisca.co.kr/?idx=15')"><i
																	class="icon-basket"></i> Cart</a>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<nav class="paging-block">
										<!-- 페이징 버튼 -->
										<ul class="pagination">
											<li><a href="javascript:;" class="disabled"><i
													aria-hidden="true" class="icon-arrow-left"></i><span
													class="sr-only">Previous</span></a></li>
											<li class="active"><a href="/?&amp;page=1">1</a></li>
											<li><a href="/?&amp;page=2">2</a></li>
											<li><a href="/?&amp;page=3">3</a></li>
											<li><a href="javascript:;" class="disabled"><i
													aria-hidden="true" class="icon-arrow-right"></i><span
													class="sr-only">Next</span></a></li>
										</ul>
									</nav>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<div doz_type="section"
		class="section_wrap  pc_section   mobile_hide      side_     "
		id="s20190923dce74e9e1d0c1" style="" doz_change_mobile="N"
		doz_aside="N" doz_side_width="230" doz_side_margin="0" doz_extend="N"
		doz_mobile_section="N" doz_mobile_hide="Y" doz_header_repeat="N"
		doz_footer_repeat="N" doz_category="default">
		<div class="section_bg _section_bg _interactive_bg  "
			style="background-size: cover; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
		<div class="section_bg_color _section_bg_color"
			style="position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>



		<main>
			<div doz_type="inside" class="inside">
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w20190923620d0eab8de7d">
							<div class="_widget_data " data-widget-name="가로선"
								data-widget-type="hr" data-widget-anim="none"
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget line type05 border_style_hide"
									id="hr_w20190923620d0eab8de7d">
									<div class="line_box holder" style="width: 100%;">
										<hr style="border-top-width: 1px; border-color: #707070;">
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<div doz_type="section"
		class="section_wrap  pc_section       side_basic grid_gutter_0 grid_v_gutter_0   "
		id="s2019092374faa2cb23719" style="" doz_change_mobile="N"
		doz_aside="N" doz_side_width="230" doz_side_margin="0" doz_extend="N"
		doz_mobile_section="N" doz_mobile_hide="N" doz_header_repeat="N"
		doz_footer_repeat="N" doz_category="default">
		<div class="section_bg _section_bg _interactive_bg  fixed_bg"
			style="background-image: url('https://cdn.imweb.me/thumbnail/20190924/3808910166275.jpg'); background-position: 50% 50%; background-size: cover; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
		<div class="section_bg_color _section_bg_color"
			style="background-color: rgba(38, 23, 7, 0.4); -ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#66261707, endColorstr=#66261707); filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#66261707, endColorstr=#66261707); zoom: 1; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>



		<main>
			<div doz_type="inside" class="inside">
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w201909231bec361203387">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="100"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w201909231bec361203387"
										style="width: 100%; min-height: 1px; height: 100px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w201909237d0d74c4f20aa">
							<div class="_widget_data " data-widget-name="텍스트"
								data-widget-type="text" data-widget-anim="none"
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div doz_type="text"
									class="widget _text_wrap widget_text_wrap fr-view  default_padding "
									id="text_w201909237d0d74c4f20aa">

									<div class="text-table ">
										<div>
											<p style="text-align: center;">
												<span style="color: rgb(255, 255, 255); font-size: 30px;">Pisca
													Apartment</span>
											</p>
											<p style="text-align: center;">
												<span style="color: rgb(255, 255, 255);">403,
													Itaewon-ro 55ga-gil 15, Yongsan-gu,</span>
											</p>
											<p style="text-align: center;">
												<span style="color: rgb(255, 255, 255);">Seoul,
													Republic of Korea</span>
											</p>
											<p style="text-align: center;">
												<span style="color: rgb(255, 255, 255);">Sat.
													13:00-18:00</span>
											</p>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w2019092353da43ab7e276">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="3"
									style="margin-top: 0px; margin-bottom: 0px;">
									<div id="padding_w2019092353da43ab7e276"
										style="width: 100%; min-height: 1px; height: 3px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="4" doz_clear="Y"
						class="col-dz col-dz-4   col-xdz-clear">
						<div doz_type="widget" id="w20190923cc545ba86b5a1">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="30"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w20190923cc545ba86b5a1"
										style="width: 100%; min-height: 1px; height: 30px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div doz_type="grid" doz_grid="1" doz_clear="Y"
						class="col-dz col-dz-1   col-xdz-clear">
						<div doz_type="widget" id="w2019092352ff1388c20bc">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="2"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w2019092352ff1388c20bc"
										style="width: 100%; min-height: 1px; height: 2px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div doz_type="grid" doz_grid="1" doz_clear="Y"
						class="col-dz col-dz-1   col-xdz-clear">
						<div doz_type="widget" id="w2019092357b07680fdad3">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="3"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w2019092357b07680fdad3"
										style="width: 100%; min-height: 1px; height: 3px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div doz_type="grid" doz_grid="1" doz_clear="Y"
						class="col-dz col-dz-1   col-xdz-clear">
						<div doz_type="widget" id="w2019092330b899ac8e8d3">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="2"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w2019092330b899ac8e8d3"
										style="width: 100%; min-height: 1px; height: 2px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div doz_type="grid" doz_grid="1" doz_clear="Y"
						class="col-dz col-dz-1   col-xdz-clear">
						<div doz_type="widget" id="w2019092399c5754efffb0">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="-9"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w2019092399c5754efffb0"
										style="width: 100%; min-height: 1px; height: -9px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div doz_type="grid" doz_grid="4" doz_clear="Y"
						class="col-dz col-dz-4   col-xdz-clear">
						<div doz_type="widget" id="w201909232d5f32974ac02">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="30"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w201909232d5f32974ac02"
										style="width: 100%; min-height: 1px; height: 30px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w20190923b6118ae96af6c">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="87"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w20190923b6118ae96af6c"
										style="width: 100%; min-height: 1px; height: 87px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<div doz_type="section"
		class="section_wrap  pc_section       side_basic     "
		id="s2019092320e0e635f422a" style="" doz_change_mobile="N"
		doz_aside="N" doz_side_width="230" doz_side_margin="0" doz_extend="N"
		doz_mobile_section="N" doz_mobile_hide="N" doz_header_repeat="N"
		doz_footer_repeat="Y" doz_category="default">
		<div class="section_bg _section_bg _interactive_bg  "
			style="background-size: cover; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>
		<div class="section_bg_color _section_bg_color"
			style="background-color: #f5f3f2; position: absolute; left: 0; top: 0; right: 0; bottom: 0;"></div>



		<main>
			<div doz_type="inside" class="inside">
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w201909230d35dc0154191">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="16"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w201909230d35dc0154191"
										style="width: 100%; min-height: 1px; height: 16px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w20190924bb631824c3ed0">
							<div class="_widget_data " data-widget-name="이미지"
								data-widget-type="image" data-widget-anim="none"
								data-widget-anim-duration="0.7" data-widget-anim-delay="0"
								data-widget-parent-is-mobile="N">
								<div
									class="widget image  _image_wrap text_position_bottom hover_text_position_bottom visibility hover_image_hidden org_size  hover_img_hide   same_overlay">
									<div class="_img_box img_wrap " style="height: 80px;">
										<img id="img_w20190924bb631824c3ed0"
											src="https://cdn.imweb.me/thumbnail/20190924/f7b2cf514f423.png"
											style="visibility: visible; image-rendering: -webkit-optimize-contrast; display: inline-block; width: auto; height: 80px; margin: 0px auto;"
											class=" org_image" alt="">
										<div class="_hover_image hover_img"
											style="position: relative; margin: -80px auto auto; width: 599px; height: 80px; background-image: url(&quot;https://cdn.imweb.me/thumbnail/20190924/f7b2cf514f423.png&quot;); background-size: cover; background-repeat: no-repeat; background-position: 50% 50%; top: 0px; left: 0px;"></div>
									</div>
								</div>



							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w20190923f4efeecd95b9d">
							<div class="_widget_data " data-widget-name="텍스트"
								data-widget-type="text" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div doz_type="text"
									class="widget _text_wrap widget_text_wrap fr-view  default_padding "
									id="text_w20190923f4efeecd95b9d">

									<div class="text-table ">
										<div>
											<p style="text-align: center;">OWNER Boram Kim TEL
												02.6383.8018 E-MAIL shop.piscapisca@gmail.com</p>
											<p style="text-align: center;">
												BUSINESS no. 194-38-00502 <a
													href="http://www.ftc.go.kr/www/bizCommList.do?key=232"
													rel="noopener noreferrer" target="_blank"><span
													style="font-size: 12px;">[사업자정보확인]</span></a> ONLINE SALES
												LICENSE no. 2019-Yongsan Seoul-1315
											</p>
											<p style="text-align: center;">
												ADDRESS &nbsp;<span style="color: rgb(0, 0, 0);">403,
													Itaewon-ro 55ga-gil 15, Yongsan-gu,</span>
											</p>
											<p style="text-align: center;">
												<span style="color: rgb(0, 0, 0);">Seoul, Republic of
													Korea</span>
											</p>
											<p style="text-align: center;">
												BANK ACCOUNT <span style="font-size: 12px;">하나</span>
												376-910396-42007 <span style="font-size: 12px;">김보람(피스카피스카)</span>
											</p>
											<p style="text-align: center;">
												Copyright © <strong>Pisca Pisca.</strong> All rights
												reserved.
											</p>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div doz_type="row" doz_grid="12" class="doz_row">
					<div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
						<div doz_type="widget" id="w201909236fe22287a0c7e">
							<div class="_widget_data " data-widget-name="여백"
								data-widget-type="padding" data-widget-anim=""
								data-widget-anim-duration="" data-widget-anim-delay=""
								data-widget-parent-is-mobile="N">
								<div class="widget padding" data-height="16"
									style="margin-top: px; margin-bottom: px;">
									<div id="padding_w201909236fe22287a0c7e"
										style="width: 100%; min-height: 1px; height: 16px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
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
									data-url="ABOUT"><span class="plain_name" data-hover="">ABOUT</span></a>
								</li>

								<li class="_show_m2019092342d0bb289c6aa " style=""><a
									href="/shop" class="_fade_link _txt_m2019092342d0bb289c6aa "
									data-url="shop"><span class="plain_name" data-hover="">SHOP</span></a>
								</li>

								<li class="_show_m20190923392516044e8b4 " style=""><a
									href="/community"
									class="_fade_link _txt_m20190923392516044e8b4 "
									data-url="community"><span class="plain_name" data-hover="">COMMUNITY</span></a>
								</li>

								<li class="_show_m2019092396fc7e673f59d " style=""><a
									href="/contact" class="_fade_link _txt_m2019092396fc7e673f59d "
									data-url="contact"><span class="plain_name" data-hover="">CONTACT</span></a>
								</li>

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
									target="_blank"><i aria-hidden="true"
									class="fa fa-instagram"></i><span class="sr-only">SNS
										바로가기</span></a>
							</div>
						</div>
					</div>
					<div class="foot-app-menu _app_menu clearfix"
						style="display: none;"></div>
				</div>
			</div>
		</div>
	</footer>
	<iframe name="hidden_frame" id="hidden_frame" title="hidden frame"
		src="about:blank"
		style="position: absolute; left: -9999px; width: 1px; height: 1px; top: -9999px;"></iframe>
	<div class="modal" id="cocoaModal" role="dialog" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<div class="modal submodal" role="dialog" id="cocoaSubModal"
		aria-hidden="false" style="z-index: 17001">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<script
		src="https://vendor-cdn.imweb.me/js/bootstrap.min.js?1577682292"></script>
	<!--[if lte IE 9]>
<script src='https://vendor-cdn.imweb.me/js/html5shiv.min.js?1577682292'></script>
<![endif]-->
	<!--[if lte IE 9]>
<script src='https://vendor-cdn.imweb.me/js/respond.min.js?1577682292'></script>
<![endif]-->
	<!--[if lte IE 9]>
<script src='https://vendor-cdn.imweb.me/js/placeholders.min.js?1577682292'></script>
<![endif]-->
	<!--[if lte IE 8]>
<script src='https://vendor-cdn.imweb.me/js/PIE_IE678.js?1577682292'></script>
<![endif]-->
	<script
		src="https://vendor-cdn.imweb.me/js/jquery.fileupload.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/jquery.lazyload.min.js?1577682292"></script>
	<script src="/js/localize/KR_KRW_currency.js?1586423892"></script>
	<script>
		LOCALIZE.설명_작성권한이없습니다 = function() {
			return LOCALIZE.convArguments("작성 권한이 없습니다.", arguments);
		};
		LOCALIZE.버튼_더보기 = function() {
			return LOCALIZE.convArguments("더보기", arguments);
		};
		LOCALIZE.설명_권한이_없습니다 = function() {
			return LOCALIZE.convArguments("권한이 없습니다.", arguments);
		};
		LOCALIZE.설명_로그인이_필요합니다 = function() {
			return LOCALIZE.convArguments("로그인이 필요합니다.", arguments);
		};
		LOCALIZE.설명_내용을_입력해주세요 = function() {
			return LOCALIZE.convArguments("내용을 입력해주세요", arguments);
		};
		LOCALIZE.설명_삭제된_댓글_입니다 = function() {
			return LOCALIZE.convArguments("삭제된 댓글 입니다.", arguments);
		};
		LOCALIZE.설명_비밀번호 = function() {
			return LOCALIZE.convArguments("비밀번호", arguments);
		};
		LOCALIZE.버튼_응답수정 = function() {
			return LOCALIZE.convArguments("응답 수정", arguments);
		};
		LOCALIZE.설명_가입승인이_필요한_서비스입니다 = function() {
			return LOCALIZE.convArguments("가입승인이 필요한 서비스입니다.", arguments);
		};
		LOCALIZE.설명_필수항목을입력하여주시기바랍니다 = function() {
			return LOCALIZE.convArguments("필수 항목을 입력하여 주시기 바랍니다.", arguments);
		};
		LOCALIZE.버튼_확인닫기 = function() {
			return LOCALIZE.convArguments("확인", arguments);
		};
		LOCALIZE.타이틀_수량 = function() {
			return LOCALIZE.convArguments("수량", arguments);
		};
		LOCALIZE.설명_장바구니가비어있습니다 = function() {
			return LOCALIZE.convArguments("장바구니가 비어있습니다.", arguments);
		};
		LOCALIZE.타이틀_총금액 = function() {
			return LOCALIZE.convArguments("총금액", arguments);
		};
		LOCALIZE.설명_취소내역이없습니다 = function() {
			return LOCALIZE.convArguments("취소 내역이 없습니다.", arguments);
		};
		LOCALIZE.설명_주문내역이없습니다 = function() {
			return LOCALIZE.convArguments("주문 내역이 없습니다.", arguments);
		};
		LOCALIZE.버튼_메뉴더보기 = function() {
			return LOCALIZE.convArguments("더보기", arguments);
		};
		LOCALIZE.버튼_확인 = function() {
			return LOCALIZE.convArguments("확인", arguments);
		};
		LOCALIZE.설명_주문자연락처를입력해주세요 = function() {
			return LOCALIZE.convArguments("주문자 연락처를 입력해주세요", arguments);
		};
		LOCALIZE.설명_비밀글입니다 = function() {
			return LOCALIZE.convArguments("비밀글입니다.", arguments);
		};
		LOCALIZE.설명_작성시등록하신비밀번호를입력해주세요 = function() {
			return LOCALIZE.convArguments("작성시 등록하신 비밀번호를 입력해주세요.", arguments);
		};
		LOCALIZE.타이틀_글쓰기카테고리선택 = function() {
			return LOCALIZE.convArguments("카테고리", arguments);
		};
		LOCALIZE.설명_회원등급할인 = function() {
			return LOCALIZE.convArguments("회원등급 할인", arguments);
		};
		LOCALIZE.설명_결제예상금액 = function() {
			return LOCALIZE.convArguments("총 상품금액(%1개)", arguments);
		};
	</script>
	<script src="https://vendor-cdn.imweb.me/js/common.js?1586481121"></script>
	<script src="https://vendor-cdn.imweb.me/js/site_common.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/imagesloaded.pkgd.min.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/jquery.smooth-scroll.min.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/gambit-smoothscroll-min.js?1577682292"></script>
	<script src="https://vendor-cdn.imweb.me/js/ThreeCanvas.js?1577682292"></script>
	<script src="https://vendor-cdn.imweb.me/js/snow.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/masonry.pkgd.min.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/lightgallery-all.min.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/bootstrap.slide-menu.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/bootstrap.slide-menu-alarm.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/bootstrap-hover-dropdown.min.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/jquery-scrolltofixed.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/jquery.trackpad-scroll-emulator.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/modernizr.custom.js?1577682292"></script>
	<script src="https://vendor-cdn.imweb.me/js/classie.js?1577682292"></script>
	<script src="https://vendor-cdn.imweb.me/js/jquery.exif.js?1577682292"></script>
	<script type="text/vbscript">
Function IEBinary_getByteAt(strBinary, iOffset)
	IEBinary_getByteAt = AscB(MidB(strBinary,iOffset+1,1))
End Function
Function IEBinary_getLength(strBinary)
	IEBinary_getLength = LenB(strBinary)
End Function
</script>

	<script
		src="https://vendor-cdn.imweb.me/js/jquery.canvasResize.js?1577682292"></script>
	<script src="https://vendor-cdn.imweb.me/js/autosize.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/owl.carousel2.js?1585870706"></script>
	<!--[if lte IE 9]>
<script src='https://vendor-cdn.imweb.me/js/owl.carousel1.js?1577682292'></script>
<![endif]-->
	<script src="https://vendor-cdn.imweb.me/js/slick.min.js?1577682292"></script>
	<script src="/js/preview_mode.js?1577682295"></script>
	<script src="/js/site.js?1583731133"></script>
	<script src="/js/site_member.js?1586423629"></script>
	<script src="/js/mobile_menu.js?1577682295"></script>
	<script src="/js/sns_share.js?1583730983"></script>
	<script src="/js/android_image_upload.js?1577682295"></script>
	<ul id="image_list" style="display: none"></ul>
	<script src="/js/alarm_menu.js?1577682295"></script>
	<script src="/js/alarm_badge.js?1577682295"></script>
	<script src="/js/one_page.js?1577682295"></script>
	<script src="/js/site_coupon.js?1577682295"></script>
	<script src="/js/secret_article.js?1577682295"></script>
	<script src="/js/article_reaction.js?1577682295"></script>
	<script src="/js/site_shop.js?1587476429"></script>
	<script src="/js/site_shop_mypage.js?1588120426"></script>
	<script src="/js/site_search.js?1577682295"></script>
	<script src="/js/zipcode_daum.js?1577682295"></script>
	<script src="/js/site_booking.js?1586423628"></script>
	<script src="/js/site_section.js?1583818955"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/jquery.number.min.js?1577682292"></script>
	<script src="https://vendor-cdn.imweb.me/js/nprogress.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/tinycolor-min.js?1577682292"></script>
	<script src="/js/app.js?1577682295"></script>
	<script src="/js/header_fixed_menu.js?1577682295"></script>
	<script src="/js/header_more_menu.js?1584514029"></script>
	<script src="/js/header_center_colgroup.js?1577682295"></script>
	<script src="/js/mobile_carousel_menu.js?1577682295"></script>
	<script src="/js/header_mega_dropdown.js?1577682295"></script>
	<script src="/js/header_overlay.js?1577682295"></script>
	<script src="/js/site_log.js?1582866622"></script>
	<script src="/js/advanced_trace.js?1577682295"></script>
	<script src="/js/site_animation.js?1586248334"></script>
	<script src="/js/site_event_check.js?1585896291"></script>
	<script src="https://vendor-cdn.imweb.me/js/moment.min.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/moment-with-locales.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/bootstrap-datepicker.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/jquery.timepicker.min.js?1577682292"></script>
	<script
		src="https://vendor-cdn.imweb.me/js/ie-checker-min.js?1577682292"></script>
	<script src="https://wcs.naver.net/wcslog.js"></script>
	<script
		src="https://sstatic-g.rmcnmv.naver.net/resources/js/naver_web_player_ugc_min.js"></script>
	<script src="/js/image.js?1577682295"></script>
	<script></script>
	<script></script>
	<script>
		var section_youtube_list = [];
		var yt_player = {};
		var vimeo_player = [];
		function onYouTubeIframeAPIReady() {
			$.each(section_youtube_list, function(_e, _data) {
				yt_player[_data.slide_code] = new SITE_SECTION_YOUTUBE();
				yt_player[_data.slide_code].init(_data.type, _data.code,
						_data.id);
			});
		}

		$(function() {
			$('body').smoothScroll({
				delegateSelector : 'a',
				speed : 1200,
				easing : 'easeInOutExpo'
			});
		});
	</script>
	<script>
		if (!wcs_add)
			var wcs_add = {};
		wcs_add["wa"] = "s_568b9e5878e2";
		wcs.checkoutWhitelist = [ 'piscapisca.imweb.me',
				'www.piscapisca.imweb.me', 'piscapisca.co.kr',
				'www.piscapisca.co.kr', 'pisca-pisca.co.kr',
				'www.pisca-pisca.co.kr' ];
		if (!_nasa)
			var _nasa = {};
		wcs.inflow("pisca-pisca.co.kr");
		wcs_do();
	</script>
	<script>
		$(function() {
			HEADER_OVERLAY.init();
		});
		$("#text_w20190923d6a20fdb6ea21").find("._table_responsive").addClass(
				"table").wrap($("<div />").addClass("table-responsive"));

		$(function() {
			var header_center_colgroup_s20190923c98f8cff74df3 = new HEADER_CENTER_COLGROUP();
			header_center_colgroup_s20190923c98f8cff74df3.init(
					's20190923c98f8cff74df3', {
						"top_bottom_margin" : "0",
						"col_margin" : "0",
						"design_setting_margin" : "N",
						"border_width" : "0",
						"border_style" : "solid",
						"border_color" : "#ccc",
						"vertical-align" : "middle",
						"scroll_fixed" : "N",
						"overlay_type_data" : {
							"top_bottom_margin" : "0",
							"col_margin" : "10",
							"design_setting_margin" : "Y",
							"border_width" : "0",
							"border_style" : "solid",
							"border_color" : "rgba(255,255,255,0.5)",
							"vertical-align" : "middle",
							"scroll_fixed" : "N",
							"background_repeat" : "",
							"background_position" : "",
							"color" : "",
							"background_image" : "",
							"background_color" : "#2f2f2f"
						},
						"left_width" : "687",
						"center_width" : "2061",
						"right_width" : "687",
						"height" : "43",
						"background_repeat" : "",
						"background_position" : "",
						"color" : "",
						"left_right_margin" : "30",
						"left_right_margin_mobile" : "0",
						"background_image" : "",
						"background_color" : "#2f2f2f",
						"extend" : "Y"
					})
		});

		$(function() {
			$("#s20190923d21cb33567e11").scrollToFixed({
				marginTop : ""
			});
			$("#s20190923d21cb33567e11").toggleClass("_fixed_header_section",
					true);
		});
		$(function() {
			$("body").toggleClass("new_fixed_header_disable", true);
			$("body").toggleClass("fixed-menu-on", true);
		});

		$('.join_tooltip[data-toggle="tooltip"]').tooltip({
			delay : {
				show : 500,
				hide : 1000000
			}
		});
		var $join_tooltip = $('#w20190923969a135a6c08d').find('.join_tooltip');
		$join_tooltip.tooltip('show');

		var search_option_data_w201909239f9930505325c = {
			"window_background" : "rgba(255, 255, 255, 0.5)",
			"window_color" : "#fff",
			"btn_type" : "type01",
			"btn_text" : "",
			"btn_icon_color" : "#212121",
			"btn_icon_hover_color" : "#999",
			"btn_color" : "#212121",
			"btn_color2" : "#fff",
			"btn_background" : "#00B8FF",
			"btn_font_size" : "22",
			"btn_border_check" : "N",
			"btn_border_color" : "#00B8FF",
			"btn_border_width" : "1",
			"form_height" : "34",
			"form_width" : "150",
			"form_margin" : "10",
			"form_background" : "#fff",
			"form_border_color" : "#dadada",
			"form_border_width" : "1",
			"form_border_radius" : "3",
			"font_size" : "14",
			"font_color" : "#212121",
			"text_value" : "",
			"text_placeholder" : "",
			"icon_type" : "simple",
			"icon_class" : "icon-magnifier",
			"btn_icon_padding_lr" : "5",
			"btn_icon_padding_tb" : "0",
			"hover_color" : "#999",
			"btn_hover_color" : "#fff",
			"btn_hover_background" : "#05b2f5",
			"btn_hover_border_color" : "#05b2f5",
			"overlay_type_data" : {
				"window_background" : " rgba(0,0,0,0.5)",
				"window_color" : "#fff",
				"btn_type" : "type01",
				"btn_text" : "",
				"btn_icon_color" : "#000000",
				"btn_icon_hover_color" : "rgba(255,255,255,0.5)",
				"btn_color" : "#212121",
				"btn_color2" : "#fff",
				"btn_background" : "#00B8FF",
				"btn_font_size" : "14",
				"btn_border_check" : "N",
				"btn_border_color" : "#00B8FF",
				"btn_border_width" : "1",
				"form_height" : "34",
				"form_width" : "150",
				"form_margin" : "10",
				"form_background" : "#fff",
				"form_border_color" : "#dadada",
				"form_border_width" : "1",
				"form_border_radius" : "3",
				"font_size" : "14",
				"font_color" : "#212121",
				"text_value" : "",
				"text_placeholder" : "",
				"icon_type" : "simple",
				"icon_class" : "icon-magnifier",
				"btn_icon_padding_lr" : "10",
				"btn_icon_padding_tb" : "4",
				"hover_color" : "#999",
				"btn_hover_color" : "#fff",
				"btn_hover_background" : "#05b2f5",
				"btn_hover_border_color" : "#05b2f5",
				"form_focus_border_color" : "",
				"text_placeholder_color" : ""
			},
			"device_type" : "pc",
			"link" : "",
			"is_make_thumbnail" : "N"
		};

		$(function() {
			var header_center_colgroup_s20190923d21cb33567e11 = new HEADER_CENTER_COLGROUP();
			header_center_colgroup_s20190923d21cb33567e11.init(
					's20190923d21cb33567e11', {
						"top_bottom_margin" : "15",
						"col_margin" : "10",
						"design_setting_margin" : "N",
						"border_width" : "1",
						"border_style" : "solid",
						"border_color" : "#e7e7e7",
						"vertical-align" : "middle",
						"scroll_fixed" : "Y",
						"overlay_type_data" : {
							"top_bottom_margin" : "0",
							"col_margin" : "10",
							"design_setting_margin" : "Y",
							"border_width" : "0",
							"border_style" : "solid",
							"border_color" : "rgba(255, 255, 255, 0.2)",
							"vertical-align" : "middle",
							"scroll_fixed" : "N",
							"background_repeat" : "",
							"background_position" : "",
							"color" : "",
							"background_image" : ""
						},
						"left_width" : "341",
						"center_width" : "0",
						"right_width" : "341",
						"height" : "101",
						"background_repeat" : "",
						"background_position" : "",
						"color" : "",
						"left_right_margin" : "30",
						"left_right_margin_mobile" : "0",
						"background_image" : "",
						"extend" : "Y",
						"background_color" : "#fff"
					})
		});

		$(function() {
			$("#s20190923a4d26f1ce9d9a").scrollToFixed({
				marginTop : 101
			});
			$("#s20190923a4d26f1ce9d9a").toggleClass("_fixed_header_section",
					true);
		});
		$(function() {
			$("body").toggleClass("new_fixed_header_disable", true);
			$("body").toggleClass("fixed-menu-on", true);
		});

		$(function() {
			var $widget_w20190923607cd98b33b49 = $('#w20190923607cd98b33b49');
			var $widget_dropdown_w20190923607cd98b33b49 = $('#dropdown_w20190923607cd98b33b49');
			var mega_drop_w20190923607cd98b33b49 = new HEADER_MEGA_DROPDOWN();
			mega_drop_w20190923607cd98b33b49.init(
					$widget_w20190923607cd98b33b49,
					$widget_dropdown_w20190923607cd98b33b49, {
						'code' : 'w20190923607cd98b33b49',
						'event_type' : 'click',
						'row_size' : 8,
						'menu_sync' : false,
						'menu_width' : 170,
						'align' : 'left'
					});
			$widget_dropdown_w20190923607cd98b33b49.find('._tse_scrollable')
					.TrackpadScrollEmulator();
		});

		$(function() {
			var $widget_w2019092331b03116111c6 = $('#w2019092331b03116111c6');
			var $widget_dropdown_w2019092331b03116111c6 = $('#dropdown_w2019092331b03116111c6');
			var mega_drop_w2019092331b03116111c6 = new HEADER_MEGA_DROPDOWN();
			mega_drop_w2019092331b03116111c6.init(
					$widget_w2019092331b03116111c6,
					$widget_dropdown_w2019092331b03116111c6, {
						'code' : 'w2019092331b03116111c6',
						'event_type' : 'mouseover',
						'row_size' : 8,
						'menu_sync' : false,
						'menu_width' : 170,
						'align' : 'left'
					});
			$widget_dropdown_w2019092331b03116111c6.find('._tse_scrollable')
					.TrackpadScrollEmulator();
		});

		$(function() {
			var more_menu_w2019092331b03116111c6 = new HEADER_MORE_MENU();
			more_menu_w2019092331b03116111c6.init(
					$('#w2019092331b03116111c6 ._inline_menu_container'), true);
			$('#w2019092331b03116111c6 ._inline_menu_container').data(
					'header_more_menu', more_menu_w2019092331b03116111c6);
		});

		$(function() {
			$('#w2019092331b03116111c6')
					.find("li.dropdown")
					.each(
							function(index) {
								$(this)
										.find("li.dropdown-submenu")
										.each(
												function(index) {
													if (!$(this).hasClass(
															'pulldown-hide')) {
														if ($(this)
																.find(
																		".dropdown-menu > li").length > 0)
															$(this)
																	.addClass(
																			"sub-active");
													} else {
														$(this)
																.find('ul')
																.removeClass(
																		'dropdown-menu');
														$(this).find('ul li')
																.hide();
													}
												});
							});
			$('#w2019092331b03116111c6').find('._header_dropdown')
					.dropdownHover();
		});

		$(function() {
			var header_center_colgroup_s20190923a4d26f1ce9d9a = new HEADER_CENTER_COLGROUP();
			header_center_colgroup_s20190923a4d26f1ce9d9a.init(
					's20190923a4d26f1ce9d9a', {
						"top_bottom_margin" : "0",
						"col_margin" : "10",
						"design_setting_margin" : "N",
						"border_width" : "1",
						"border_style" : "solid",
						"border_color" : "#e7e7e7",
						"vertical-align" : "middle",
						"scroll_fixed" : "Y",
						"overlay_type_data" : {
							"top_bottom_margin" : "0",
							"col_margin" : "10",
							"design_setting_margin" : "Y",
							"border_width" : "0",
							"border_style" : "solid",
							"border_color" : "rgba(255, 255, 255, 0.2)",
							"vertical-align" : "middle",
							"scroll_fixed" : "N",
							"background_repeat" : "",
							"background_position" : "",
							"color" : "",
							"background_image" : ""
						},
						"left_width" : "81",
						"center_width" : "0",
						"right_width" : "81",
						"height" : "51",
						"background_repeat" : "",
						"background_position" : "",
						"color" : "",
						"left_right_margin" : "20",
						"left_right_margin_mobile" : "0",
						"background_image" : "",
						"extend" : "Y",
						"background_color" : "#fff"
					})
		});

		$(function() {
			SITE.firstScrollFixed('inline_header_mobile');
		});
		$(function() {
			$("#s201909236d5ade6137c4b").scrollToFixed({
				marginTop : ""
			});
			$("#s201909236d5ade6137c4b").toggleClass("_fixed_header_section",
					true);
		});

		$('.join_tooltip[data-toggle="tooltip"]').tooltip({
			delay : {
				show : 500,
				hide : 1000000
			}
		});
		var $join_tooltip = $('#w2019092331a21d97624d6').find('.join_tooltip');
		$join_tooltip.tooltip('show');

		var search_option_data_w20190923273818f73540f = {
			"window_background" : " rgba(0,0,0,0.5)",
			"window_color" : "#fff",
			"btn_type" : "type01",
			"btn_text" : "",
			"btn_icon_color" : "#212121",
			"btn_icon_hover_color" : "#999",
			"btn_color" : "#212121",
			"btn_color2" : "#fff",
			"btn_background" : "#00B8FF",
			"btn_font_size" : "20",
			"btn_border_check" : "N",
			"btn_border_color" : "#00B8FF",
			"btn_border_width" : "1",
			"form_height" : "34",
			"form_width" : "150",
			"form_margin" : "10",
			"form_background" : "#fff",
			"form_border_color" : "#dadada",
			"form_border_width" : "1",
			"form_border_radius" : "3",
			"font_size" : "14",
			"font_color" : "#212121",
			"text_value" : "",
			"text_placeholder" : "",
			"icon_type" : "simple",
			"icon_class" : "icon-magnifier",
			"btn_icon_padding_lr" : "0",
			"btn_icon_padding_tb" : "0",
			"hover_color" : "#999",
			"btn_hover_color" : "#fff",
			"btn_hover_background" : "#05b2f5",
			"btn_hover_border_color" : "#05b2f5",
			"overlay_type_data" : {
				"window_background" : " rgba(0,0,0,0.5)",
				"window_color" : "#fff",
				"btn_type" : "type01",
				"btn_text" : "",
				"btn_icon_color" : "#fff",
				"btn_icon_hover_color" : "rgba(255,255,255,0.5)",
				"btn_color" : "#212121",
				"btn_color2" : "#fff",
				"btn_background" : "#00B8FF",
				"btn_font_size" : "14",
				"btn_border_check" : "N",
				"btn_border_color" : "#00B8FF",
				"btn_border_width" : "1",
				"form_height" : "34",
				"form_width" : "150",
				"form_margin" : "10",
				"form_background" : "#fff",
				"form_border_color" : "#dadada",
				"form_border_width" : "1",
				"form_border_radius" : "3",
				"font_size" : "14",
				"font_color" : "#212121",
				"text_value" : "",
				"text_placeholder" : "",
				"icon_type" : "simple",
				"icon_class" : "icon-magnifier",
				"btn_icon_padding_lr" : "10",
				"btn_icon_padding_tb" : "4",
				"hover_color" : "#999",
				"btn_hover_color" : "#fff",
				"btn_hover_background" : "#05b2f5",
				"btn_hover_border_color" : "#05b2f5"
			},
			"device_type" : "m",
			"link" : ""
		};

		$(function() {
			var header_center_colgroup_s201909236d5ade6137c4b = new HEADER_CENTER_COLGROUP();
			header_center_colgroup_s201909236d5ade6137c4b.init(
					's201909236d5ade6137c4b', {
						"top_bottom_margin" : "0",
						"col_margin" : "10",
						"design_setting_margin" : "N",
						"border_width" : "1",
						"border_style" : "solid",
						"border_color" : "#e7e7e7",
						"vertical-align" : "middle",
						"scroll_fixed" : "Y",
						"overlay_type_data" : {
							"top_bottom_margin" : "0",
							"col_margin" : "10",
							"design_setting_margin" : "Y",
							"border_width" : "0",
							"border_style" : "solid",
							"border_color" : "rgba(255, 255, 255, 0.3)",
							"vertical-align" : "middle",
							"scroll_fixed" : "N",
							"background_repeat" : "",
							"background_position" : "",
							"color" : "",
							"background_image" : ""
						},
						"left_width" : "75",
						"center_width" : "0",
						"right_width" : "75",
						"height" : "49",
						"background_repeat" : "",
						"background_position" : "",
						"color" : "",
						"left_right_margin" : "15",
						"left_right_margin_mobile" : "10",
						"background_image" : "",
						"background_color" : "#ffffff",
						"extend" : "N"
					})
		});

		var change_animate_list = {
			"slide" : {
				"name" : "Slide",
				"in" : false,
				"out" : false
			},
			"fade" : {
				"name" : "Fade",
				"in" : "fadeIn",
				"out" : "fadeOut"
			},
			"fadedown" : {
				"name" : "Fade Down",
				"in" : false,
				"out" : "fadeOutDown"
			},
			"slidedown" : {
				"name" : "Slide Down",
				"in" : "slideInDown",
				"out" : "slideOutDown"
			},
			"slidedown2" : {
				"name" : "Slide Down2",
				"in" : false,
				"out" : "slideOutDown"
			}
		};
		var visual_01 = function() {
			var code;
			var $visual, $inside, $visual_wrap;
			var options;
			var is_site_page;
			var default_option = {
				animate : false,
				paging_btn : 'Y',
				m_ratio : 'N',
				prev_next_btn : 'N',
				section_auto_change : 'Y',
				show_snow : 'N',
				slide_data : {},
				effect_time : 0.7,
				effect_wait : 4,
				random_btn : 'N'
			};
			var full_view_none_image = false;

			var init = function(c, option, st) {
				code = c;
				$visual_wrap = $('#' + code);
				$visual = $('#visual_' + code);
				is_site_page = st;
				options = $.extend({}, default_option, option);
				var is_mobile = "";

				if (is_site_page) {
					runVideo();
					if (options.fullpage_mode == 'Y') {
						var pc_full_page_visual = ($visual_wrap
								.attr('doz_mobile_section') === 'N' && $visual_wrap
								.attr('doz_fullpage') === 'Y');
						var mobile_full_page_visual = ($visual_wrap
								.attr('doz_mobile_section') === 'Y' && $visual_wrap
								.attr('doz_fullpage') === 'Y');
						if (mobile_full_page_visual || pc_full_page_visual) {
							runFullPage();
						}

					}
				}

				if (typeof IS_MOBILE == 'undefined')
					var IS_MOBILE = false;

				if (typeof IS_IE == 'undefined')
					var IS_IE = false;
				var doz_preview = $('body').data('preview') == 'Y';
				if (options.full_screen == 'Y'
						&& (IS_IE || doz_preview || is_mobile))
					runFullScreen(code);

				if (options.fullpage_mode == 'Y') {
					var preview_mode = $('#preview_mode_bar');
					var doz_header = $('#doz_header');
					if (preview_mode.find('._temp').attr('style') == 'display: block;'
							&& !is_mobile) {
						preview_mode.css('position', 'absolute');
						doz_header.css('top', '50px')
					}
					full_view_none_image = true;
				} else {
					if (options.slide_data.length > 1)
						runHeaderSlide();
					if (options.slide_data.length <= 1)
						$visual.find('._slide .owl-item').css('float', 'none')
				}

			};

			var runHeaderSlide = function() {
				var anitame = {
					'in' : false,
					'out' : false
				};
				var navtext_left = $('<i aria-hidden="true" class="btl bt-angle-left"></i>');
				var navtext_right = $('<i aria-hidden="true" class="btl bt-angle-right"></i>');

				if (typeof options.animate != 'undefined'
						&& options.animate !== false) {
					if (typeof change_animate_list[options.animate] != 'undefined') {
						anitame = change_animate_list[options.animate];
					}
				}
				if (typeof options.effect_wait == 'undefined') {
					options.effect_wait = 4;
				}
				if (typeof options.effect_time == 'undefined') {
					options.effect_time = 0.7;
				}

				if (options.paging_btn == 'Y') {
					var paging_style_type = "st00";
					var paging_default_style_type = "st00";
					var paging_active_style_type = "st00";

					switch (paging_style_type) {
					case 'st00':
						switch (paging_default_style_type) {
						case 'st00':
							$visual.toggleClass(
									'paging_type_dot paging_type_dot01', true);
							break;
						case 'st01':
							$visual.toggleClass(
									'paging_type_dot paging_type_dot02', true);
							break;
						}
						break;
					case 'st01':
						$visual.toggleClass('paging_type_big_dot', true);
						break;
					case 'st02':
						$visual.toggleClass('paging_type_line', true);
						break;
					case 'st03':
						switch (paging_active_style_type) {
						case 'st00':
							$visual.toggleClass(
									'paging_type_count paging_type_count01',
									true);
							break;
						case 'st01':
							$visual.toggleClass(
									'paging_type_count paging_type_count02',
									true);
							break;
						case 'st02':
							$visual.toggleClass(
									'paging_type_count paging_type_count03',
									true);
							break;
						}
						break;
					}
				}
				if (options.prev_next_btn == 'Y') {
					var nav_style_type = "st00";
					var nav_type_angle = "round";
					var nav_type_arrow = "normal";
					var nav_type_long_arrow = "normal";
					var nav_type_caret = "normal";

					$visual
							.toggleClass('custom_nav nav_type_'
									+ nav_style_type);
					switch (nav_style_type) {
					case 'st00':
						switch (nav_type_angle) {
						case 'normal':
							break;
						case 'round':
							$visual.toggleClass('nav_round');
							break;
						case 'square':
							$visual.toggleClass('nav_square');
							break;
						}
						break;
					case 'st01':
						switch (nav_type_arrow) {
						case 'normal':
							break;
						case 'round':
							$visual.toggleClass('nav_round');
							break;
						case 'square':
							$visual.toggleClass('nav_square');
							break;
						}
						break;
					case 'st02':
						switch (nav_type_long_arrow) {
						case 'normal':
							break;
						case 'round':
							$visual.toggleClass('nav_round');
							break;
						case 'square':
							$visual.toggleClass('nav_square');
							break;
						}
						break;
					case 'st03':
						switch (nav_type_caret) {
						case 'normal':
							break;
						case 'round':
							$visual.toggleClass('nav_round');
							break;
						case 'square':
							$visual.toggleClass('nav_square');
							break;
						}
						break;
					case 'st04':
						$visual.toggleClass('nav_text');
						break;
					}
				}

				$(function() {
					$visual
							.find('._slide')
							.owlCarousel(
									{
										'animateIn' : anitame['in'],
										'animateOut' : anitame.out,
										'loop' : true,
										'autoplay' : options.section_auto_change == 'Y',
										'smartSpeed' : options['effect_time'] * 1000,
										'autoplayTimeout' : options['effect_wait'] * 1000,
										'nav' : options.prev_next_btn == 'Y',
										'navigation' : options.prev_next_btn == 'Y',
										'navigationText' : [ navtext_left,
												navtext_right ],
										'dots' : options.paging_btn == 'Y',
										'navText' : [ "", "" ],
										'items' : 1,
										'onInitialized' : function() {
											if (typeof options.slide_data[0].show_snow == 'undefined') {
												$visual_wrap.find(
														'.snowfall_container')
														.hide();
											} else {
												if (options.slide_data[0].show_snow == 'Y') {
													$visual_wrap
															.find(
																	'.snowfall_container')
															.show();
												} else {
													$visual_wrap
															.find(
																	'.snowfall_container')
															.hide();
												}
											}
										}
									})
							.on(
									'changed.owl.carousel',
									function(event) {
										var ind = event.item.index - 2;
										if (ind > event.item.count - 1)
											ind = ind - event.item.count;
										if (ind < 0)
											ind = event.item.count - 1;
										if (typeof options.slide_data[ind].show_snow == 'undefined') {
											$visual_wrap.find(
													'.snowfall_container')
													.hide();
										} else {
											if (options.slide_data[ind].show_snow == 'Y') {
												$visual_wrap.find(
														'.snowfall_container')
														.show();
											} else {
												$visual_wrap.find(
														'.snowfall_container')
														.hide();
											}
										}
									});
				});

				$(window).on('resize.header resize.headero resize.viewport',
						function() {
							carouselResize();
						});

				setTimeout(function() {
					carouselResize();
				}, 1000);
			};

			var carouselResize = function() {
				if (options.slide_data.length > 0) {
					var owl = $visual.find('._slide').data('owlCarousel');
					if (typeof owl != 'undefined') {
						owl.onResize();
					}
				}
			};

			var runFullScreen = function() {
				var doz_preview = $('body').data('preview') == 'Y';
				var $visual_height = $visual.find('._visual_height');
				if (doz_preview)
					var height = 700;
				else
					var height = $(window).height();

				$visual_height.height(height);
				$visual_height.closest('._op').css('height', height + 'px');

				$(window).off('resize.visual_' + code).on(
						'resize.visual_' + code,
						function() {
							if (doz_preview)
								var height = 700;
							else
								var height = $(window).height();

							$visual_height.height(height);
							$visual_height.closest('._op').css('height',
									height + 'px');
						});

			};
			var runVideo = function() {
				$visual.find('._video').lightGallery({
					controls : false,
					zoom : false,
					fullScreen : false,
					download : false,
					counter : false,
					hash : false
				});
			};

			var runFullPage = function() {
				$(function() {
					var resize_flag = false;
					$(window).resize(function() {
						var width = $(this).outerWidth();
						if (width < 992) {
							if (!resize_flag) {
								setFullPage("mobile");
								resize_flag = true;
							}
						} else {
							if (resize_flag) {
								setFullPage("pc");
								resize_flag = false;
							}
						}
					});
				});
				setFullPage($(window).outerWidth() < 992 ? "mobile" : "pc");
			};

			function setFullPage(type) {
				var is_mobile = "";
				var $obj = null;
				var $fullpage_pc_section = $(".fullpage_section.pc_section");
				var $fullpage_mobile_section = $(".fullpage_section.mobile_section");
				var $mobile_section = $(".mobile_section");

				if (type === "pc") {
					$obj = $fullpage_pc_section.length > 0 ? $fullpage_pc_section
							: null;
				} else {
					if ($fullpage_mobile_section.length > 0) {
						$obj = $fullpage_mobile_section;
					} else {
						$obj = $fullpage_pc_section;
					}
				}

				if (typeof $.fn.fullpage != 'undefined'
						&& typeof $.fn.fullpage.destroy != 'undefined')
					$.fn.fullpage.destroy('all');
				if ($obj !== null) {
					var code = $obj.attr('id');
					$obj
							.find('._fullpage')
							.fullpage(
									{
										navigation : options.paging_btn == 'Y',
										navigationPosition : 'right',
										afterLoad : function(anchorLink, index) {
											var ind = index - 1;
											$('#fp-nav').addClass(code);
											try {
												if (typeof options.slide_data[ind].fullpage_video_url != 'undefined'
														&& options.slide_data[ind].fullpage_video_url !== ''
														&& !is_mobile) {
													var fullpage_video_id = getVideoId(options.slide_data[ind].fullpage_video_url);
													if (typeof fullpage_video_id != 'undefined') {
														if (typeof fullpage_video_id['youtube'] != 'undefined'
																&& fullpage_video_id['youtube'][1] != '') {
															var yt_play = setInterval(
																	function() {
																		if (typeof yt_player[options.slide_data[ind].code].playVideo == 'undefined')
																			return;
																		if (yt_player[options.slide_data[ind].code]
																				.playVideo())
																			clearInterval(yt_play);
																	}, 500);
														} else if (typeof fullpage_video_id['vimeo'] != 'undefined'
																&& fullpage_video_id['vimeo'][1] != '') {
															var vimeo_play = setInterval(
																	function() {
																		if (typeof vimeo_player[options.slide_data[ind].code].playVideo == 'undefined')
																			return;
																		if (vimeo_player[options.slide_data[ind].code]
																				.playVideo())
																			clearInterval(vimeo_play);
																	}, 500);
														}
													}
												}

												if (typeof options.slide_data[ind].show_snow == 'undefined') {
													$obj
															.find(
																	'.snowfall_container')
															.hide();
												} else {
													if (options.slide_data[ind].show_snow == 'Y') {
														$obj
																.find(
																		'.snowfall_container')
																.show();
													} else {
														$obj
																.find(
																		'.snowfall_container')
																.hide();
													}
												}
											} catch (error) {
											}
										}
									});
					$obj.on('click', '._modal_open_btn', function() {
						$.fn.fullpage.setAllowScrolling(false);
						$.fn.fullpage.setKeyboardScrolling(false);
					});
					$('body').on('click', '.modal', function() {
						$.fn.fullpage.setAllowScrolling(true);
						$.fn.fullpage.setKeyboardScrolling(true);
					});
				}
			}

			return {
				init : function(code, option, st) {
					init(code, option, st);
				},
				'carouselResize' : function() {
					carouselResize();
				}
			};

		};

		var visual_s201909236184de126635f = new visual_01();
		visual_s201909236184de126635f
				.init(
						's201909236184de126635f',
						{
							"d" : "",
							"slide_data" : [ {
								"code" : "L3637NOh55",
								"order_no" : "1",
								"background_color" : "#e6e4df",
								"upload_image" : {
									"idx" : "10233090",
									"member" : "",
									"code" : "f201909247f80a73f19dbb",
									"site_code" : "S201909233ec3d6762dffd",
									"tmp_idx" : "",
									"target_code" : "s201909236184de126635f",
									"target" : "section",
									"name" : "378f73cba30c4.jpg",
									"org_name" : "IMG_7610.JPG",
									"url" : "S201909233ec3d6762dffd\/378f73cba30c4.jpg",
									"down_cnt" : "0",
									"type" : "image\/jpeg",
									"size" : "3789137",
									"img_height" : "3000",
									"img_width" : "2250",
									"version_data" : "",
									"wtime" : "",
									"mtime" : "",
									"error" : "",
									"img_ratio" : "1.33333333333",
									"thumbnail_img" : "20190924\/cb3883ca43d08.jpg"
								},
								"text" : "<h1 style=\"text-align: center;\"><span style=\"font-size: 30px;\">small things. collect. select.<\/span><\/h1><p style=\"text-align: center; margin-bottom:20px;\"><span style=\"font-size: 13px;\">select and introduce a variety of interior design products from all over the world<br>to make every moment of our daily life twinkle<\/span><\/p><p style=\"text-align: center;\"><a class=\"btn btn-sm\" href=\"\/shop\">shop now<\/a><\/p>",
								"background_position" : "50% 50%",
								"background_repeat" : ""
							} ],
							"color" : "rgba(255,255,255,1)",
							"overlay_color" : "rgba(214, 195, 178, 0)",
							"animate" : "fade",
							"height" : "761",
							"prev_next_btn" : "Y",
							"paging_btn" : "Y",
							"button_color" : "rgba(255,255,255,1)",
							"button_background_color" : "rgba(255,255,255,0)",
							"button_border_color" : "rgba(255,255,255,0.48)",
							"button_hover_color" : "rgba(255,255,255,1)",
							"button_hover_background_color" : "rgba(52, 30, 6, 0.25)",
							"button_hover_border_color" : "rgba(255, 255, 255, 0.6)",
							"text_align" : "middle",
							"effect_wait" : "4",
							"effect_time" : "0.7",
							"default_mode" : "Y",
							"fullpage_mode" : "N",
							"fullpage_text" : "",
							"section_auto_change" : "Y",
							"random_btn" : "N",
							"m_ratio" : "Y",
							"video_url" : "",
							"full_screen" : "Y",
							"mobile_hide" : "N"
						}, true);
		$("#visual_s201909236184de126635f").data('visual_script',
				visual_s201909236184de126635f);

		$("#text_w2019092321e59ba146ef3").find("._table_responsive").addClass(
				"table").wrap($("<div />").addClass("table-responsive"));

		$(function() {
			var $list_wrap = $('#container_w201909239f47cdcc8c062');
			var set_margin = 12.5;
			var set_width = 400;
			var set_prod_list_count = 3;
			var $item_wrap = $list_wrap.find('._shop_item');
			var $section_obj = $list_wrap.closest('div[doz_type=section]');
			var extend_section = $section_obj.attr('doz_extend') == 'Y';
			var extend_count = $list_wrap.hasClass('extend_count');

			function shopListResize() {
				$list_wrap.css({
					'margin' : '0 -' + set_margin + 'px'
				});
				if ($item_wrap.length === 0)
					return;
				var real_inner_width = parseFloat(window
						.getComputedStyle($list_wrap.get(0)).width);
				var inner_width = $list_wrap.innerWidth();

				if (extend_section && !extend_count) // 섹션 확장이면서 갯수 유지가 아니면
					set_prod_list_count = Math.floor(inner_width / set_width);

				if (inner_width < 750) {
					$item_wrap.css({
						'width' : ''
					});
					$list_wrap.css('visibility', 'visible');
					return;
				}

				var sss = Math.floor(real_inner_width / set_prod_list_count);
				$item_wrap.css({
					'width' : sss,
					'padding' : '0 ' + set_margin + 'px'
				});
				$list_wrap.css('visibility', 'visible');
			}

			$('#container_w201909239f47cdcc8c062').imagesLoaded().always(
					function(ins) {
						shopListResize();
						shopListHeight();

						$list_wrap.find('img._org_img').lazyload({ // ie 속도 문제로 예외처리 되었으나, http 환경에서 DOM7009(이미지 디코드 불가)에러로 인해 엑스박스가 나오는 문제로 롤백
							threshold : 100,
							effect : "fadeIn"
						});
					});
			$(window).on('resize.shop_list', function() {
				shopListResize();
				shopListHeight();
			});

			$('body').off('gridChange.w201909239f47cdcc8c062').on(
					'gridChange.w201909239f47cdcc8c062', function() {
						$(window).trigger('shop_width.w201909239f47cdcc8c062');
						shopListResize();
						shopListHeight();
					});

			function shopListHeight() {
				$item_wrap.height('auto');
				var be = 0;
				var ar = [];
				$item_wrap.each(function() {
					if (be == $(this).position().top) {
						ar.push($(this));
					} else {
						var height = 0;
						$.each(ar, function(e, $o) {
							if ($o.height() > height)
								height = $o.height();
						});
						$.each(ar, function(e, $o) {
							$o.height(height);
						});
						ar = [];
						ar.push($(this));
						be = $(this).position().top;
					}
				});
			}
		});

		$("#text_w201909237d0d74c4f20aa").find("._table_responsive").addClass(
				"table").wrap($("<div />").addClass("table-responsive"));

		$(function() {
			var img_w20190924bb631824c3ed0 = new IMAGE_RESIZE();
			img_w20190924bb631824c3ed0
					.init(
							'w20190924bb631824c3ed0',
							{
								"img_width" : 1191,
								"img_height" : 159,
								"img_ratio" : "0.064",
								"img_init" : "N",
								"url" : "S201909233ec3d6762dffd\/09f00bb03f4fc.png",
								"description" : "",
								"hover_description" : "",
								"text_position" : "bottom",
								"hover_text_position" : "same",
								"overlay_color" : "rgba(0, 0, 0, 0)",
								"hover_overlay_color" : "rgba(0, 0, 0, 0)",
								"text_color" : "#fff",
								"hover_text_color" : "#fff",
								"text_size" : "14",
								"hover_text_size" : "14",
								"show_over" : "N",
								"link" : "",
								"link_code" : "",
								"use_link_code" : "N",
								"new_window" : "N",
								"circle" : "N",
								"lightbox" : "N",
								"org_size" : "Y",
								"use_hd" : "N",
								"grayscale" : "N",
								"hover_grayscale" : "N",
								"image_rendering" : "Y",
								"border_radius" : "N",
								"hide_default_img" : "N",
								"border_radius_value" : "7",
								"text_align" : "0 50%",
								"hover_text_align" : "0 50%",
								"ani_type" : "none",
								"ani_duration" : "0.7",
								"ani_delay" : "0",
								"idx" : "10233584",
								"member" : "",
								"code" : "f201909247a71be4f10d95",
								"site_code" : "S201909233ec3d6762dffd",
								"tmp_idx" : "",
								"target_code" : "w20190924bb631824c3ed0",
								"target" : "image_widget",
								"name" : "09f00bb03f4fc.png",
								"org_name" : "Artboard 1@2x.png",
								"down_cnt" : "0",
								"type" : "image\/png",
								"size" : "5877",
								"version_data" : "",
								"wtime" : "",
								"mtime" : "",
								"error" : "",
								"doz_img" : "N",
								"is_image_edit" : "N",
								"grid_height" : "80",
								"thumb_url" : "https:\/\/cdn.imweb.me\/thumbnail\/20190924\/f7b2cf514f423.png",
								"hover_thumb_url" : "https:\/\/cdn.imweb.me\/thumbnail\/20190924\/f7b2cf514f423.png",
								"hover_img_url" : "S201909233ec3d6762dffd\/09f00bb03f4fc.png"
							});
			$('#img_w20190924bb631824c3ed0').data('image_resize',
					img_w20190924bb631824c3ed0);
		});

		$("#text_w20190923f4efeecd95b9d").find("._table_responsive").addClass(
				"table").wrap($("<div />").addClass("table-responsive"));
	</script>
	<script>
		$(window.document).on("contextmenu", function(event) {
			return false;
		});
		$(document).on('keydown', function() {
			if (event.ctrlKey && event.keyCode == 67) { // ctrl + c
				event.keyCode = 0;
				event.returnValue = false;
				return false;
			}
			if (event.metaKey && event.keyCode == 67) { // command + c
				event.keyCode = 0;
				event.returnValue = false;
			}
		});
	</script>
	<script>
		ALARM_BADGE
				.addBadgeArea(
						$('#slide-alarm'),
						'<i aria-hidden="true" class="icon-bell"></i><sup class="badge style-danger _badge_cnt">{count}</sup>');
	</script>
	<script>
		$(function() {
			TOKEN.makeToken(3600, "visit_add", function(token, token_key) {
				SITE_VISIT_LOG.addVisitLog(document.referrer, token, token_key,
						'm20190923404f1ba08b9b9');
			});
		});
	</script>
	<script>
		ALARM_MENU.init();
		SITE_ANIMATION.init('N');

		if (IS_IOS_APP == "Y") {
		}
		$(function() {
			$('body').lightGallery({
				selector : '._image_widget_lightbox',
				thumbnail : true,
				animateThumb : false,
				swipeThreshold : 20,
				showThumbByDefault : false,
				mode : 'lg-fade',
				speed : 200
			});

			$('[data-toggle="tooltip"]').tooltip();

		});

		$(document)
				.ready(
						function() {
							$('body').removeClass('page_ready');
							$('._bookmark')
									.on(
											'click',
											function(e) {
												var bookmarkURL = window.location.href;
												var bookmarkTitle = document.title;
												var triggerDefault = false;

												if (window.sidebar
														&& window.sidebar.addPanel) {
													// Firefox version < 23
													window.sidebar.addPanel(
															bookmarkTitle,
															bookmarkURL, '');
												} else if ((window.sidebar && (navigator.userAgent
														.toLowerCase().indexOf(
																'firefox') > -1))
														|| (window.opera && window.print)) {
													// Firefox version >= 23 and Opera Hotlist
													var $this = $(this);
													$this.attr('href',
															bookmarkURL);
													$this.attr('title',
															bookmarkTitle);
													$this
															.attr('rel',
																	'sidebar');
													$this.off(e);
													triggerDefault = true;
												} else if (window.external
														&& ('AddFavorite' in window.external)) {
													// IE Favorite
													window.external
															.AddFavorite(
																	bookmarkURL,
																	bookmarkTitle);
												} else {
													// WebKit - Safari/Chrome
													alert(LOCALIZE
															.설명_즐겨찾기등록키안내((navigator.userAgent
																	.toLowerCase()
																	.indexOf(
																			'mac') != -1 ? 'Cmd'
																	: 'Ctrl')
																	+ '+D'));
												}

												return triggerDefault;
											});

						});
	</script>


	<script>
		if (LOCAL_STORAGE.getLocalStorage('AUTO_LOGOUT_TIME'))
			LOCAL_STORAGE.deleteLocalStorage('AUTO_LOGOUT_TIME');
		if (LOCAL_STORAGE.getLocalStorage('IS_AUTO_LOGOUT'))
			LOCAL_STORAGE.deleteLocalStorage('IS_AUTO_LOGOUT');
	</script>


</body>
</html>