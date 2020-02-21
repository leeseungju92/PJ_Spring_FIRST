
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퍼스트:부동산</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">
<style type="text/css">
div.header_wrap {
	width: 100%;
	background-color: white;
	box-shadow: 0 0 1px 1px rgba(20, 23, 28, .1), 0 3px 1px 0
		rgba(20, 23, 20, .1);
	z-index: 999; /*숫자가 크면 클수록 무조건 맨 앞에 오는놈*/
}

div.header_content {
	width: 1400px;
	margin: 0 auto;
	height: 90px;
	box-sizing: border-box;
	/*border-left: 1px solid red;
			border-right: 1px solid red;*/
	/*background-color: blue;    내용물이 들어올 공간*/
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header_content_logo {
	
}

.header_content_search {
	
}

.header_content_search_group {
	display: flex;
	align-items: center;
	background-color: #f2f3f5;
	border-radius: 2px;
}

.header_content_search_input {
	background-color: transparent; /*색깔을 투명으로 줬다.*/
	border-color: transparent;
	height: 44px;
	font-size: 13px;
	border-radius: 2px;
	padding: 10px 12px;
	outline: none; /*input태그 focus시 파랑테두리 삭제해준다.*/
}

.header_content_search_btn {
	border-color: transparent;
	background-color: transparent;
	width: 44px;
	height: 44px;
	cursor: pointer;
	color: #FCBE32;
	border-top-right-radius: 2px; /*돋보기에 커서올렸을때 오르쪽모서리만 둥글게 해주는기능*/
	border-bottom-right-radius: 2px;
}

.header_content_search_btn:hover {
	background-color: #FCBE32;
	color: white;
}

.header_content_nav { /*파는 제품목록이 가로로 붙게하는 방법*/
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 300px;
}

.header_content_nav>div { /*w제품목록 빨간줄로 나누기*/
	/* border: 1px solid red; */
	padding: 10px 0;
}

.header_content_member {
	/*width: 160px;*/ /*주석처리하면 쇼핑카트 들어가도 로그인창이 안깨진다.*/
	display: flex; /*가로로 붙음 로그인과 회원가입이  플렉스는 디폴트가 가로*/
	justify-content: space-between;
	align-items: center;
	flex-direction: row; /*default(생략가능)*/
}

.header_content_member>div {
	padding: 10px 0px 10px 3px;
}

.header_content_dropdown_group {
	position: relative;
}

.header_content_dropdown_group>a {
	padding: 12px 15px;
	font-weight: 400;
	border: 1px solid transparent;
	border-radius: 2px;
	height: 45px;
	color: #506763;
	line-height: 19px;
	display: inline-block;
}

.header_content_dropdown_wrap:hover>div>a, /*호버 한번에 두개 주는법*/
	.header_content_member_cart:hover>a {
	background-color: rgba(20, 23, 28, .05);
	border-color: rgba(20, 23, 28, .05);
}

.header_content_dropdown_wrap:hover .header_dropdown {
	display: block;
}

.header_content_member_cart>a {
	display: inline-block;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	color: #506763;
	border: 1px solid transparent;
	text-align: center;
	padding: 12px;
	line-height: 19px;
}

.header_content_logo_img {
	max-width: 90px;
	vertical-align: middle;
}

.header_content_logo_text {
	font-size: 25px;
	font-weight: bold;
	vertical-align: middle;
	font-family: 'Noto Sans KR', sans-serif;
}

.header_dropdown_menu {
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
	box-shadow: 0 4px 16px rgba(20, 23, 28, .25);
	background-color: white;
	padding: 10px 0;
	/*	display: none;  이거 있으면 마이페이지 꼬리만나오고 아래 창은 안나온다.*/
}

.header_dropdown_menu a {
	display: inline-block;
	font-size: 15px;
	color: #505763;
	text-align: center;
	padding: 5px 15px;
	font-weight: 400;
	width: 130px;
	position: relative;
	z-index: 100;
}

.header_dropdown_menu a:hover {
	color: #007791;
	background-color: #f2f3f5;
}

.header_dropdown {
	position: absolute;
	top: 52px;
	left: 0;
	display: none;
}

.arrow {
	position: absolute;
	top: -5px;
	left: 4px;
	width: 15px;
	height: 15px;
	transform: rotate(45deg);
	background-color: white;
	border-color: transparent transparent #fff transparent;
	z-index: 99;
}

/* 모달 로그인 창*/
.modal_wrap {
	position: fixed;
	z-index: 1000;
	background-color: rgba(0, 0, 0, 0.4);
	overflow: auto;
	width: 100%;
	height: 100%;
	display: none; /* 이줄포함 밑 두줄 모달창 가운데로 오게 해준다.*/
	justify-content: center;
	align-items: center;
}

.modal_content {
	position: relative;
	width: 420px;
	height: 458px;
	padding: 60px 70px;
	background-color: white;
	border: 1px solid #e5e5e5;
	font-size: 16px;
	vertical-align: top;
	box-sizing: border-box;
	text-align: left;
}

#kakaoServiceLogo {
	display: inline-block;
	width: 88px;
	height: 27px;
	line-height: 1;
	vertical-align: top;
}

.ir_wa {
	overflow: hidden;
	display: block;
	position: relative;
	width: 100%;
	height: 100%;
}

h1 {
	margin: 0;
	padding: 0;
	color: #3885ca;
	font-size: 28px;
	font-weight: bold;
}

/*하단부옵션*/
.info_user, .list_user {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
}

.info_user a {
	color: #4c4c4c;
	text-decoration: none;
	cursor: pointer;
}

.wrap_btn .btn_g {
	display: block;
	width: 100%;
	height: 50px;
	padding: 0;
	border: 0;
	background-color: #3885ca;
	font-size: 15px;
	border-radius: 4px;
	box-sizing: border-box;
}

.item_inp {
	width: 100%;
	padding: 15px 0 15px 0;
	border: 0;
	border-bottom: 2px solid #3885ca;
	font-size: 18px;
	color: #3885ca;
	margin-bottom: 8px;
}

.btn_g {
	margin: 20px 0 10px 0;
}

#state {
	font-size: 13px;
	position: relative;
}

td {
	height: 26px;
}

#state>label {
	background: url('${path}/resources/img/check_off.gif') no-repeat;
	display: block;
	height: 26px;
	line-height: 26px;
	padding-left: 30px;
}

#state>input {
	visibility: hidden;
	position: absolute;
	right: 1px;
	width: 22px;
	height: 22px;
	margin: -11px;
}

#state>input:checked+label {
	background-image: url('${path}/resources/img/check_in.png');
}

.fix_btn>button {
	color: rgb(142, 142, 142);
	border: none;
	background: white;
	font-size: 30px;
	cursor: pointer;
	outline: none;
}

.fix_btn>button:hover {
	color: red;
}

.fix_btn {
	position: absolute;
	right: 8px;
	top: 8px;
}

.pw_eye {
	position: absolute;
	color: #aaa;
	font-size: 17px;
	top: 17px;
	right: 7px;
	cursor: pointer;
	height: 45px;
	line-height: 45px;
	width: 30px;
	text-align: center;
}

div.content_wrap_inf {
	width: 100%;
	background-color: white;
}

div.content_wrap_main {
	width: 100%;
	background-color: white;
}


</style>
</head>
<body>

	<div class="modal_wrap">

		<div class="modal_content">
			<div class="fix_btn">
				<button class="close_btn" type="button">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<h1 id="kakaoServiceLogo" style="margin: 0 0 30px">
				<span class="ir_wa">FIRST</span>

			</h1>

			<div id="loginEmailField">

				<form name="" action="" method="post" class="frm_login">
					<div>


						<input id="login_id" class="item_inp item_tf" type="email"
							placeholder="id를 입력해주세요" name="" required>
						<div class="div_input" style="position: relative;">

							<input id="login_pw" class="item_inp item_tf" type="password"
								placeholder="pw를 입력해주세요" name="" required minlength="6"
								maxlength="18"> <span class="pw_eye"><i
								class="fas fa-eye-slash"></i></span>
						</div>

					</div>

					<div id="state">
						<input type="checkbox" id="loginck"> <label for="loginck"
							class="lable1">&nbsp 로그인 상태유지</label>
					</div>


					<div class="wrap_btn">
						<button class="btn_g" type="submit" tabindex="3">로그인</button>
					</div>
				</form>
			</div>




			<div class="info_user">
				<div>
					<a href="${path}/member/constract" class="link_join">회원가입</a>
				</div>
				<ul class="list_user">
					<li><a href="#" class="link_user">계정찾기</a></li>
					<b>&nbsp|&nbsp</b>
					<li><a href="#" class="link_user">비밀번호찾기</a></li>
				</ul>
			</div>
		</div>
	</div>


	


	<header>
		<div class="header_wrap">
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#"> <img class="header_content_logo_img"
						src="${path}/resources/img/FIRSTV3.png"> <span
						class="header_content_logo_text"></span>
					</a>
				</div>

				<div class="header_content_search">
					<form name="frm_search" action="" method="GET" style="margin: 0;">
						<div class="header_content_search_group">
							<input type="text" placeholder="무엇이든 검색하기" name="keyword"
								class="header_content_search_input">
							<button type="button" class="header_content_search_btn">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			<div class=header_content_nav>
				<div class="header_content_dropdown_wrap">
					<div class="header_content_dropdown_group">
						<a href="#">서초구</a>
						<div class="header_dropdown">
							<div class="arrow"></div>
							<ul class="header_dropdown_menu">
								<li><a href="#">월세</a></li>
								<li><a href="#">전세</a></li>
								<li><a href="#">매매</a></li>
								<li><a href="#">경공매</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="header_content_dropdown_wrap">
					<div class="header_content_dropdown_group">
						<a href="#">강남구</a>
						<div class="header_dropdown">
							<div class="arrow"></div>
							<ul class="header_dropdown_menu">
								<li><a href="#">월세</a></li>
								<li><a href="#">전세</a></li>
								<li><a href="#">매매</a></li>
								<li><a href="#">경공매</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="header_content_dropdown_wrap">
					<div class="header_content_dropdown_group">
						<a href="#">동작구</a>
						<div class="header_dropdown">
							<div class="arrow"></div>
							<ul class="header_dropdown_menu">
								<li><a href="#">월세</a></li>
								<li><a href="#">전세</a></li>
								<li><a href="#">매매</a></li>
								<li><a href="#">경공매</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="header_content_dropdown_wrap">
					<div class="header_content_dropdown_group">
						<a href="#" class="magicline">커뮤니티</a>
						<div class="header_dropdown">
							<div class="arrow"></div>
							<ul class="header_dropdown_menu">
								<li><a href="#">구매후기</a></li>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">질문게시판</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
				<div class="header_content_member">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#">마이페이지</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">구매내역</a></li>
									<li><a href="#">위시리스트</a></li>
									<li><a href="#">회원정보수정</a></li>
									<li><a href="#">고객센터</a></li>
									<li><a href="../include/deleteconstract.html">회원탈퇴</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div>
						<div class="header_content_member_cart">
							<a href="#"><i class="fas fa-shopping-cart"></i></a>
						</div>
					</div>
					<div>
						<button type="button" class="btn btn-basic login_open">로그인</button>
					</div>
					<a href="${path}/member/constract" style="margin-left: 3px;">
							<button type="button" id="header_btn_join" class="btn btn-primary">회원가입</button>
						</a>
				</div>
			</div>
		</div>
	</header>

</body>
<script type="text/javascript">
	// 제이쿼리 문법
	// $('선택자').옵션();
	//$('#test').css('color','green');
	//$=jquery
	//('#test')=선택자 (id가 test)
	//.css()=옵션 글자색 그린		
	//jquery 이벤트 문법 (클릭, 포커스, 블러등)
	//$(document).on('이벤트','선택자'function())
	$(document).on('click', '.login_open', function() {
		$('.modal_wrap').css('display', 'flex');
		$('#login_id').focus();
	});

	$(document).on(
			'click',
			'.close_btn',
			function() {
				$('.modal_wrap').css('display', 'none');
				$('.frm_login')[0].reset();
				$('.pw_eye').prev().attr('type', 'password');
				$('.pw_eye').html('<i class="fas fa-eye-slash"></i>').css(
						'color', '#AAA');
			});

	$(document).on('focus', '.item_inp', function() {
		$(this).css('border-bottom-color', '#FCBE32');
		$(this).css('outline', 'none');
	});
	$(document).on('blur', '.item_inp', function() {
		$(this).css('border-bottom-color', '#3885ca');
		$(this).css('outline', 'none');
	});
	

	$(document).on(
			'click',
			'.pw_eye',
			function() {
				var code = $(this).prev().attr('type');

				if (code == 'password') {
					$(this).prev().attr('type', 'text');
					$(this).html('<i class="fas fa-eye"></i>').css('color',
							'#666');
				} else {
					$(this).prev().attr('type', 'password');
					$(this).html('<i class="fas fa-eye-slash"></i>').css(
							'color', '#AAA');

				}

			});
</script>

</html>