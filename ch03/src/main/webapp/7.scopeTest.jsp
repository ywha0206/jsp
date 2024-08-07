<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7.scopeTest</title>
	<!-- 
		날짜: 2024/08/07
		이름: 박연화
		내용: 내장객체 영역 실습하기
	 -->

</head>
<body>
	<h3>7. 내장객체 영역</h3>
	<%
		//각 내장객체 값 설정
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "장보고");
		application.setAttribute("name", "강감찬");
	%>
	
	<h4>내장객체 값 확인</h4>
	<p>
		pageContext 값: <%= pageContext.getAttribute("name") %><br>
		request 값: <%= request.getAttribute("name") %><br>
		session 값: <%= session.getAttribute("name") %><br>
		application 값: <%= application.getAttribute("name") %><br>
	</p>
	
	<%	//pageContext로 제어권을 이동하고 나면 새로운 scopeResult.jsp가 생기고, 
		//scopeTest.jsp에 저장된 김유신은 result에는 없음
		pageContext.forward("./proc/scopeResult.jsp");
	%>
</body>
</html>