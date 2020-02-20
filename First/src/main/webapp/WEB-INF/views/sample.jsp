<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
	
	<a href="${path}/sample/view?user=배뚱&pass=1234">Get</a>	
	<form action="${path}/sample/view" method="POST">
		<input type="text" name="user">		
		<input type="password" name="pass">
		<button type="submit">Post</button>
	</form>
	
	
	<img src="${path}/resources/img/sleeper.png" style="width:500px; height:500px;">
	<br>
	<a href="${path}/sample/sync?name=배뚱아"> 동기방식</a>
	<button type="button" id="ajax_btn">비동기방식(ajax)</button>
	<br>
	<div><span>동기:${name}</span></div>
	<div><span>비동기:<span id = "ajax_txt"></span></span></div>
</body>
<script type="text/javascript">
	$('#ajax_btn').on('click', function(){		
		$.ajax({
			type: 'POST',
			url: '${path}/sample/ajax?',			
			data : {name:'뚱깐징어'},			
			success:function(args){
				console.log(args);			
				$('#ajax_txt').text(args);
			},
			error:function(){
				alert('System ERROR :(');
			}
		});
});
</script>
</html>