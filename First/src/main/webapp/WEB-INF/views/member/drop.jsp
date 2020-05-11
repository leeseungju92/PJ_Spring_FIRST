
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<title>퍼스트:회원약관</title>

<style type="text/css">
/*Common*/
/* 기본적으로 태그에 margin 또는 padding*/
* {
	margin: 0;
	padding: 0;
	background-color: white;
	box-sizing: border-box;
	font-family: Dotum, 돋움, Helvetica, sans_serif;
}

body, ul, h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
	background-color: white;
}

body {
	background-color: white;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.header {
	padding: 30px 0px 30px;
	position: relative;
}

.n_logo {
	display: block; /* 마진으로 채우기 위해*/
	width: 240px;
	height: 44px;
	font-size: 59px;
	letter-spacing: 6px;
	line-height: 44px;
	text-align: center;
	color: #3885ca;
	margin: auto; /**/
}

.join_content {
	width: 460px;
	margin: 0 auto;
}

.join_content {
	width: 460px;
	margin: 0 auto;
}
.join_err_msg {
			display: block;
			visibility: hidden;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
		}
.terms {
	margin-bottom: 20px;
	background-color: white;
	border: 1px solid #dadada;
}

.terms_span>input {
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

.terms_span>label {
	background: url(${path}/resources/img/check_off.gif) 100% 50% no-repeat;
	display: block;
	line-height: 28px;
	height: 28px;
	top: -1px;
	font-size: 14px;
	font-weight: 700;
}

.terms_span {
	position: relative;
	display: block;
	height: 28px;
}

.terms_span>input:checked+label {
	background-image: url(${path}/resources/img/check_in.png);
}

.container {
	background-color: white;
	position: relative;
	z-index: 20;
	max-width: 768px;
	margin: 0 auto;
}

.content {
	position: relative;
	padding: 32px 51px 95px;
}

.c_header {
	padding-bottom: 30px;
}

.sectiondelete {
	margin: 30px auto;
	/*background-color: white;*/
	font-size: 12px
}

#footer {
	padding: 15px 0;
}

#footer>ul {
	margin: 0 auto 9px;
	text-align: center;
}

#footer * {
	font-size: 11px;
	line-height: normal;
	list-style: none;
	color: #333;
}

#footer>ul>li {
	display: inline;
	padding: 0 5px 0 7px;
	border-left: 1px solid #dadada;
}

#footer>ul>li a:hover {
	color: #1fbe02;
	text-decoration: underline;
}

#footer ul li:first-child {
	border-left: 0px !important;
}

#addr_logo {
	width: 63px;
	height: 11px;
}

#address {
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
	color: #1fbc02;
}

.btn_double_area {
	margin: 30px 0 0px;
}

.btn_type {
	display: block;
	width: 100%;
	padding: 21px 0 17px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
}

.btn_agree {
	color: white;
	background-color: #3885ca;
}

* {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
	box-sizing: border-box;
}

body, h1, h3, h4, h5, h6, ul, p {
	margin: 0;
	padding: 0;
}

body {
	background-color: white;
	font-size: 12px;
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

.header {
	padding: 62px 0px 20px;
	position: relative;
}

.n_logo {
	display: block; /* 마진으로 채우기 위해*/
	width: 240px;
	height: 44px;
	font-size: 24px;
	font-weight: bold;
	line-height: 44px;
	text-align: center;
	color: black;
	margin: auto; /**/
}

.join_content {
	width: 460px;
	margin: 0 auto;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.join_title {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
	color: black;
}

.ps_box {
	display: flex;
	align-items: center;
	position: relative;
	width: 100%;
	height: 51px;
	border: 1px solid #dadada;
	padding: 10px 14px 10px 14px;
	background-color: #fff;
	vertical-align: top;
}

.int_id {
	padding-right: 110px;
}

.int_pass {
	padding-right: 40px;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	padding-right: 25px;
	line-height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
	z-index: 10;
}

.step_url {
	position: absolute;
	right: 13px;
	font-size: 15px;
	color: #8e8e8e;
}

.error_next_box {
	display: block;
	margin: 9px 0 -2px;
	font-size: 12px;
	line-height: 14px;
	text-align: center;
	color: red;
	height: 15px;
	display: none;
}

.pw_lock {
	background-image:
		url('https://static.nid.first.com/images/ui/join/m_icon_pw_step.png');
	background-repeat: no-repeat;
	background-size: 125px 75px;
	cursor: pointer;
	width: 24px;
	height: 24px;
	display: block;
}

.btn_agree {
	color: white;

}

.btn_double_area {
	margin: 30px 0 9px;
}

.btn_type {
	display: block;
	width: 100%;
	padding: 21px 0 17px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
}

#footer {
	padding: 15px 0;
}

#footer>ul {
	margin: 0 auto 9px;
	text-align: center;
}

#footer * {
	font-size: 11px;
	line-height: normal;
	list-style: none;
	color: #333;
}

#footer>ul>li {
	display: inline;
	padding: 0 5px 0 7px;
	border-left: 1px solid #dadada;
}

#footer>ul>li a:hover {
	color: #1fbe02;
	text-decoration: underline;
}

#footer ul li:first-child {
	border-left: 0px !important;
}

#addr_logo {
	width: 63px;
	height: 11px;
}

#address {
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
	color: #1fbc02;
}

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
	padding: 60px 70px;
	background-color: white;
	border: 1px solid #e5e5e5;
	font-size: 12px;
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
	color: white;
	font-weight: bold;
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
	top: 0px;
	right: 7px;
	cursor: pointer;
	height: 45px;
	line-height: 45px;
	width: 30px;
	text-align: center;
}

.item_inp {
	width: 100%;
	padding: 15px 0 15px 0;
	border: 0;
	border-bottom: 2px solid #3885ca;
	font-size: 18px;
	color: #3885ca;
	margin-bottom: 8px;
	background-color: white;
}

		*{
			font-family: Dotum,'돋움',Helvetica,sans-serif;
			box-sizing: border-box;
		}
		body, h1, h3, h4, h5, h6, ul, p{
			margin: 0; padding: 0;			
		}
		body{
			background-color: white; 
			font-size: 12px;
		}
			
		ul{ list-style: none;}	
					
		a{
			text-decoration: none;
			color: inherit;
		}
		.wrap{
			width: 768px;			
			margin: 0 auto;
			
		}
		.header{
			padding: 62px 0px 20px;
			position: relative;
			
		}
		.n_logo{
			display: block;/* 마진으로 채우기 위해*/
			width: 240px;
			height: 44px;
			font-size: 24px;
			font-weight: bold;
			line-height: 44px;
			text-align: center;
			color: black;
			margin: auto;/**/
		}
		.join_content{
			width: 460px;
			margin: 0 auto;
			
		}
		.row_group{
			overflow: hidden;
			width: 100%;
		}
		.join_title{
			margin: 19px 0 8px;
			font-size: 14px;
			font-weight: 700;
			color: black;
		}
		.ps_box{
			display: flex;
			align-items: center;
			position: relative;
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			background-color: #fff;
			vertical-align: top;
		}
		.int_id{
			padding-right: 110px;
		}
		.int_pass{
			padding-right: 40px;			
		}
		.int{
			display: block;
			position: relative;
			width: 100%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border:none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}
		.step_url{
			position: absolute;			
			right: 13px;
			font-size: 15px;			
			color: #8e8e8e;
		}
		.error_next_box{
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			text-align: center;
			color: red;
			height: 15px;
			display: none;
		}
		.pw_lock{
			background-image: url('https://static.nid.first.com/images/ui/join/m_icon_pw_step.png'); 
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: block;
		} 
		.btn_agree{
			color: white;
			
		}
		.btn_double_area{
			margin: 30px 0 9px;			
		}
		.btn_type{
			display: block;
			width: 100%;
			padding: 21px 0 17px;
			font-size: 20px;
			font-weight: 700;
			text-align: center;
			cursor: no-drop;	
					
		}
		#footer{
			
			padding: 15px 0;
		}
		#footer > ul {
			margin :0 auto 9px;
			text-align:center;
		}
		#footer * {
			font-size: 11px;
			line-height: normal;
				list-style: none;
			color: #333;
		}
		#footer > ul > li{
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li a:hover{
			color: #1fbe02;
			text-decoration: underline;
		}
		#footer ul li:first-child{
			border-left:0px!important;
		}
		#addr_logo{
			width: 63px;
			height: 11px;
		}
		#address{
			margin:0 auto;
			text-align: center;			
		}
		#address *{
			font: 9px verdana;
		}
		#address a{
			font-weight: bold;
		}
		#address a:hover{
			color: #1fbc02;
		}

		.modal_wrap{
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: none;/* 이줄포함 밑 두줄 모달창 가운데로 오게 해준다.*/
			justify-content: center;
			align-items: center;
		}
		.modal_content{			
			position: relative;
			width: 420px;
			
			padding: 60px 70px;
			background-color: white;
			border: 1px solid #e5e5e5;
			font-size: 12px;
			vertical-align:top;
			box-sizing: border-box;
			text-align: left;
		}
		#kakaoServiceLogo{
			display: inline-block;
			width: 88px;
			height: 27px;			
			line-height: 1;
			vertical-align: top;
		}
		.ir_wa{
			overflow: hidden;
			display: block;
			position: relative;
			
			width: 100%;
			height: 100%;
		}
		h1{margin:0; padding: 0;
			color:#3885ca;

			font-size: 28px;font-weight: bold;
		}
		.info_user , .list_user{
			
			display: flex;
			justify-content: space-between;
			font-size: 12px;

		}
		
		.info_user a{
			color: #4c4c4c;
			text-decoration: none;
			cursor: pointer;
		}
		.wrap_btn .btn_g{
			display: block;
			width: 100%;
			height:50px;
			padding: 0;
			border:0;
			color: white;
			font-weight: bold;
			background-color: #3885ca;
			font-size: 15px;
			border-radius: 4px;
			box-sizing: border-box;
		}
		.item_inp{
				width: 100%;
				padding: 15px 0 15px 0;
				border:0;
				border-bottom: 2px solid #3885ca;
				font-size: 18px;				
				color: #3885ca;
				margin-bottom: 8px;
		}
		
		.btn_g{margin: 20px 0 10px 0;}

		#state{
			font-size: 13px;
			position: relative;
		}
		td{
			height: 26px;
		}
		#state > label {
			background:  url('${path}/resources/img/check_off.gif') no-repeat;
			display: block;
			height: 26px;
			line-height: 26px;
			padding-left: 30px;
		}
		#state > input{
			visibility: hidden;
			position: absolute;
			right: 1px;
			width:22px;
			height:22px;
			margin:-11px;
		}
		#state > input:checked +label{
			
			
			background-image: url('${path}/resources/img/check_in.png');
		}
		.fix_btn > button{
			color: rgb(142,142,142);
			border:none;
			background:white;
			font-size: 30px;
			cursor: pointer;
			outline: none;

		}
		.fix_btn > button:hover{
			color: red;
		}
		.fix_btn{ position: absolute;
		 right: 8px;
		 top: 8px;}
		 .pw_eye{
		 	position: absolute;
		 	color: #aaa;
		 	font-size: 17px;
		 	top:0px;
		 	right: 7px;
		 	cursor: pointer;
		 	height: 45px;
		 	line-height:45px;
		 	width: 30px;
		 	text-align: center;

		 }
		 .item_inp{
				width: 100%;
				padding: 15px 0 15px 0;
				border:0;
				border-bottom: 2px solid #3885ca;
				font-size: 18px;				
				color: #3885ca;
				margin-bottom: 8px;
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
			<p>탈퇴 버튼을 클릭하시면 되돌릴 수 없습니다.</p>


			<div class="wrap_btn">
				<button class="btn_g" type="button" tabindex="3">탈퇴</button>
			</div>

		</div>
	</div>




	<header>
		<div class="header">
			<h1 class="first_logo">
				<a href="../" class="n_logo">FIRST</a>
			</h1>
		</div>
	</header>
	<section style="height: 700px;">
		<div class="container">
			<div class="join_content">
				<div class="c_header">
					<h1>탈퇴 안내</h1>
					<span>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</span>
				</div>
				<div class="sectiondelete">
					<strong>사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</strong><br>
					<br>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
				</div>
				<div class="sectiondelete">
					<strong>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</strong><br>
					<br> 회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는
					복구되지 않습니다.삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
				</div>
				<div class="sectiondelete">
					<strong>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</strong><br>
					<br>뉴스, 카페, 지식iN 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아
					있습니다.삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.탈퇴 후에는 회원정보가
					삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
				</div>
				<div class="sectiondelete">
					<strong>first 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.</strong><br>
					<br>first 아이디로 로그인하여 사용 중이던 외부 사이트를 방문하여 다른 로그인 수단을 준비하거나, 데이터를
					백업한 후 first 회원을 탈퇴해야 합니다.
				</div>
				<div class="sectiondelete">
					<strong>동일 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</strong><br>
					<br>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다. 또한, 퍼스트 아이디를 사용해 다른
					서비스에 로그인 할 수 없게 됩니다.


				</div>

				<div class="terms">
					<p class="terms_p">
						<span class="terms_span"> <input type="checkbox" class="ckbox" id="cbox">
							<label for="cbox"> 안내 사항을 모두 확인하였으며, 이에 동의합니다. </label>
						</span>
					</p>
				</div>
				
				<div class="join_row">
					<h3 class="join_title">
	 					<label for="pw">현재비밀번호</label>
					</h3>
					<span class="join_info_box_content ps_box int_pw">
						<input type="password" id="nowpw" name="pw" class="join_info_box_input int">			
					</span>
					<span class="join_err_msg">필수 정보입니다.</span>
				</div>
			<span class="join_err_msg">약관에 동의가 필요합니다.</span> 
			
			<div class="btn_double_area">
				<button type="button" id="btn_join" class="btn-big btn_type btn_agree btn-primary">회원탈퇴</button>					
			</div>
				
			</div>
		</div>
	</section>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
	<script type="text/javascript">
		// 제이쿼리 문법
		// $('선택자').옵션();
		//$('#test').css('color','green');
		//$=jquery
		//('#test')=선택자 (id가 test)
		//.css()=옵션 글자색 그린		
		//jquery 이벤트 문법 (클릭, 포커스, 블러등)
		//$(document).on('이벤트','선택자'function())
		$(document).on('click','.btn_agree', function(){
			
			$('#login_id').focus();
		});

		$(document).on('click','.close_btn', function(){
			$('.modal_wrap').css('display','none');
			$('.frm_login')[0].reset();
			$('.pw_eye').prev().attr('type', 'password');
			$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
					   .css('color','#AAA');
		});
		$(document).on('click','.pw_eye',function(){
			var code = $(this).prev().attr('type');

			if(code == 'password'){
				$(this).prev().attr('type', 'text');
				$(this).html('<i class="fas fa-eye"></i>')
					   .css('color','#666');
			}else{
				$(this).prev().attr('type', 'password');
				$(this).html('<i class="fas fa-eye-slash"></i>')
					   .css('color','#AAA');
					   
			}

		});
		$(function(){
			var pwFlag = false;
			var checkArr = new Array(2).fill(false);
			$('#nowpw').keyup(function(){
				var nowpw = $(this).val();
				
				var result = joinValidate.checkNowpw(nowpw);
				console.log("code:"+result.code);
				ckDesign(result.code, result.desc, 0, 0);
				
				if(result.code == 100){
					checkArr[0]=true;
				}else{
					checkArr[0]=false;
				}
				ckColorBtn();
			});
			$('#cbox').click(function(){
				var ckLen = $('#cbox:checkbox:checked').length;
				if(ckLen ==1){
					checkArr[1]=true;
					$('.join_err_msg:eq(1)').css('visibility','hidden');
				}else{
					checkArr[1]=false;
				}
				ckColorBtn();
			});
		
			$('#btn_join').click(function(){
				var invalidAll =true;
				for(var i = 0; i <checkArr.length;i++){
					if(!checkArr[i]){
						invalidAll = false;
						$('.join_err_msg:eq('+i+')').css('visibility','visible');
					}
				}
				if(invalidAll){
					$('.modal_wrap').css('display','flex');
									
				}else{
					return false;
				}
			});
			$('.btn_g').click(function(){
				location.href='${path}/member/dropAction';
			});
			function ckColorBtn(){
				var checkAll = true;
				for(var i = 0; i < checkArr.length; i++){
					if(!checkArr[i]){
						checkAll = false;
					}
				}
				if(checkAll){
					$('#btn_join').addClass('btn-primary');
					// $('#btn_join').prop('disabled', false);
					$('#btn_join').css('cursor', 'pointer');
				}else{
					$('#btn_join').removeClass('btn-primary');
					// $('#btn_join').prop('disabled', true);
					$('#btn_join').css('cursor', 'no-drop');
				} 
			}
		});
		function ckDesign(code, desc, line, msg) { // line : border, msg : err msg
			if(code == 0 || code == 10 ||code==100) { // 통과 O
				// 테두리 색상 변경
				$('.join_info_box_content:eq('+line+')').css('border-bottom', '2px solid #3885CA');
				// 에러메세지 출력
				$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')
									    	  .text(desc)
									    	  .css('color', '#3885CA');
				return true;
			} else { // 통과 X
				// 테두리 색상 변경
				$('.join_info_box_content:eq('+line+')').css('border-bottom', '2px solid #d95339');
				// 에러메세지 출력
				$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')
									    	  .text(desc)
							  		    	  .css('color', '#d95339');
				return false;
			}
		}
		</script>
</html>
