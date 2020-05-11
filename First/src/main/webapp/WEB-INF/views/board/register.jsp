<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.html</title>
<script src="${path}/resources/js/fileAttach.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
.form-group{
	align-items:flex-start;	
}
.form-group > label{
	margin-top:10px;
}
.form-group .board_div{
	width:805px;
	border:1.5px dashed #dadada;
	text-align:center;
	height:150px;
	display:flex;
	align-items :center;
	justify-content:center;
	color:#515151;
	font-size:15px;
}


</style>

</head>
<body>
	<div class="content">
		<div class="write">
			<div class="board_name left" id="board_register_name">게시글 등록</div>
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
					<li class="list_group_item flex jcsb">
					
						<input	class="list_title_topic" name="title" id="insert_title" value="${one.title}">
					</li>
					<li class="list_group_item flex jcsb">
					<script
							type="text/javascript"
							src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
							charset="utf-8"></script> 
							<textarea class="list_title_content"
							name="view_content" id="board_insert_content"
							style="min-width: 805px; width: 100%; minheight:100px;">${one.view_content}</textarea>							
							</li>
					<div class= "input_wrap form-group">
					<div class="board_div fileDrop">
						<p><i class ="fas fa-paperclip"></i>첨부파일을 드래그 해주세요.
					</div>
					<ul class="mailbox-attachments flex clearfix uploadedList">
					</ul>						
				</div>
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
<script id="fileTemplate" type="text/x-handlebars-template">
	<li>
		<div class="mailbox-attachment-icon has-img" style="width=805px;">
			<img src="{{imgSrc}}" alt="Attachment" class="s_img">
		</div>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
				<i class="fas fa-times"></i>
			</span>
		</div>
	</li>
</script>
<script type="text/javascript">
	var deleteFileList = new Array();
	var flag = '${flag}';
	console.log('flag'+flag);
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	$(function() {
		
		if(flag == 'update'){
			$('#board_insert').text('수정');
			$('#board_register_name').text('게시글수정');
			$('.list_type').val('${one.type}').attr('selected','selected');
			
			listAttach('${path}','${one.bno}');
		}else if(flag == 'answer'){
			$('#board_insert').text('답글');
			$('#board_register_name').text('답글');
			$('.list_type').val('${one.type}').attr('selected','selected')
							.attr('onFocus', 'this.initialSelect = this.selectedIndex')
							.attr('onchange','this.selectedIndex=this.selectedIndex');
			$('#insert_title').val('${one.title}')
								.attr('readonly','readonly');
								
		}
		
		$('#board_insert').click(function() {
			var title= $('#insert_title').val();
			if(title==''||title.length ==0){
				$('.err_msg').css('display','block')
							.text('제목을입력해주세요');
				return false;
			} else{
				oEditors.getById["board_insert_content"].exec("UPDATE_CONTENTS_FIELD", []);
				var view_content =$('#board_insert_content').val();
				var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp;","");
				$('#frm_insert').append('<textarea class="list_title_content" name="search_content" id="search_content"></textarea>');
				$('#search_content').val(search_content);
				
				
				var str = '';
				$('.uploadedList .file').each(function(i){
					console.log(i);
					str+= "<input type ='hidden',  name ='files["+i+"]' value ='"+$(this).val()+"'>";
				});
				if(deleteFileList.length >0){
					$.post('${path}/upload/deleteAllFile', {files:deleteFileList},function(){});
				}
				$("#frm_insert").append(str);
				
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
		
		$('.fileDrop').on('dragenter dragover' , function(e){
			e.preventDefault();			
		});
		
		$('.fileDrop').on('drop',function(e){
			e.preventDefault();
			
			var files = e.originalEvent.dataTransfer.files;
			var file = files[0];
			
			var formData = new FormData();
			//폼타입에 데이터를 담을수있는 객체
			formData.append('file',file);
			
			$.ajax({
				url:'${path}/upload/uploadAjax',
				data: formData,
				datatype:'text',
				processData:false,
				contentType:false,
				type:'POST',
				success:function(data){
					console.log(data);
					printFiles(data, '${path}');
				}
			});
		});
		$('.uploadedList').on('click','.delBtn', function(event){
			var bno = '${one.bno}';
			var that = $(this);
			if(bno==''){
				$.ajax({
					url : '${path}/upload/deleteFile',
					type : 'POST',
					data : {fileName: $(this).attr('data-src')},
					success : function(data){
						if(data=='deleted'){
							that.parents('li').remove();							
						}						
					}, error: function(){
						alert('System Error!!!!');
					}					
				});
			}else{
				var arr_size = deleteFileList.length;
				deleteFileList[arr_size] = $(this).attr('data-src');
				$(this).parents('li').next('input').remove();
				$(this).parents('li').remove();
				for(var i =0; i<deleteFileList.length;i++){
					console.log(deleteFileList[i]);
				}
				
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