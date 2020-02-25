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
			display: flex;/* 이줄포함 밑 두줄 모달창 가운데로 오게 해준다.*/
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
		.include_wrap_btn .btn_g{
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
	</style>
</head>
<body>
	<div class="include_modal_wrap">		
		<div class="include_modal_content">
			<div class="include_fix_btn">
				<button class="include_close_btn" type="button">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<h1 id="include_kakaoServiceLogo"style="margin: 0 0 30px">
				<span class="include_ir_wa">FIRST</span>				
			</h1>		
			<p>탈퇴 버튼을 클릭하시면 되돌릴 수 없습니다.</p>
			
									
				<div class="include_wrap_btn">
					<button class="include_btn_g" type="button" tabindex="3">취소</button>
					<button class="include_btn_g" type="button" tabindex="3">확인</button>					
				</div>
			
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		// 제이쿼리 문법
		// $('선택자').옵션();
		//$('#test').css('color','green');
		//$=jquery
		//('#test')=선택자 (id가 test)
		//.css()=옵션 글자색 그린		
		//jquery 이벤트 문법 (클릭, 포커스, 블러등)
		//$(document).on('이벤트','선택자'function())
		$(document).on('click','.include_btn_g', function(){
			$('.include_modal_wrap').css('display','none');
			
		});
	</script>
</html>