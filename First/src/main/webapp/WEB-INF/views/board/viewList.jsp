<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.html</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/e272fd87da.js"
	crossorigin="anonymous"></script>
<style type="text/css">
.content {
	width: 805px;
	height: 800px;
	margin: 0 auto;
}

.width {
	width: 805px;
}

.right {
	float: right;
}

.left {
	float: left;
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
	color: #3885CA;
	border-top-right-radius: 2px; /*돋보기에 커서올렸을때 오르쪽모서리만 둥글게 해주는기능*/
	border-bottom-right-radius: 2px;
}

.header_content_search_btn:hover {
	background-color: #0f4c81;
	color: white;
}

.btn_write {
	height: 44px;
}

.nav {
	height: 48px;
}

.write {
	height: 44px;
}

.ul {
	display: flex;
	align-items: center;
	border-radius: 2px;
	position: relative;
	top: 24px;
}

.list {
	margin-right: 20px;
}

.flex {
	display: flex;
}

.list_group_item {
	position: relative;
	border-bottom: 1px solid #dadada;
}

.list_title_topic {
	font-size: 18px;
	font-weight: bold;
}

.list_title_icon {
	margin: auto 7px;
}

.jcsb {
	justify-content: space-between;
}

.board_name {
	font-size: 27PX;
}

.list_title_content {
	width: 805px;
	min-height: 400px;
	padding-top: 30px;
}

.list_title_reply {
	width: 805px;
	max-height: 100px;
	padding-top: 5px;
}

.list_reply_content {
	width: 805px;
	min-height: 100px;
	max-height: 800px;
}

.modal_wrap_delete_viewList {
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


.ir_wa {
	
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

_end {
	margin: 0;
}
</style>

</head>

<body>

	<div class="modal_wrap_delete_viewList">

		<div class="modal_content">
			<div class="header_fix_btn">
				<button class="close_btn" id="delete_modal_close" type="button">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<h1 id="kakaoServiceLogo" style="margin: 0 0 30px">
				<span class="ir_wa">게시글 삭제</span>

			</h1>
			<form:form id="frm_delete_viewList" action="${path}/board/drop" atuocomplete="on">	
			<input name="bno" type="text" id="bno" class="bno" placeholder=""  value="${map.bDto.bno}" style="display:none;" >

			<div class="wrap_btn">
				<button class="btn_g" id="btn_drop_viewList" type="submit" tabindex="3">삭제</button>
			</div>
			</form:form>
		</div>
	</div>
	
	
	
	
	<div class="content">
		<div class="write">
			<div class="board_name left">상세 게시글</div>
		</div>
		<div class="panel">
			<ul>
				<li class="list_group_item flex jcsb">

					<div class="list_user_info flex">
						<img src="../../img/FIRST.png" style="width: 30px;">
						<div class="flex">
							<div>${map.bDto.writer}</div>
						</div>
					</div>
					<div class="list_info flex">
						<div class="list_title_icon right">
							<i class="far fa-comment">${map.bDto.replycnt}</i> <i
								class="far fa-thumbs-up">${map.bDto.goodcnt}</i> <i
								class="far fa-eye">${map.bDto.viewcnt}</i>
						</div>
					</div>
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_info flex">
						<div class="list_title_wrapper">
							<div class="flex">
								<div class="list_title_num">${map.bDto.bno}</div>
								<div class="list_title_category">${map.bDto.type}</div>
							</div>
							<div class="list_title_topic">${map.bDto.title}</div>
						</div>
					</div>
					<div class="list_info flex right">
						<div class="list_title_icon ">
							<div>${map.bDto.updatedate}</div>
						</div>
					</div>
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_info flex">
						<div class="list_title_content">${map.bDto.content}</div>
					</div>
				</li>
			</ul>

			<div class="nav">
				<div class="header_content_search">
					
						<ul class="header_content_sort_group ul left">
							<li class="list"><a
								href="http://localhost:8081/first/board/list"
								class="btn-primary">목록</a></li>
							<li class="list"><button class="btn-primary">답변</button></li>
						</ul>
						<c:if test="${userid==map.bDto.writer}">
						<ul class="header_content_sort_group ul right" id="updel">
							<li class="list"><button class="btn-primary">수정</button></li>
							<li class="list_end"><button class="btn-primary" id="btn_delete_viewList">삭제</button></li>
						</ul>
						</c:if>
					
				</div>
			</div>
		</div>
		<div class="write">
			<div class=" left">
				댓글<span><i class="far fa-comment">20</i></span>
			</div>
		</div>
		<div class="panel">
			<ul>
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">댓글</div>
						</div>
						<div class="list_title_topic">초롱이</div>
					</div>

					<div class="list_info flex">
						<div class="list_title_icon">

							<i class="far fa-thumbs-up">18</i>

						</div>

						<div class="list_user_info flex">
							<div class="list_title_topic">2020.03.17</div>
						</div>
					</div>
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_info flex">
						<div class="list_title_reply">디자인이 너무 싫어요</div>
					</div>
				</li>
			</ul>
			<div class="nav" style="padding-top: 20px">
				<div class="header_content_search">
					<div class="list_title_topic">초롱이</div>
					<form name="frm_search" action="" method="GET">
						<input type="text" placeholder="댓글입력" name=""
							class="list_reply_content">
						<ul class="header_content_sort_group ul left">
							<li class="list"><button class="btn-primary">댓글입력</button></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	
	
	$('#delete_modal_close').click(function(){
		$('.modal_wrap_delete_viewList').css('display','none');
	});
	
	$('#btn_delete_viewList').click(function(){
		$('.modal_wrap_delete_viewList').css('display','flex');
	});
	$('#btn_drop_viewList').click(function(){
		$('#frm_delete_viewList').submit();	
	});
	
});
</script>
	
</html>