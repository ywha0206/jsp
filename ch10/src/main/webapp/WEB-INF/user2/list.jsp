<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User2::list</title>

</head>
<body>
	<h3>User2 목록</h3>
	<a href="/ch10/">처음으로</a>
	<a href="/ch10/user2/register.do">등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<c:forEach var="user" items="${users}">
		<tr>
			<td>${user.getUid()}</td><!-- getter 호출 -->
			<td>${user.getName()}</td>
			<td>${user.birth}</td><!-- 표현언어는 private 속성 직접 참조 가능 -->
			<td>${user.addr}</td>
			<td>
				<a href="/ch10/user2/modify.do?uid=${user.uid}">수정</a>
				<a href="/ch10/user2/delete.do?uid=${user.uid}">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>