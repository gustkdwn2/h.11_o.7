<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var string = ["abc","def"];
			var vparam = "test";
			$('#btn').click(function(){
				$.ajax(
						{
							url : "<%=request.getContextPath()%>/ArrayServlet.do",
							type: "get",
							data:{"string":string},
							success:function(data){
								var as = eval(data);//객체 변환
								alert("data :" + as[0] + "/ " + as[1]);
							},
							error:function(msg,error){
								alert(error);
							}
						}
					  );
			});
				
		});	
	</script>
</head>
<body>
	<input type="button" id="btn" value="자바스크립트 배열 Ajax 전송">
	<div id="message"></div>	
</body>
</html>