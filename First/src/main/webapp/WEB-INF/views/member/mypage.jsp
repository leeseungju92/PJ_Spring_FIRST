<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<!-- favicon: 제목줄의 아이콘 -->
	
	<link rel="stylesheet" type="text/css" href="../../css/common.css">
	<style type="text/css">
		/* Header */
		
		div.section_wrap {
			width: 460px;
		    display: block;
		    text-align: center;
		    margin: 70px auto 20px auto;
		    position: relative;
		}
		div.header_content {
			
			
			margin: 0 auto;
			padding-left: 80px;
			padding-right: 20px;
			box-sizing: border-box;
			
			border-bottom: 1px solid #d4d4d4;
			display: flex;
			justify-content: space-between; /* 가로여백 똑같이 맞추겠다 */
			align-items: center; /* 세로 가운데 맞추겠다(수평병렬) */
		}
		div.section_content_title {
			text-align: left;
			border-bottom: 1px solid #d6d6d6;
		}		
		.section_wrap {
			line-height: 1.5;
			font-family: '맑은 고딕','Malgun Gothic','Apple SD Gothic Neo',sans-serif,'돋움',dotum;
			color: #1e1e1e;
			font-size: 14px;
			letter-spacing: -1px;
		}
		.section_content_secession {
			text-align: center;
    		padding-top: 20px;
		}
		.section_container > h1 {
			font-weight: normal;
			font-size: 24px;
		}
		.main_info_wrap {
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		.sub_info_box {
			display: flex;
			justify-content: space-between;
		}
		.tb_pic_box {
			width: 100px;
			height: 100px;
			
		}
		.tb_pic {
			background-image: url("../../img/FIRSTV3.png");
			background-repeat: no-repeat;
			width: 100px;
			height: 100px;
			position-position: center center;
			background-size: 100%;
			border-radius: 50%;
		}
		.info_title {
			margin-top: 10px;
			margin-bottom: 5px;
			text-align: left;
		}
		.tb_id {
			margin-top: 10px;
			width: 272px;
			height: 22px;
			font-weight: bold;
			line-height: 100%;
			text-align: left;
		}
		.tb_info_box {
			margin-left: 10px;
			/*margin: 0px auto;*/
			width: 280px;
			height: 40px;
			line-height: 40px;
			padding: 0 15px;
			border-bottom: 1px solid #d4d4d4;
			/*border-radius: 3px;*/
			text-align: left;
		}
		.tb_pw_input {
			margin-top: 8px;
			border: none;
			outline: none;
			background-color: #f5f6f7;
			width: 272px;
			height: 22px;
		}
		.section_footer {
			display: flex;
			justify-content: space-between;
			margin-top: 33px;
			padding-top: 30px;
			border-top: 1px solid #d4d4d4;
		}
		.tb_btn {
			font-size: 14px;
			font-weight: bold;
			border-radius: 4px;
		    border: 1px solid #b6b6b6;
		    text-align: center;
		    background-color: #fafafa;
		    color: #222;
		    display: inline-block;
		    width: 142px;
		    min-width: 118px;
		    padding: 11px;
		}
		.cancel_btn {
			margin-right: 10px;
			color: white;
			background-color: #3885CA;
		}
		.cancel_btn:hover {
			text-decoration: underline;
		}
		.confirm_btn {
			color: white;
			background-color: #3885CA;
		}
		.confirm_btn:hover {
			text-decoration: underline;
			background-color: #3885CA;
		}
		div.section_footer > a {
			border: 1px solid #b6b6b6;
		}
	</style>
</head>
<body>
	<div class="wrap">		
		<section>
			<div class="section_wrap">
				<div class="section_content">
					<div class="section_content_title">
						<h1>내 정보</h1>
					</div>
					<div class="section_content_secession">
						<!-- <div class="section_container">
							<h1>회원님의 소중한 정보 보호를 위해 현재 비밀번호를 확인해 주세요.</h1>
						</div> -->
						<form>
							<div class="main_info_wrap">
								<div class="tb_pic_box">
									<div class="tb_pic"></div>
								</div>
								<div class="main_info_box">
									<div class="sub_info_box">
										<div class="info_title">아이디</div>
										<div class="tb_info_box">
											<span>${user.id}</span>
										</div>
									</div>
									
									<div class="sub_info_box">
										<div class="info_title">이름</div>
										<div class="tb_info_box">
											<span>${user.name}</span>
										</div>
									</div>

									<div class="sub_info_box">
										<div class="info_title">전화번호</div>
										<div class="tb_info_box">
											<span>${user.phone}</span>
										</div>
									</div>

									<div class="sub_info_box">
										<div class="info_title">이메일</div>
										<div class="tb_info_box">
											<span>${user.email}</span>
										</div>
									</div>

									<div class="sub_info_box">
										<div class="info_title">주소</div>
										<div>
											<div class="tb_info_box">
												<span>${user.postcode}</span>
											</div>
											<div class="tb_info_box">
												<span>${user.addr1}</span>
											</div>
											<div class="tb_info_box">
												<span>${user.addr2}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="section_footer">
									
								<div><button type="button" id="mypage_update"class="tb_btn cancel_btn">회원정보수정</button></div>
								<div><button type="button" id="mypage_pwupdate"class="tb_btn confirm_btn">비밀번호변경</button></div>
								<div><button type="button" id="mypage_drop"class="tb_btn confirm_btn">회원탈퇴</button></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#mypage_update').on('click' , function(){
		
		location.href='${path}/member/update';			
	});
	$('#mypage_pwupdate').on('click' , function(){
		
		location.href='${path}/member/pwupdate';			
	});
	$('#mypage_drop').on('click' , function(){
		
		location.href='${path}/member/drop';			
	});
});
</script>
</html>