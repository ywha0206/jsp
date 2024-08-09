
<%@page import="bank.CustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<CustomerVO> customers = new ArrayList<>();
	try{
	//1단계 - JNDI 서비스 객체 생성 JNDI 객체로 서비스 참조
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env");
	
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
	DataSource ds =(DataSource) ctx.lookup("jdbc/bank");
	Connection conn= ds.getConnection();
	
	//3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
	
	//4단계 - SQL 실행
	ResultSet rs = stmt.executeQuery("select * from bank_customer");
	
	//5단계 - 결과 처리
	while(rs.next()){
		CustomerVO vo = new CustomerVO();
		vo.setNo(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setDist(rs.getInt(3));
		vo.setPhone(rs.getString(4));
		vo.setAddr(rs.getString(5));
		
		customers.add(vo);
	}
	
	//6단계 - 커넥션 반납
	rs.close();
	stmt.close();
	conn.close();

	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bank Customer::list</title>
</head>
<body>
	<h3>은행 고객목록</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a>
	<a href="/ch06/shop/customer/register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>계좌번호</th>
			<th>고객명</th>
			<th>고객번호</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<% for(CustomerVO vo : customers){ %>
		<tr>
			<th><%= vo.getNo() %></th>
			<th><%= vo.getName() %></th>
			<th><%= vo.getDist() %></th>
			<th><%= vo.getPhone() %></th>
			<th><%= vo.getAddr() %></th>
			<th>
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</th>
		</tr>
		<% } %>
	</table>
</body>
</html>