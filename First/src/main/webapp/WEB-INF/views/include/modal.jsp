<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
	<style type="text/css">
		.include_modal_wrap{
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
		.include_modal_content{			
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
		#include_kakaoServiceLogo{
			display: inline-block;
			width: 88px;
			height: 27px;			
			line-height: 1;
			vertical-align: top;
		}
		.include_ir_wa{
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
		.include_wrap_btn .include_btn_g{
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
		.include_fix_btn > button{
			color: rgb(142,142,142);
			border:none;
			background:white;
			font-size: 30px;
			cursor: pointer;
			outline: none;

		}
		.include_fix_btn > button:hover{
			color: red;
		}
		.include_fix_btn{ position: absolute;
		 right: 8px;
		 top: 8px;}
	</style>
</head>
<body>
	<div class="include_modal_wrap modal_msg_wrap">		
		<div class="include_modal_content">
			<div class="include_fix_btn">
				<button class="include_close_btn include_btn_g" type="button">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<h1 id="include_kakaoServiceLogo"style="margin: 0 0 30px">
				<div id="modal_msg_main_txt"class="include_ir_wa"></div>				
			</h1>		
			<div id="modal_msg_sub_txt"></div>									
				<div class="include_wrap_btn">					
					<button id="modal_msg_yes" class="include_btn_g" type="button" tabindex="3">확인</button>					
				</div>																			
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var id = '${id}';
			var email = '${email}';
			var key = '${key}';
			
			var join_main_txt = id+'님 회원가입을 축하드립니다.';
			var join_sub_txt = email +'으로 인증메일을 보냈습니다. 인증하세요';
			var auth_main_txt = id+'님 이메일 인증되셨습니다.';
			var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다.';
			
			if(key=='join'){
				$('#modal_msg_main_txt').text(join_main_txt);
				$('#modal_msg_sub_txt').text(join_sub_txt);
				$('#modal_msg_cancle').css('display','none');
				$('.include_modal_wrap').css('display','flex');
			}else if(key=='auth'){
				$('#modal_msg_main_txt').text(auth_main_txt);
				$('#modal_msg_sub_txt').text(auth_sub_txt);
				$('#modal_msg_cancle').css('display','none');
				$('.include_modal_wrap').css('display','flex');				
			}
			$('#modal_msg_yes').on('click', function(){
				$('.include_modal_wrap').css('display', 'none');	
			});
			$('.include_close_btn').on('click', function(){
				$('.include_modal_wrap').css('display', 'none');
			});
			
		});	
		// 제이쿼리 문법
		// $('선택자').옵션();
		//$('#test').css('color','green');
		//$=jquery
		//('#test')=선택자 (id가 test)
		//.css()=옵션 글자색 그린		
		//jquery 이벤트 문법 (클릭, 포커스, 블러등)
		//$(document).on('이벤트','선택자'function())
		
	</script>
</html>