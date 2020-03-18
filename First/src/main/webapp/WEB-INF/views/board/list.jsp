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
			color: #ffffff;
		}
		.pagination a:active{
			outline: none;
		}
		.modal .num{
			margin-left: 3px;
			padding: 0;
			width: 30px;
			height: 30px;
			line-height: 30px;
			border-radius: 100%;
		}
		.num.active, .num:active{
			background-color: #2e9cdf;
			cursor: pointer;
		}
		.arrow left{
			width: 0;
			height: 0;
			border-top: 10px solid transparent;
			border-bottom: 10px solid transparent;
			border-right: 10px solid blue;
		}
		.board_name{
			font-size: 27PX;
		}
	</style>

</head>

<body>
	<div class="content">
		
		<div class="write">
			<div class="board_name left">게시판</div>
			<button class="btn-primary right btn_write"><i class="fas fa-pencil-alt"></i>새 글 쓰 기</a></button> 
		</div>					
		<div class="nav">
			<div class="header_content_search">
				<form name="frm_search" action="" method="GET">
					<div class="header_content_search_group right">
						<input type="text" placeholder="무엇이든 검색하기" name="keyword" class="header_content_search_input">
						<button type="button" class="header_content_search_btn"><i class="	fas fa-search"></i></button>
					</div>
					<ul class="header_content_sort_group ul left">
							<li class="list"><a href="#">최신순</a></li>
							<li class="list"><a href="#">추천순</a></li>
							<li class="list"><a href="#">댓글순</a></li>
							<li class="list"><a href="#">스크랩순</a></li>
							<li class="list"><a href="#">조회순</a></li>				
					</ul>
				</form>
			</div>
		</div>
		<div class="panel">
			<ul>

				
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">사는얘기</div>
						</div>						
						<div class="list_title_topic">디자인이 너무 싫어요</div>
					</div>
					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">20</i>
							<i class="far fa-thumbs-up">18</i>
							<i class="far fa-eye">5k</i><i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>초롱이</div>
								<div>2020.03.17</div>
							</div>
						</div>
					</div>
					
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">사는얘기</div>
						</div>						
						<div class="list_title_topic">디자인이 너무 싫어요</div>
					</div>
					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">20</i>
							<i class="far fa-thumbs-up">18</i>
							<i class="far fa-eye">5k</i><i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>초롱이</div>
								<div>2020.03.17</div>
							</div>
						</div>
					</div>
					
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">사는얘기</div>
						</div>						
						<div class="list_title_topic">디자인이 너무 싫어요</div>
					</div>
					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">20</i>
							<i class="far fa-thumbs-up">18</i>
							<i class="far fa-eye">5k</i><i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>초롱이</div>
								<div>2020.03.17</div>
							</div>
						</div>
					</div>
					
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">사는얘기</div>
						</div>						
						<div class="list_title_topic">디자인이 너무 싫어요</div>
					</div>
					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">20</i>
							<i class="far fa-thumbs-up">18</i>
							<i class="far fa-eye">5k</i><i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>초롱이</div>
								<div>2020.03.17</div>
							</div>
						</div>
					</div>
					
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">사는얘기</div>
						</div>						
						<div class="list_title_topic">디자인이 너무 싫어요</div>
					</div>
					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">20</i>
							<i class="far fa-thumbs-up">18</i>
							<i class="far fa-eye">5k</i><i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>초롱이</div>
								<div>2020.03.17</div>
							</div>
						</div>
					</div>
					
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">사는얘기</div>
						</div>						
						<div class="list_title_topic">디자인이 너무 싫어요</div>
					</div>
					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">20</i>
							<i class="far fa-thumbs-up">18</i>
							<i class="far fa-eye">5k</i><i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>초롱이</div>
								<div>2020.03.17</div>
							</div>
						</div>
					</div>
					
				</li>
				<li class="list_group_item flex jcsb">
					<div class="list_title_wrapper">
						<div class="flex">
							<div class="list_title_num">#000001</div>
							<div class="list_title_category">사는얘기</div>
						</div>						
						<div class="list_title_topic">디자인이 너무 싫어요</div>
					</div>
					
					<div class="list_info flex">
						<div class="list_title_icon">
							<i class="far fa-comment">20</i>
							<i class="far fa-thumbs-up">18</i>
							<i class="far fa-eye">5k</i><i class="fas fa-file"></i>
						</div>

						<div class="list_user_info flex">
							<img src="${path}/resources/img/FIRST.png" style="width: 30px;">
							<div>
								<div>초롱이</div>
								<div>2020.03.17</div>
							</div>
						</div>
					</div>					
				</li>	
			</ul>
		</div>
		<div class="page">
			<ul class="pagination">
				<li><a href="#" class="first">처음페이지</a></li>
				<li><a href="#" class="arrow left"><<</a></li>
				<li><a href="#" class="active num">1</a></li>
				<li><a href="#" class="num">2</a></li>
				<li><a href="#" class="num">3</a></li>
				<li><a href="#" class="num">4</a></li>
				<li><a href="#" class="num">5</a></li>
				<li><a href="#" class="num">6</a></li>
				<li><a href="#" class="num">7</a></li>
				<li><a href="#" class="arrow right">>></a></li>
				<li><a href="#" class="last">끝 페이지</a></li>

			</ul>
		</div>	
	</div>	
</body>
</html>