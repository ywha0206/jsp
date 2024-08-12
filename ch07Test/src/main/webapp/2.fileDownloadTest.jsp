<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sub1.FileVO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%

	List<FileVO> files = new ArrayList<>();

	//데이터베이스 처리
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		String sql = "select * from `filetest`";
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			FileVO vo = new FileVO();
			vo.setNo(rs.getInt(1));
			vo.setUid(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setOname(rs.getString(4));
			vo.setSname(rs.getString(5));
			vo.setRdate(rs.getString(6));
			
			files.add(vo);
		}
		
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
	<title>file download Test</title>
	<!-- 
		날짜: 2024/08/12
		이름: 박연화
		내용: 파일 다운로드 실습하기
	 -->
</head>
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
<body>
	<h3>file download Test</h3>
	
	<table border="1">
		<tr>
			<th>파일번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>원본파일명</th>
			<th>저장파일명</th>
			<th>등록일</th>
			<th>다운로드</th>
		</tr>
		<% for(FileVO vo : files){ %>
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getUid() %></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getOname() %></td>
			<td><%= vo.getSname() %></td>
			<td><%= vo.getRdate() %></td>
			<td>
				<a href="./proc/fileRemove.jsp?no=<%=vo.getNo()%>">삭제</a>
				<a href="./proc/fileDownload.jsp?no=<%= vo.getNo() %>" class="del">다운로드</a>
			</td>		
		</tr>
		
		<%} %>
	</table>
</body>
</html>