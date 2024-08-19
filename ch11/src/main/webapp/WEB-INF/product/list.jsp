<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>product::list</title>
</head>
<body>
	<h3>고객목록</h3>
	
	<a href="/ch11">처음으로</a>
	<a href="/ch11/product/register.do">등록</a>
	
	<table border="1">
		<tr>
			<th>제품아이디</th>
			<th>제품명</th>
			<th>재고</th>
			<th>가격</th>
			<th>제조사</th>
			<th>관리</th>
		</tr>
		<c:forEach var="product" items= "${products}">
		<tr>
			<th>${product.prodNo}</th>
			<th>${product.prodName}</th>
			<th>${product.stock}</th>
			<th>${product.price}</th>
			<th>${product.company}</th>
			<th>
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</th>
		</tr>
		</c:forEach>
	</table>
</body>
</html>