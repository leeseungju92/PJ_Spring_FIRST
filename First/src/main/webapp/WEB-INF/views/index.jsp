<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퍼스트:부동산</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">
<style type="text/css">
div.content_main {
	display: flex;
	width: 1400px;
	margin: 35px auto 35px;
	box-sizing: border-box;
	height: 350px; /*임시로 고정*/
	border: 1px solid red;
}

div.content_main_text {
	width: 33.33%;
	margin: 0 15px 0 0;
	box-sizing: border-box;
	height: 350px; /*임시로 고정*/
	border: 1px solid red;
}

div.content_main_easysearch {
	display: flex;
	width: 100%;
	height: 50%;
	box-sizing: border-box;
	border: 1px solid red;
}

div.content_main_easycontent {
	width: 33.33%;
	box-sizing: border-box;
	border: 1px solid red;
}

div.content_main_easycontent_img {
	width: 100%;
	height: 70%;
	line-height: 70%;
	border: 1px solid red;
}

div.content_main_easycontent_text {
	width: 100%;
	height: 30%;
	border: 1px solid red;
}

div.content_inf {
	display: flex;
	width: 1400px;
	margin: 35px auto;
	box-sizing: border-box;
	height: 300px; /*임시로 고정*/
	border: 1px solid red;
}

div.content_inf_text {
	width: 20%;
	margin: 0 10px 0 0;
	box-sizing: border-box;
	height: 300px; /*임시로 고정*/
	border: 1px solid red;
	background-color: #3885ca;
	border-radius: 3px;
	color: white;
}

div.information {
	height: 80%;
	padding: 30px;
	font-size: 18px;
}

.fa-play {
	padding: 0 30px 30px;
}

.newscrawl_wrap {
	width: 100%;
	height: 12.5%;
	padding: 3px, 0;
	box-sizing: border-box;
	border: 1px solid red;
	line-height: 43.5px;
	display: flex;
}

.newscrawl {
	width: 80%;
	overflow: hidden;
	padding: 3px, 0;
	box-sizing: border-box;
	border: 1px solid red;
	line-height: 43.5px;
}

.newscrawl_inf {
	width: 20%;
	padding: 3px, 0;
	box-sizing: border-box;
	border: 1px solid red;
	line-height: 43.5px;
	display: flex;
	justify-content: space-around;
}

div.middle {
	width: 100%;
	text-align: center;
}

.btn_middle {
	display: inline-block;
	width: 90px;
	height: 90px;
	background-color: #f1f1f1;
	margin: 10px;
	border-radius: 30%;
	box-shadow: 0 5px 15px -5px #00000070; /* 그림자는 만들어진거 갖다 붙이기*/
	color: #0F4C81; /* 글자색 */
	overflow: hidden; /* 내 사이즈 바깥으로 나가면 숨기겠다 */
	position: relative; /* absolute를 부모 기준으로 주기 위해서 만듦 */
}

.btn_middle i {
	line-height: 90px;
	font-size: 26px;
	transition: 0.2s linear;
}

.btn_middle:hover i {
	transform: scale(1.3); /* scale(1.3) : 기존 사이드보다 1.3배 키워라(가로세로 고르게!) */
	color: white;
}

.btn_middle::before {
	content: "";
	position: absolute;
	width: 120%;
	height: 120%;
	background-color: #0F4C81;
	transform: rotate(45deg);
	left: -110%;
	top: 90%;
}

.btn_middle:hover::before {
	animation: aaa 0.7s 1; /* aaa라는 동작을 0.7초에 걸쳐서 1번만 실행해라 */
	top: -10%;
	left: -10%;
}

@keyframes aaa {
	 0% {
	left: -110%;
	top: 90%;
	}
	50%{left:10%;
		top:-30%;
	}
	100%{top:-10%;
		left:-10%;
	}
}

</style>

</head>
</head>
<body>
	<%@ include file="include/modal.jsp"%>
	<div class="content_wrap_main">
		<div class="content_main">
			
			
			<div class="content_main_text">
				<c:forEach items="${BestPdt}" var="pdt">								
				<div class="newscrawl_wrap">
					<div class="newscrawl">
						<a href="${pdt.nhref }"><strong>"${pdt.ntitle}"</strong></a>
					</div>
					<div class="newscrawl_inf">
						<span><fmt:formatDate value="${pdt.regdate}" type="date"></fmt:formatDate></span>
					</div>
				</div>			
				</c:forEach>
			</div>
			

			
			<div class="content_main_text">
				<div class="content_main_easysearch">
					<div class="content_main_easycontent">
						<a href="">
							<div class="content_main_easycontent_img"></div>
							<div class="content_main_easycontent_text">
								월세+관리비<br>50이하 원룸
							</div>
						</a>
					</div>
					<div class="content_main_easycontent">
						<a href="">
							<div class="content_main_easycontent_img"></div>
							<div class="content_main_easycontent_text">
								보증금<br>500이하 원룸
							</div>
						</a>
					</div>
					<div class="content_main_easycontent">
						<a href="">
							<div class="content_main_easycontent_img"></div>
							<div class="content_main_easycontent_text">
								반려동물<br>가능한 원룸
							</div>
						</a>
					</div>
				</div>
				<div class="content_main_easysearch">
					<div class="content_main_easycontent">
						<a href="">
							<div class="content_main_easycontent_img"></div>
							<div class="content_main_easycontent_text">
								2억이하<br>전세 투쓰리룸
							</div>
						</a>
					</div>
					<div class="content_main_easycontent">
						<a href="">
							<div class="content_main_easycontent_img"></div>
							<div class="content_main_easycontent_text">
								전세자금대출<br>가능한 투쓰리룸
							</div>
						</a>
					</div>
					<div class="content_main_easycontent">
						<a href="">
							<div class="content_main_easycontent_img"></div>
							<div class="content_main_easycontent_text">
								3억이하<br>전세 아파트
							</div>
						</a>
					</div>
				</div>

			</div>
			<div class="content_main_text" id="map" style="margin: 0;">
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d248a3355701e98107839e3f64a7524"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.47693, 126.97755), // 지도의 중심좌표
						level : 4, // 지도의 확대 레벨
						mapTypeId : kakao.maps.MapTypeId.ROADMAP
					// 지도종류
					};
					// 지도를 생성한다 
					var map = new kakao.maps.Map(mapContainer, mapOption);
					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker({
						position : new kakao.maps.LatLng(37.47693, 126.97755), // 마커의 좌표
						map : map
					// 마커를 표시할 지도 객체
					});
					// 마커 위에 표시할 인포윈도우를 생성한다
					var infowindow = new kakao.maps.InfoWindow({
						content : '<div style="padding:5px;">퍼스트 부동산 :D</div>' // 인포윈도우에 표시할 내용
					});

					// 인포윈도우를 지도에 표시한다
					infowindow.open(map, marker);
				</script>
			</div>
		</div>
		<div class="middle">
		<a class="btn_middle" href="#">
			<i class="fab fa-facebook-f"></i>
		</a>
		<a class="btn_middle" href="#">
			<i class="fab fa-twitter"></i>
		</a>
		<a class="btn_middle" href="#">
			<i class="fab fa-google"></i>
		</a>
		<a class="btn_middle" href="#">
			<i class="fab fa-instagram"></i>
		</a>
		<a class="btn_middle" href="#">
			<i class="fab fa-youtube"></i>
		</a>
	</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="content_wrap_inf">
		<div class="content_inf">
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=25443036&memberNo=2120568">
					<div class="information">
						매물 체크리스트<br>
						<br> 방 구하기 전<br> 꼭 확인하자
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=27011368&memberNo=2120568">
					<div class="information">
						허위매물<br>
						<br> 예방하자<br> 5계명!<br>
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=26596142&memberNo=2120568">
					<div class="information">
						임대차 계약 작성시<br>
						<br> 이것만은 꼭<br> 알아두자
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568">
					<div class="information">
						19~34세<br>
						<br> 알아 두면 좋은<br> 청년 주거지원 정책<br>
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text" style="margin: 0;">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=25389507&memberNo=2120568">
					<div class="information">
						이사체크리스트<br>
						<br> 이사한다면<br> 필독!
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
		</div>
	</div>
	<div class="content_wrap_inf">
		<div class="content_inf">
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=25443036&memberNo=2120568">
					<div class="information">
						매물 체크리스트<br>
						<br> 방 구하기 전<br> 꼭 확인하자
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=27011368&memberNo=2120568">
					<div class="information">
						허위매물<br>
						<br> 예방하자<br> 5계명!<br>
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=26596142&memberNo=2120568">
					<div class="information">
						임대차 계약 작성시<br>
						<br> 이것만은 꼭<br> 알아두자
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568">
					<div class="information">
						19~34세<br>
						<br> 알아 두면 좋은<br> 청년 주거지원 정책<br>
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
			<div class="content_inf_text" style="margin: 0;">
				<a
					href="https://post.naver.com/viewer/postView.nhn?volumeNo=25389507&memberNo=2120568">
					<div class="information">
						이사체크리스트<br>
						<br> 이사한다면<br> 필독!
					</div> <i class="fas fa-play"></i>
				</a>
			</div>
		</div>
	</div>
</body>
</html>