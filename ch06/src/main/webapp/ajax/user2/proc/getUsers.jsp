<%@page import="user2.User2VO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User2VO> users = new ArrayList<>();

	try{
		//1단계 JNDI 서비스 객체 생성
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		//2단계 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		//2. SQL 실행 객체 생성
		String sql = "select * from `user2`";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		//3. SQL 실행
		ResultSet rs = psmt.executeQuery();
		
		//4. 결과 처리 (select일 경우)
		while(rs.next()){
			User2VO vo = new User2VO(); //vo생성해서 vo 초기화
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setAddr(rs.getString(4));
			
			users.add(vo);
		}
		
		//5. 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

	
	//json 출력 >> content-Type application/json 설정
	Gson gson = new Gson();
	String jsonData = gson.toJson(users);
	out.print(jsonData);



%>