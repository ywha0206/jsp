
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user1.User3VO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	List<User3VO> users = new ArrayList<>();
	

	try{
		//1단계 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//2단계 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		//3단계 SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		//4단계 SQL 실행
		String sql = "select * from `user3`";
		ResultSet rs = stmt.executeQuery(sql);
		
		//5단계 결과 처리
		while(rs.next()){
			User3VO vo = new User3VO(); //vo생성해서 vo 초기화
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setHp(rs.getString(4));
			vo.setAddr(rs.getString(5));
			
			users.add(vo);
		}
		
		//6단계 데이터베이스 종료
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
<title>User3::list</title>
<script>
	window.onload = function(){
		
		const del = document.querySelectorAll('.del');
		
		//리스트에 삭제 링크가 여러개이기 때문에 문서객체 리스트를 순회(반복)하면서 이벤트 처리
		//고전 문서객체 선택함수(getElement~)는 forEach 지원 안 함
		del.forEach(function(item){
			
			item.onclick = function(e){
				const result = confirm('정말 삭제하시겠습니까?');
				
				if(!result){
					e.preventDefault();
				}
			
			}
		});
	}
</script>
</head>
<body>
	<h3>User3 목록</h3>
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a>
	<a href="/ch06/user3/register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		
		<% for(User3VO vo : users){ %>
		<tr>
			<td><%= vo.getUid() %></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getBirth() %></td>
			<td><%= vo.getHp() %></td>
			<td><%= vo.getAddr() %></td>
			<td>
				<a href="/ch06/user3/modify.jsp?uid=<%= vo.getUid() %>">수정</a>
				<a href="/ch06/user3/remove.jsp?uid=<%= vo.getUid() %>" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
		
	</table>
</body>
</html>