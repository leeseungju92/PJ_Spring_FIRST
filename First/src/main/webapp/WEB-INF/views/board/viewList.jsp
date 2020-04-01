<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</head>

<body>
	<%@ include file ="../include/modal.jsp" %>	
	<div class="content">
		<div class="write">
			<div class="board_name left">상세 게시글</div>
		</div>
		<div class="panel">
			<ul>
				<li class="list_group_item flex jcsb">

					<div class="list_user_info flex">
						<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
						<div class="flex">
							<div>${map.bDto.writer}</div>
						</div>
					</div>
					<div class="list_info flex">
						<div class="list_title_icon right">
							<i class="far fa-comment" id ="viewlist_replycnt">${map.bDto.replycnt }</i><i
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
								href="${header.referer}"
								class="btn-primary" id="viewlist_list">목록</a></li>
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
		
		<div id="listReply"></div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	setInterval(refreshReply,180000);
	
	listReply();
	$('#btn_delete_viewList').click(function(){		
		$('.include_modal_wrap').css('display','flex');
	});
	$('#modal_msg_yes').on('click', function(){
		location.href='${path}/board/drop?bno='+${map.bDto.bno};
	});
	var referer = '${header.referer}';
	var reindex = referer.indexOf('board/list');
	if(reindex==-1){
		$('#viewlist_list').prop("href","${path}/board/list");	
	}
		
});
$(document).on('click','#reply_btn',function(){
	var reply_txt = $('.list_reply_content').val();
	
	if(reply_txt == '' || reply_txt.length == 0) { 
		$('.list_reply_content').focus();
		$('#reply_err_msg').css('display','block');
		return false;
	}
	
	$('#reply_bno').val('${map.bDto.bno}');
	$('#reply_type').val('${map.bDto.type}');
	$('#reply_writer').val('${userid}');
	
	$.ajax({		
		url : '${path}/reply/insert',
		type : 'POST',
		async: false,
		data : $('#frm_reply').serialize(),		
		success : function(){
			
			
			
			listReply();
			
			
		},
		error : function(){
			alert('실패');
		}			
	});
});	
$(document).on('click','#reply_del_btn',function(){
	var rno =$(this).attr("data_num");
	var bno = '${map.bDto.bno}';
	$.ajax({
		url : '${path}/reply/delete',
		type : 'POST',
		data : {"rno":rno, 'bno':bno},
		success : function(){
			listReply();
		},
		error : function(){
			alert('실패');
		}
	});
});

$(document).on('click','#reply_refresh',function(){	
	listReply();
});
function listReply(){
	$.ajax({
		type: "GET",
		url: "${path}/reply/list?bno=${map.bDto.bno}",
		success: function(result){
			$("#listReply").html(result);
		
			$('#viewlist_replycnt').text($('#comment_list_size').text());
			
		}
	});
};
function refreshReply(){
	
	listReply();
}
</script>
	
</html>