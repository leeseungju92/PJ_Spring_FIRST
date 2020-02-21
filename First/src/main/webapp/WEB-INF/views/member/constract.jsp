<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>tumbland_contract.html</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<!-- favicon: 제목줄의 아이콘 -->	
	<style type="text/css">
		/* Common */
		/* 기본적으로 태그에 margin 또는 padding */
		* {
			box-sizing: border-box;
			font-family: Dotum, 돋움, Helvetica, sans-serif;
		}
		body, ul, h1, h2, h3, h4, h5, h6 {
			margin: 0; padding: 0; /* 기본적으로 마진 패딩있어서 제거 안그럼 디자인 깨져서나옴 */
		}
		body {
			background-color: #f5f6f7;
		}
		ul {
			list-style: none;
		}
		a {
			text-decoration: none;
			color: inherit;
		}
		.wrap {
			width: 768px;
			margin: 0 auto;
		}

		/* Header */
		#header {
			height: 169px;
			padding-top: 62px;
			position: relative;
		}
		#container {
			position: relative;
		}
		#footer {
			height: 81px;
			text-align: center;
			padding: 30px 0px 15px 0px;
		}
		.naver_logo {
			font-size: 2em;
		}
		.n_logo {
			display: block;
			width: 300px;
			height: 80px;
			/*width: 240px;*/
			/*height: 44px;*/
			background: url(${path}/resources/img/tumbland_logo_transparent_crop.png) 100% 50% no-repeat;
			background-size: 300px 80px;
			margin: 0 210px;
		}
		.lang {
			position: absolute;
			top: 14px;
			right: 0px;
		}
		.langselect {
			font-size: 12px;
			font-weight: 400;
			height: 30px;
			padding: 6px 8px 5px 7px;
			min-width: 98px;
			color: #333;
			border: 1px solid #ccc;
		}
		.lang > select {
			
			-webkit-appearance: none; /* 삼각형을 지워라 */
			background-color: white;
		}

		/* Container */
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.terms {
			margin-bottom: 20px;
			background-color: white;
			border: 1px solid #dadada;
		}
		.terms_span > input {
			position: absolute;
			right: 1px;
			top: 50%;
			width: 22px;
			margin-top: -11px;
			visibility: hidden;
		}
		.terms_p {
			display: block;
			padding: 15px;
			margin: 0px;
			position: relative;
		}
		.terms_span > label {
			
			display: block;
			line-height: 20px;
			height: 58px;
			top: -1px;
			font-style: 14px;
			font-weight: 700;
		}
		.terms_span {
			position: relative;
			display: block;
			height: 58px;
		}
		.terms_span > input:checked +label {
			
		}
		.terms_ul {
			padding-bottom: 7px;
		}
		.terms_ul_li1 {
			border-top: 1px solid #f0f0f0;
		}
		ul.terms_ul > li {
			display: block;
			padding: 13px 15px 7px;
		}
		.ul_li_span {
			position: relative;
			display: block;
			height: 24px;
		}
		.label1 {
			height: 24px;
			font-size: 14px;
			font-weight: 700;
			line-height: 24px;
			position: absolute;
			color: #333;
			top: 0px;
			left: 0px;
			width: 100%;
		}
		/* 로그인 상태 유지 아이콘 */
		.icon_check {
			/*display: inline-block;*/
			overflow: hidden;
			float: left;
			width: 20px;
			height: 20px;
			margin: 1px 8px 0 0;
			background: url(${path}/resources/img/ico_account.png);
			background-position: -30px -30px;
		}
		.ul_li_span > input:checked +label > .icon_check {
			/*background-position: 0 -30px;*/
			background: url(${path}/resources/img/ico_account_copy.png);
		}
		.terms_span > input:checked +label > .icon_check {
			/*background-position: 0 -30px;*/
			background: url(${path}/resources/img/ico_account_copy.png);
		}
		.terms_span > label > span {
			display: inline-block;
		}
		.terms_span > label > .icon_check {
			margin: 19px 8px 0 0;
		}
		.span_only {
			color: #FF8C94;
			font-size: 12px;
			font-weight: 400;
		}
		.ul_li_span > input {
			visibility: hidden;
			position: absolute;
			right: 1px;
			width: 22px;
			height: 22px;
			margin-top: -11px;
			top: 50%;
		}
		.ul_li_span > label {
			
			display: block;
		}
		.ul_li_span > input:checked +label {
			
		}
		.terms_box {
			position: relative;
			box-sizing: border-box;
			height: 88px;
			margin-top: 11px;
			padding: 8px 10px;
			border: 1px solid #f0f0f0;
			background-color: #f7f7f7;
			overflow: auto;
		}
		h3.article_title {
			font-size: 12px;
			font-weight: 700;
			line-height: 16px;
			color: #666;
		}
		.article > p {
			display: block;
			font-size: 12px;
			line-height: 16px;
			color: #666;
		}
		.span_select {
			color: #969696;
			font-size: 12px;
			font-weight: 400;
		}
		.err_check_msg {
			height: 24px;
			font-size: 12px;
			line-height: 14px;
			color: #f46665;
			display: block;
		}
		.err_check {
			display: none;
		}
		.btn_double_area {
			margin: 30px -5px 0px;
			overflow: hidden;
		}
		.btn_double_area > span {
			display: block;
			float: left;
			width: 50%;
		}
		.btn_type {
			width: 100%;
			margin: 0px 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 61px;
			display: block;
			box-sizing: border-box;
			height: 61px;
			padding-top: 1px;
			text-align: center;
		}
		.btn_default {
			color: #333;
			border: 1px solid #e7e7e7;
			background-color: #fff;
		}
		.btn_agree {
			color: #fff;
			border: 1px solid #FFADA6;
			background-color: #FFADA6;
		}
		.group_join {
			margin: 20px 0px 65px;
			text-align: center;
			color: #666;
			font-size: 12px;
		}
		.group_join > a {
			text-decoration: underline;
			color: #333;
		}

		/* footer */
		#footer {
			padding: 15px 0;
		}
		#footer > ul {
			margin: 0 auto 9px;
			text-align: center;
		}
		#footer * {
			font-size: 11px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer > ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li a:hover {
			color: #FF8C94;
			text-decoration: underline;
		}
		#footer ul li:first-child {
			border-left: 0px!important; /* !important : 제일 높은 우선순위. 왠만하면 안쓰시는걸 추천 */
		}
		#addr_logo {
			/*width: 63px;
			height: 12px;*/
			width: 100px;
			height: 30px;
		}
		#address {
			display: flex;
			justify-content: center;
			align-items: center;
			margin: 0 auto;
			text-align: center;
		}
		#address * {
			font: 9px verdana;
		}
		#address a {
			font-weight: bold;
		}
		#address a:hover {
			color: #FF8C94;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<header>
			<div id="header">
				<h1 class="naver_logo">
					<a href="../include/header.html" class="n_logo"><!-- <img src="${path}/resources/img/tumbland_logo_transparent_crop.png"> --></a>
				</h1>
				<div class="lang">
					<select class="langselect"> <!-- select태그 크롬:삼각형 다른웹브라우저 다른걸로 나옴 -->
						<option>한국어</option>
						<option>English</option>
						<option>中文(简体)</option>
						<option>中文(台灣)</option>
					</select>
				</div>
			</div>
		</header>
		<section>
			<div id="container">
				<form class="join_content"
				      name=""
				      action=""
				      >
					<div class="terms">
						<p class="terms_p">
							<span class="terms_span">
								<input type="checkbox" id="cbox">
								<label for="cbox">
									<span class="icon_check"></span>
									<span>
										이용약관, 개인정보 수집 및 이용,<br>
										위치정보 이용약관(선택), 프로모션 안내<br>
										메일 수신(선택)에 모두 동의합니다.
									</span>
								</label>
							</span>
						</p>
						<ul class="terms_ul">
							<li class="terms_ul_li1">
								<span class="ul_li_span">
									<input type="checkbox" id="li1box" class="ckboxs">
									<label for="li1box" class="label1">
										<span class="icon_check"></span>
										네이버 이용약관 동의<span class="span_only">(필수)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<h3 class="article_title">여러분을 환영합니다.</h3>
										<p>네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본<br>
										 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공<br>
										 하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스<br>
										 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의<br>
										 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</p>
									</div>
								</div>
							</li>

							<li class="terms_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="li2box" class="ckboxs">
									<label for="li2box" class="label1">
										<span class="icon_check"></span>
										개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<p>정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
										<h3 class="article_title">1. 수집하는 개인정보</h3>
									</div>
								</div>
							</li>

							<li class="terms_ul_li3">
								<span class="ul_li_span">
									<input type="checkbox" id="li3box" class="ckboxs">
									<label for="li3box" class="label1">
										<span class="icon_check"></span>
										위치정보 이용약관 동의<span class="span_select">(선택)</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.</p>
										<h3 class="article_title">제 1 조 (목적)</h3>
									</div>
								</div>
							</li>

							<li class="terms_ul_li4">
								<span class="ul_li_span">
									<input type="checkbox" id="li4box" class="ckboxs">
									<label for="li4box" class="label1">
										<span class="icon_check"></span>
										이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span>
									</label>
								</span>
							</li>
						</ul>
					</div>
					<div class="err_check">
						<span class="err_check_msg">네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>
					<div class="btn_double_area">
						<span><button type="button" id="con_btn_cancle" class="btn_type btn_default">취소</button></span>
						<span><button type="button" id="cons_btn_agree" class="btn_type btn_agree">확인</button></span>
					</div>
				</form>				

				<div class="group_join">
					회사, 동아리 등 단체에서 사용할 ID가 필요하세요? <a href="#">단체 회원 가입</a>
				</div>
			</div>
		</section>
		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>

				<div id="address">
					<span>
						<a href="../include/header.html">
							<img id="addr_logo" src="${path}/resources/img/tumbland_logo_transparent_crop.png">
						</a>
					</span>
					&nbsp;
					<span>Copyright</span>
					<span>ⓒ</span>
					<span><strong><a href="#">TUMBLAND Corp.</a></strong></span>
					<span>All Rights Reserved.</span>
				</div>
			</div>
		</footer>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#cbox').on('click', function(){
			var flag=$(this).is(':checked');
			if(flag ==true){
				$('.ckboxs').prop('checked' , true);
			} else{
				$('.ckboxs').prop('checked' , false);
			}
		});
		$('.ckboxs').on('click', function(){
			var cklen = $('.ckboxs:checkbox:checked').length;
			
			if(cklen != 4){
				$('#cbox').prop('checked' , false);
			} else{
				$('#cbox').prop('checked' , true);
			}
		});
		$('#cons_btn_agree').on('click' , function(){
			var agree_one = $('#li1box').is(':checked');
			var agree_two = $('#li2box').is(':checked');
			var agree_three = $('#li3box').is(':checked');
			var agree_four = $('#li4box').is(':checked');
			
			/*console.log('동의1:' + agree_one);
			console.log('동의2:' + agree_two);
			console.log('동의3:' + agree_three);
			console.log('동의4:' + agree_four);*/
			
			if(agree_one ==false || agree_two == false){
				$('.err_check').css('display','block');
				return false;
			}
			location.href='${path}/member/join?useon='+agree_one+'&primaryon='+agree_two+'&locon='+agree_three+'&eventon='+agree_four;
		});
		$('#con_btn_cancle').on('click' , function(){
			
			location.href='${path}/';			
		});
	});
	 
	
</script>
</html>