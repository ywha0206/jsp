<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//json 문자열 생성
	String jsonData = "{\"uid\": \"a101\", \"name\":\"홍길동\", \"age\": 23,\"addr\":\"부산\"}";
	
	//json 출력
	out.print(jsonData);

%>