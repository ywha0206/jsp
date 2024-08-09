<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//데이터베이스 수정 처리
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	
	
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	try{
		// 드라이버 로드		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//1. 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		//2. SQL 실행 객체 생성
		String sql = "update `user4` set `name`=?,`gender`=?,`age`=?,`hp`=?,`addr`=? where `uid`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, hp);
		psmt.setString(5, addr);
		psmt.setString(6, uid);
		
		//3. SQL 실행
		psmt.executeUpdate();
		
		//4. 결과 처리 (select일 경우)
		//5. 데이터베이스 종료
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록 이동
	response.sendRedirect("/ch06/user4/list.jsp");


%>