<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<html>
<head>
	
	<title>tumbland_join.html</title>
	<!-- favicon: 제목줄의 아이콘 -->
	<link rel="icon" type="image/png" href="../../img/tumbland_favicon_transparent_crop.png">
	<script src="https://kit.fontawesome.com/fc5ae9294d.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="../../css/common.css">
	<style type="text/css">
		* { /* 모든 태그의 글씨체 돋움 width height 고정*/
			font-family: Dotum,'돋움',Helvetica,sans-serif;
			box-sizing: border-box;
		}
		body, h1, h2, h3, h4, h5, h6, ul, p {
			margin: 0; padding: 0; /* 기본적으로 들어가는 마진 패딩 0 */
		}
		body {
			background-color: #f5f6f7;
			font-size: 12px;
		}
		ul { list-style: none; } /* 점 죽이는 none */
		a {
			text-decoration: none; /* 밑줄 없애기 */
			color: inherit; /* 상속받은 글자색을 그대로 쓰세요 */
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
			/* block이랑 width height는 세트다 */
			display: block; /* a는 inline inline은 width height를 줄수가 없다 size를 주기위해선 block 또는 inline-block으로 바꿔야한다 */
			/* 그럼 왜 block으로 바꿨을까? 이유는 margin: auto; 때문 */
			/* block은 한줄에 빈공간을 마진으로 채우고 inline-block은 마진이 없다 */
			/* display block이니까 가로 다 내꺼! 니까 margin auto를 줘서 내용물 제외한 부분 마진으로 채우고 가운데 정렬하기 위해서 사용한다 */
			width: 300px;
			height: 80px;
			/* img태그를 사용하면 글자처럼 취급이 되서 이미지 삽입시 자라를 자동으로 잡아주는데 */
			/* img태그가 아니라 background url 사용시 이미지 자리를 안잡아주므로 block에 witdh height 잡아주고 이미지 넣어줌 */
			background: url(../../img/tumbland_logo_transparent_crop.png) 100% 50% no-repeat;
			background-size: 300px 80px;
			margin: 0 210px;
			/*margin: auto;*/
		}
		.join_content { /* div는 기본적으로 block이라 display:block 안줘도됨 margin 0 auto주면 기본적으로 가운데 정렬된다 */
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
			background: #fff;
			vertical-align: top;
		}
		.int_id {
			padding-right: 110px; /* @naver.com 까지 입력창이 오지 않게끔 오른쪽에 패딩을 줌 */
		}
		.int_pass {
			padding-right: 40px; /* 자물쇠 아이콘까지 입력창이 오지 않게끔 오른쪽에 패딩을 줌 */
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
		.join_err_msg {
			display: block;
			visibility: hidden;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
		}
		.pw_lock {
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block; /* 마진이 없는 블록 */
		}
		.repw_lock {
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block; /* 마진이 없는 블록 */
			background-position: -27px 0; /* 이미지 위치 지정 */
		}
		.bir_wrap {
			display: table; /* 테이블 속성을 줘서 테이블 태그로 만들기 */
			width: 100%;
		}
		.bir_mm, .bir_dd {
			padding-left: 10px; /* 왼쪽 패딩을 줘서 table-cell간의 간격을 주겠다 */
		}
		.bir_yy, .bir_mm, .bir_dd {
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.sel {
			background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
			background-size: 20px 8px;
			width: 100%;
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none; /* 기본적으로 제공하는 꺾쇠를 지우겠다 */
		}
		/*
			table <= display: table;
			td    <= display: table-cell;
			div   <= display: block;
		*/
		.choice { /* (선택) 부분 글자크기 굵기 글자색 변경 클래스 */
			font-size: 12px;
			font-weight: 400;
			color: #8e8e8e;
		}
		.btn_double_area {
			margin: 30px 0 9px;
		}
		.btn_type {
			display: inline-block;
			width: 100%;
			/*padding: 21px 0 17px;*/
			font-size: 20px;
			font-weight: 600;
			text-align: center;
			border: 1px solid transparent;
			border-radius: 2px;
			padding: 11px 12px;
			outline: none;
			cursor: no-drop;
		}
		.btn-big {

		}
		.btn-primary {
			color: white;
			background-color: #FFADA6;
		}
		
		/*.btn_agree {
			color: white;
			background-color: #FFADA6;
		}*/

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
		<header><div class="header">
			<h1 class="naver_logo"><a href="../include/header.html" class="n_logo"></a></h1>
		</div></header>
		<section>
			<!-- form태그로 싸야 데이터를 가져갈 수 있다 -->
			<!-- 값을 숨겨야 하는건(개인정보관련) POST방식(회원가입할때 값이 노출되면 안되니까) -->
			<!-- 검색할 때는 GET방식으로 값을 보냄(주소창에 값이 노출) -->
			<form name="frm_join" action="" method="POST">
				<div class="container">
					<div class="join_content">
						<div class="row_group">

							<div class="join_row">
								<h3 class="join_title">
									<label for="uid">아이디</label>
								</h3>
								<span class="join_info_box_content ps_box int_id">
									<input type="text" id="uid" name="uid" class="join_info_box_input int">
									<span class="step_url">@naver.com</span>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="upw">비밀번호</label>
								</h3>
								<span class="join_info_box_content ps_box int_pass">
									<input type="text" id="upw" name="upw" class="join_info_box_input int">
									<span class="step_url"><span class="pw_lock"></span></span>
								</span>
								<!-- <span class="join_err_msg">필수 정보입니다.</span> -->
							</div>

							<div class="join_row">
								<!-- <h3 class="join_title">
									<label for="urpw">비밀번호 재확인</label>
								</h3> -->
								<br>
								<span class="join_info_box_content ps_box int_pass">
									<input type="text" id="urpw" name="urpw" class="join_info_box_input int">
									<span class="step_url"><span class="repw_lock"></span></span>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
						</div><!-- row_group -->



						<div class="row_group">
							<div class="join_row">
								<h3 class="join_title">
									<label for="uname">이름</label>
								</h3>
								<span class="join_info_box_content ps_box"><!-- icon 안들어가서 int태그 지운다 -->
									<input type="text" id="uname" name="uname" class="join_info_box_input int">
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row join_birthday">
								<h3 class="join_title">
									<label for="yy">생년월일</label>
								</h3>
								<div class="bir_wrap">
									<div class="bir_yy">
										<span class="join_info_box_content ps_box"><!-- icon 안들어가서 int태그 지운다 -->
											<input type="text" id="yy" name="yy" class="join_info_box_input int" placeholder="년(4자)">
										</span>
									</div>
									<div class="bir_mm">
										<span class="join_info_box_content ps_box">
											<select id="mm" class="sel">
												<option>월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
										</span>
									</div>
									<div class="bir_dd">
										<span class="join_info_box_content ps_box">
											<input type="text" id="dd" placeholder="일" class="join_info_box_input int">
										</span>
									</div>
								</div>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="male">성별</label>
								</h3>
								<span class="join_info_box_content ps_box"><!-- icon 안들어가서 int태그 지운다 -->
									<select class="sel" id="male">
										<option>성별</option>
										<option value="m">남성</option>
										<option value="w">여성</option>
									</select>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="uemail">본인 확인 이메일<span class="choice">(선택)</span></label>
								</h3>
								<span class="join_info_box_content ps_box"><!-- icon 안들어가서 int태그 지운다 -->
									<input type="text" id="uemail" name="uemail" class="join_info_box_input int" placeholder="선택입력">
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="uphone">휴대전화</label>
								</h3>
								<span class="join_info_box_content ps_box"><!-- icon 안들어가서 int태그 지운다 -->
									<input type="tel" id="uphone" name="uphone" class="join_info_box_input int" placeholder="-없이 입력, 예)01012345678">
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="uaddr">주소<span class="highlight">*</span></label>
								</h3>
								<div class="addr_wrap">
									<div class="postcode" style="display: flex;">
										<span class="join_info_box_content ps_box addr_poc">
											<input type="text" id="sample6_postcode" class="join_info_box_input int addr_only" placeholder="우편번호" value="52123" readonly>
										</span>
										<input type="button" id='btn_post' class='join_info_box_input addr_poc_button' onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									</div>
									<span class="join_info_box_content ps_box">
										<input type="text" id="sample6_address" class="join_info_box_input int addr_only" placeholder="주소" value="광주광역시 북구 중흥동" readonly><br>
									</span>
									<span class="join_info_box_content ps_box">
										<input type="text" id="sample6_detailAddress" class="join_info_box_input int" placeholder="상세주소">
									</span>
								</div>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
						</div><!-- row_group -->

						<div class="btn_double_area">
							<button type="button" id="btn_join" class="btn-big btn_type btn_agree">가입하기</button>
							<!-- <span><a href="#" class="btn_type btn_agree">가입하기</a></span> -->
						</div>
					</div>
				</div>
			</form>
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
							<img id="addr_logo" src="../../img/tumbland_logo_transparent_crop.png">
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
<script type="../../js/daum_post.js"></script> <!-- daum 주소입력 관련 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
	$(function(){
		// 비밀번호가 유효한 값인지 체크해주는 Flag값
		var pwFlag = false;

		// 유효성체크 여부를 알려주는 배열
		var checkArr = new Array(6).fill(false);
		// printCheckArr(checkArr);

		// 유효성체크 모두 통과 or 불통 여부를 알려주는 변수
		// var checkAll = true;


		// 아이디 유효성체크:
		// >> #uid인 input태그의 값을 가져와서 체크
		$('#uid').keyup(function(){
			// 사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
			var id = $(this).val().trim(); // 사용자가 입력한 값
			// validation.js의 checkId로 유효성체크를 실행 후
			// 결과를 result에 담음(code, desc)
			var result = joinValidate.checkId(id);

			if(result.code == 0) {
				checkArr[0] = 'true';
			} else {
				checkArr[0] = 'false';
			}

			// 유효성체크 결과로 테두리색과 err메세지를 출력하는 함수 실행
			ckDesign(result.code, result.desc, 0, 0);
		});

		// 비밀번호 유효성체크
		$('#upw').keyup(function(){
			// 1.사용자가 입력한 값 받기
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());

			// 2.유효성 체크 하기
			var result = joinValidate.checkPw(pw, rpw);
			if(result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}
			if(result.code == 10) {
				checkArr[1] = true;
				$('.join_info_box_content:eq(2)').css('border-bottom', '2px solid #3885CA');
			} else if(result.code == 6) {
				checkArr[1] = false;
				$('.join_info_box_content:eq(2)').css('border-bottom', '2px solid #3885CA');
			} else {
				checkArr[1] = false;
			}

			if(pwFlag) {
				$('.pw_lock').css('background-position', '-54px 0');
			} else {
				$('.pw_lock').css('background-position', '0 0');
			}
			if(result.code == 10) {
				$('.repw_lock').css('background-position', '-81px 0');
			} else {
				$('.repw_lock').css('background-position', '-27px 0');
			}

			// 3.체크 결과에 따라 디자인하기
			ckDesign(result.code, result.desc, 1, 1);
		});

		// 비밀번호 재확인 유효성체크
		$('#urpw').keyup(function(){
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
			// console.log(pw+','+rpw);

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			if(result.code == 10) {
				checkArr[1] = true;
				$('.join_info_box_content:eq(1)').css('border-bottom', '2px solid #3885CA');
			} else if(result.code == 6) {
				checkArr[1] = false;
				$('.join_info_box_content:eq(1)').css('border-bottom', '2px solid #3885CA');
			} else {
				checkArr[1] = false;
			}

			if(result.code == 10) {
				$('.repw_lock').css('background-position', '-81px 0');
			} else {
				$('.repw_lock').css('background-position', '-27px 0');
			}

			ckDesign(result.code, result.desc, 2, 1);
		});

		// 이름 유효성체크
		$('#uname').keyup(function(){
			var name = $.trim($(this).val());
			var result = joinValidate.checkName(name);

			if(result.code == 0) {
				checkArr[2] = true;
			} else {
				checkArr[2] = false;
			}

			ckDesign(result.code, result.desc, 3, 2);
		});

		// 전화번호 유효성체크
		$('#uphone').keyup(function(){
			var phone = $.trim($(this).val());
			var result = joinValidate.checkPhone(phone);

			if(result.code == 0) {
				checkArr[3] = true;
			} else {
				checkArr[3] = false;
			}

			ckDesign(result.code, result.desc, 9, 6); // 쌤꺼는 4, 3
		});

		// 이메일 유효성체크
		$('#uemail').keyup(function(){
			var email = $.trim($(this).val());
			var result = joinValidate.checkEmail(email);

			if(result.code == 0) {
				checkArr[4] = true;
			} else {
				checkArr[4] = false;
			}

			ckDesign(result.code, result.desc, 8, 5); // 쌤꺼는 5, 4
		});

		$('.addr_only').click(function(){
			// 사용자가 우편번호 또는 주소 input을 클릭했을 때!
			$('#btn_post').click();
		});

		// 상세주소를 클릭하면
		$('#sample6_detailAddress').click(function(){
			var addrPost = $('#sample6_postcode').val();
			if(addrPost == '' || addrPost.length == 0) {
				// $('#btn_post').click();
			}
		});
		
		// 주소 유효성체크
		$('#sample6_detailAddress').keyup(function(){
			var addrDetail = $.trim($(this).val());
			var addrPost = $('#sample6_postcode').val();
			// console.log('우편번호: ' + addrPost + ' 상세주소: ' + addrDetail);

			var result = joinValidate.checkAddr(addrDetail, addrPost);
			// console.log(result.code + ', ' + result.desc);

			if(result.code == 3) { // 우편번호 & 주소 X
				ckDesign(result.code, result.desc, 10, 7);
				ckDesign(result.code, result.desc, 11, 7);
				checkArr[5] = false;
			} else if(result.code == 0) { // 성공
				ckDesign(result.code, result.desc, 10, 7);
				ckDesign(result.code, result.desc, 11, 7);
				ckDesign(result.code, result.desc, 12, 7);
				checkArr[5] = true;
			} else { // 상세주소 X
				ckDesign(result.code, result.desc, 12, 7);
				checkArr[5] = false;
			}
		});

		// 버튼 활성화!
		/* $('.join_info_box_input').blur(function(){ */
			$('.join_info_box_input').keyup(function(){ 
			var checkAll = true;

			for(var i = 0; i < checkArr.length; i++) {
				if(!checkArr[i]) {
					checkAll = false;
				}				
			}
			if(checkAll) {
				$('#btn_join').addClass('btn-primary');
				// $('#btn_join').prop('disabled', false);
				$('#btn_join').css('cursor', 'pointer');
			} else {
				$('#btn_join').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', true);
				$('#btn_join').css('cursor', 'no-drop');
			}
		});

		// 회원가입 버튼 클릭
		$('#btn_join').click(function(){
			var invalidAll = true;
			for(var i = 0; i < checkArr.length; i++) {
				if(!checkArr[i]) {
					invalidAll = false;
					$('.join_err_msg:eq('+i+')').css('visibility', 'visible')
												.css('color', '#d95339');
				}
			}
			printCheckArr(checkArr);

			if(invalidAll) { // 유효성체크가 전부 true이면
				alert('회원가입 성공!');
			} else { // 하나라도 false이면
				alert('유효성체크를 진행해주세요!');
			}
			
		});

	});

	function ckDesign(code, desc, line, msg) { // line : border, msg : err msg
		if(code == 0 || code == 10) { // 통과 O
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

    function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}

	// 개발시 사용: 유효성체크 전체여부를 출력해주는 함수(true, false)
	function printCheckArr(checkArr) {
		for(var i=0; i < checkArr.length; i++) {
			console.log(i + '번지: ' + checkArr[i]);
		}
	}
</script>
</html>