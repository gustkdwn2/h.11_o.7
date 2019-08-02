<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#id').blur(function(){
				$.ajax(
						{
							type:'post',
							url:'IdCheckAction.do',
							data:{id:$('#id').val()},
							dataType:'xml',
							success:function(data){
								console.log(data);
								var x = $(data).find('id').text();
								console.log(x);
								if(x == 'y'){
									$('#help_text').html('사용가능 아이디');
								}else{
									$('#help_text').html('<b>사용불가능</b>');
									$('#id').text('');
								}
							}
							
						}
				      )
			});
		});
	</script>
</head>
<body>
	ID 검증하기:
	<input type="text" name="id"  id="id">
	<span id="help_text"></span>
</body>
</html>