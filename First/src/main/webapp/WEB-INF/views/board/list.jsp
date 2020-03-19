<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.html</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
	<style type="text/css">
		.content{
			width: 805px;
			height: 800px;
			margin: 0 auto;
		}		
		.right{
			float: right;
		}
		.left{
			float: left;
		}
		.header_content_search_group{
			display: flex;
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
		}
		.header_content_search_input{
			background-color: transparent;/*색깔을 투명으로 줬다.*/
			border-color: transparent;
			height: 44px;
			font-size: 13px;
			border-radius: 2px;
			padding: 10px 12px;
			outline: none; /*input태그 focus시 파랑테두리 삭제해준다.*/
		}
		.header_content_search_btn{
			border-color: transparent;
			background-color: transparent;
			width: 44px;
			height: 44px;
			cursor: pointer;
			color: #3885CA;
			border-top-right-radius: 2px;/*돋보기에 커서올렸을때 오르쪽모서리만 둥글게 해주는기능*/
			border-bottom-right-radius: 2px;
		}
		.header_content_search_btn:hover{
			background-color: #0f4c81;
			color: white;
		}
		.btn_write{
			height: 44px;
		}

		.nav{
			height: 48px;

		}
		.write{
			height: 44px;
		}
		.ul{
			
			display: flex;
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
	
			
			position: relative;
			top: 24px;
		}
		.list{
			margin-right: 20px;
		}
		.flex{
			display: flex;
			
		}
		.list_group_item{
			position: relative;
			border-bottom: 1px solid #dadada;
			
		}
		.list_title_topic{
			font-size: 18px;
			font-weight: bold;
		}
		.list_title_icon{
			margin: auto 7px;
		}
		.jcsb{
			justify-content: space-between;
		}


		.page{
			text-align: center;
			
		}
		.pagination{
			list-style: none;
			display: inline-block;
			padding: 0;
			margin-top: 20px;
		}
		.pagination li{
			display: inline;
			text-align: center;			
		}
		.pagination a{
			float: left;
			display: block;
			font-size: 14px;
			text-decoration: none;
			padding: 5px 12px;
			color: #96a0ad;
			line-height: 1.5;
		}
		.first{
			margin-right: 15px;
		}
		.last{
			margin-left:15px;
		}
		.first:hover, .last:hover{
			color: #2e9cdf;
		}
		.pagination a.active{
			cursor: default;
			
		}
		.pagination a:active{
			outline: none;
		}
		.modal .num{
			margin-left: 7px;
			padding: 0;
			width: 30px;
			height: 30px;
			line-height: 30px;
			border-radius: 100%;
		}
		#check_color{
		background-color: #3885CA; 
		}
		
		.num:active, .num:active{
			background-color: #3885ca; 
			cursor: pointer;
		}
		.pagination_arrow left{
			width: 0;
			height: 0;
			border-top: 10px solid transparent;
			border-bottom: 10px solid transparent;
			border-right: 10px solid blue;
		}
		.board_name{
			font-size: 27PX;
		}
		.twincle_eff{
			animation-name: twinkle;
			animation-duration: 1.2s;
			animation-iteration-count: infinite;
		}
		@keyframes twinkle {
			0% {opacity:0;}
			100%{opacity:1;}
		}
		.new_color{
			border: 1px solid tomato;
			color: tomato;
			
			margin-left:7px;
			font-weight:bold;
			font-size:12px;
			
		}
		.fa-angle-right .fa-angle-left{
			font-size:16px;
			line-height:21px;
		}	
		.list_end{
			margin-right:0px;
		}	
	</style>

</head>

<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div class="content">
		
		<div class="write">
			<div class="board_name left">게시판</div>
			<button class="btn-primary right btn_write"><i class="fas fa-pencil-alt"></i>새 글 쓰 기</a></button> 
		</div>					
		<div class="nav">
			<div class="header_content_search">
				<form name="frm_search" action="${path}/board/list" method="GET">
					<div class="header_content_search_group right">
						<input type="text" placeholder="무엇이든 검색하기" name="keyword" class="header_content_search_input">
						<button type="submit" class="header_content_search_btn"><i class="	fas fa-search"></i></button>
					</div>
				</form>
					<ul class="header_content_sort_group ul left">
							<li class="list"><a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" id="sort_new">최신순</a></li>
							<li class="list"><a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" id="sort_good">추천순</a></li>
							<li class="list"><a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" id="sort_reply">댓글순</a></li>							
							<li class="list list_end"><a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt">조회순</a></li>				
					</ul>
				
			</div>
		</div>
		<div class="panel">
			<ul>				
				<c:forEach items="${map.list}" var="list">
				
				<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
				<li class="list_group_item flex jcsb">				
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num"><a href="#">${list.bno}</a></div>
							<div class="list_title_category"><a href="#">${list.type}</a></div>
						</div>						
						<div class="list_title_topic">
							<a href="#">${list.title}</a>
							<c:if test="${today == regdate}">
								<span class="new_color twincle_eff">N</span>
							</c:if>
						</div>
					</div>					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">${list.replycnt}</i>
							<i class="far fa-thumbs-up">${list.goodcnt}</i>
							<i class="far fa-eye">${list.viewcnt}</i>
							<i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>${list.writer}</div>								
								<div>
									<c:choose>
										<c:when test="${today ==regdate}">
											<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>					
				</li>
				</c:forEach>
				
				
			</ul>
		</div>
		<div class="page">
			<ul class="pagination">
			
				<c:if test="${map.pager.curBlock>1}">
					<li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="first page_left"><i class="fas fa-angle-left" style="font-size:14px;"></i></a></li>
					<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}" class="pagination_arrow page_left">1</a></li>
					<li><span class="left">...</span></li>
				</c:if>
				
				
				
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="active num no_color" id="check_color">${num}</a></li>	
					</c:when>
					<c:otherwise>
						<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="active num">${num}</a></li>	
					</c:otherwise>			
				</c:choose>
				</c:forEach>
				
												
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<li><span class="left">...</span></li>
					<li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="first page_left">${map.pager.totPage}</a></li>
					<li><a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="pagination_arrow page_left"><i class="fas fa-angle-right" style="line-heigt:31px;"></i></a></li>
				</c:if>
			</ul>
		</div>	
	</div>	
</body>
<script type="text/javascript">
	$(function(){
		
		var sort_option = '${map.sort_option}';
		$('#sort_'+sort_option).css('background-color', '#3885CA');
		
	});

</script>
</html>