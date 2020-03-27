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
	word-break: break-all;
	overflow:hidden;
	white-space:normal;
	text-overflow:hidden;
	max-width: 695px;
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
#reply_login:hover{
	cursor:pointer;
}
#reply_login{
	color: #3885CA;
}
.margin-bottom{
	margin-bottom:30px;
}
#reply_err_msg{
	display:none;
}
#reply_del_btn{
	height:27px;
}


</style>
<body>

	<div class="write"> 
		<div class=" left">
			댓글<span><i class="far fa-comment" id="comment_list_size">${list.size()}</i></span><span><button id="reply_refresh"><i class="fas fa-redo"></i></button></span>
		</div>
		
	</div>
	<div class="panel">
			
			<ul>
				
				<c:forEach items="${list}" var="list">
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						
						
						<div>${list.writer}</div>
					</div>

					<div class="list_info flex">
						<div class="list_title_icon">

							<i class="far fa-thumbs-up">18</i>

						</div>
					<div>
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"></fmt:formatDate>
						<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" var="regdate"></fmt:formatDate>
						<c:choose>
							<c:when test="${today ==regdate}">
								<fmt:formatDate value="${list.regdate}" pattern="HH:mm:ss"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/>
							</c:otherwise>
						</c:choose>
					</div>
						<div class="list_user_info flex">
						
							
						</div>
					</div>
					
					
				</li>
				<li class="list_group_item">
					<div class="list_info flex jcsb">
						<div class="list_title_topic">${list.content}</div>
						<c:if test="${userid==list.writer}">
							<button type="button" id="reply_del_btn" data_num="${list.rno}"> 댓삭</button>
							
						</c:if>
					</div>
				</li>
				 
				</c:forEach>
			</ul>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"></fmt:formatDate>
			<c:if test="${list.size() == 0}">
						
			
				<div class="reply_content">
				
					<div class="reply_writer"><span>관리자</span><span>${today}</span></div>
					<div class="reply_txt"><span>등록된 댓글이 없습니다. 댓글을 등록해주세요.</span></div>
				</div>
			
			</c:if>
			
			<c:choose>
			<c:when test="${empty userid}">
				<div class="nav" style="padding-top: 20px">
				<div class="header_content_search">
					<div class="list_title_topic">댓글쓰기는 <a id="reply_login">로그인</a>이 필요한 기능입니다.</div>
					
				</div>
			</div>
			</c:when>
			<c:otherwise>			
			<form id="frm_reply">
			
			<input type="hidden"name="bno" id="reply_bno">
			<input type="hidden"name="type" id="reply_type">
			<input type="hidden"name="writer" id="reply_writer">
			<div class="nav" style="padding-top: 20px">
				<div class="header_content_search">
					<div class="list_title_topic">${userid}</div>
						<textarea name="content"
							class="list_reply_content"></textarea>
						<ul class="header_content_sort_group ul flex left margin-bottom">
							<li class="list"><button type = "button" class="btn-primary" id ="reply_btn">댓글입력</button></li>
							<li><div id="reply_err_msg">에라</div></li>
						</ul>
				</div>
			</div>
			
			</form>
			</c:otherwise>
			</c:choose>
			<input type="hidden"name="size" id="reply_size" value ='${list.size()}'>
		</div>
</body>
<script type="text/javascript">
	$(function(){
		$('#reply_login').click(function(){
			$('.modal_wrap').css('display','flex');
		});
	});
</script>
</html>