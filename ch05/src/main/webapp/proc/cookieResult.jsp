<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookie result</title>
</head>
<body>
	<h3>쿠키확인</h3>
	<%
		// request는 기본적으로 쿠키를 가지고 요청
		Cookie[] cookies = request.getCookies();
	
		for(Cookie cookie : cookies){
	%>		
		<p>
			쿠키명: <%= cookie.getName() %><br>
			쿠키값: <%= cookie.getValue() %><br>
		</p>
	<%		
		}
	%>
	
	<a href="../1.CookieTest.jsp">처음으로</a>
	
</body>
</html>