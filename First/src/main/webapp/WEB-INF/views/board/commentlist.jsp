<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
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
</style>
<body>
	<div class="panel">
			<ul>
				<c:forEach items="${list}" var="list">
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							
							<div class="list_title_num">${list.rno}</div>
							<div class="list_title_category">${list.type}</div>
						</div>
						
						<div class="list_title_topic">${list.writer}</div>
					</div>

					<div class="list_info flex">
						<div class="list_title_icon">

							<i class="far fa-thumbs-up">18</i>

						</div>

						<div class="list_user_info flex">
							<div class="list_title_topic">${list.regdate}</div>
						</div>
					</div>
					
					
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_info flex">
						<div class="list_title_reply">${list.content}</div>
					</div>
				</li>
				</c:forEach>
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
</body>
</html>