<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
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
	width: 100%;
}

.list_type {
	width: 100%;
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

.list_end {
	margin: 0;
}
.err_msg{
	color:red;
	display:hidden;
}
</style>

</head>
<body>
	<div class="content">
		<div class="write">
			<div class="board_name left">게시글 등록</div>
		</div>
		<div class="panel">
			<form:form id="frm_insert">
				<ul>
					<li class="list_group_item flex jcsb">

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div class="flex">
								<div>${userid}</div>
								<input type="hidden" name="writer" value="${userid}">
							</div>
						</div>

					</li>

					<li class="list_group_item flex jcsb"><select
						class="list_type" name="type">
							<option value="free" selected>자유게시판</option>
							<option value="qna">Q&A 게시판</option>
							<option value="revu">후기 게시판</option>
					</select></li>
					<li class="list_group_item flex jcsb"><input
						class="list_title_topic" name="title" id="insert_title"></li>
					<li class="list_group_item flex jcsb"><script
							type="text/javascript"
							src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
							charset="utf-8"></script> <textarea class="list_title_content"
							name="content" id="board_insert_content"
							style="min-width: 805px; width: 100%;"></textarea></li>
					<li class="list_group_item flex jcsb"><input type="file"
						name="board_insert_file"></li>
				</ul>
				<span class="err_msg right"></span>
				<div class="nav">
					<div class="header_content_search flex jcsb">
						<ul class="header_content_sort_group ul left">
							<li class="list"><button type="button"
									id="board_insert_cancle" class="btn-primary"
									data_num="${referer}">취소</button></li>
						</ul>
						
						<ul class="header_content_sort_group ul right">

							<li class="list_end"><button type="button"
									class="btn-primary" id="board_insert">등록</button></li>
						</ul>
					</div>
				</div>
			</form:form>
		</div>

	</div>
</body>
<script type="text/javascript">
	$(function() {

		$('#board_insert').click(function() {
			var title= $('#insert_title').val();
			if(title==''||title.length ==0){
				$('.err_msg').css('display','block')
							.text('제목을입력해주세요');
				return false;
			} else{
				oEditors.getById["board_insert_content"].exec("UPDATE_CONTENTS_FIELD", []);
				$('#frm_insert').submit();
			}
		});
		$('#board_insert_cancle').click(function() {
			var referer = '${header.referer}';
			var reindex = referer.indexOf('first/board/list');
			if(reindex==-1){
				location.href = '${path}/board/list'
			}else{
				location.href = referer;
			}
		});
	});

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "board_insert_content",
		sSkinURI : "${path}/resources/smarteditor/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
</script>
</html>