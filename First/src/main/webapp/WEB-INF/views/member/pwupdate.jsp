<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>pwchange.html</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
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
		
	</style>
</head>
<body>
<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
	<div class="container">
		<div class="join_content">
			<div class="row_group">
				<div class="join_row">
					<h3 class="join_title">
	 					<label for="pw">현재비밀번호</label>
					</h3>
					<span class="join_info_box_content ps_box int_pw">
						<input type="password" id="nowpw" class="join_info_box_input int">			
					</span>
					<span class="join_err_msg">필수 정보입니다.</span>
				</div>
				<div class="join_row">
					<h3 class="join_title">
						<label for="upw">수정할비밀번호</label>
					</h3>
					<span class="join_info_box_content ps_box int_pass">
						<input type="text" id="upw" name="pw" class="join_info_box_input int">
	 					<span class="step_url"><span class="pw_lock"></span></span>
					</span>						
				</div>
				<div class="join_row">
					<h3 class="join_title">
						<label for="rpw">수정할비밀번호확인</label>
					</h3>
					<span class="join_info_box_content ps_box int_pass">
						<input type="text" id="urpw" name="rpw" class="join_info_box_input int">
						<span class="step_url"><span class="repw_lock"></span></span>
					</span>
					<span class="join_err_msg">필수 정보입니다.</span>
				</div>							
			</div><!-- row_group -->							
			<div class="btn_double_area">
				<button type="button" id="btn_join" class="btn-big btn_type btn_agree btn-primary">비민번호수정</button>					
			</div>
		</div>
	</div>	
</form:form>	


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	
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
		});
		$('#upw').keyup(function(){
			var nowpw = $.trim($('#nowpw').val());
			// 1.사용자가 입력한 값 받기
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
	
			// 2.유효성 체크 하기
			var result = joinValidate.checkPw(nowpw,pw, rpw);
			
			
			
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
		$('.join_info_box_input').keyup(function(){
			printCheckArr(checkArr);
			ckColorBtn();
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
		$('#btn_join').click(function(){
			var invalidAll =true;
			for(var i = 0; i <checkArr.length;i++){
				if(!checkArr[i]){
					invalidAll = false;
					$('.join_err_msg:eq('+i+')').css('visibility','visible')
												.css('color','#3885ca');
				}
			}
			if(invalidAll){
				$('#frm_member').submit();				
			}else{
				alert('유효성체크를진행해주세요!');
			}
		});
		
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
	function printCheckArr(checkArr) {
		for(var i=0; i < checkArr.length; i++) {
			console.log(i + '번지: ' + checkArr[i]);
		}
	}
	//버튼활성화!
	


</script>

</html>