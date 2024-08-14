<%@page import="user1.User3VO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		User3VO vo = null;
		String uid = request.getParameter("uid");
	try{
		//1단계 JNDI 서비스 객체 생성
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		//2단계 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		//2. SQL 실행 객체 생성
		String sql = "select * from `user3` where `uid`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		//3. SQL 실행
		ResultSet rs = psmt.executeQuery();
		
		//4. 결과 처리 (select일 경우)
		if(rs.next()){
			vo = new User3VO(); //vo생성해서 vo 초기화
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setHp(rs.getString(4));
			vo.setAddr(rs.getString(5));
			
		}
		
		//5. 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}


	//json 출력
	Gson gson = new Gson();
	String jsonData = gson.toJson(vo);
	out.print(jsonData);

%>