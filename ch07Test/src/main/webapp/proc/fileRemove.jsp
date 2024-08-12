<%@page import="java.util.ArrayList"%>
<%@page import="sub1.FileVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	
	String no = request.getParameter("no");
	String sname = null;

	//데이터베이스 처리
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		
		// 파일명 가져오기
		String sql = "select sname from `filetest` where `no`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,no);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			sname = rs.getString(1);
		}
		
		//데이터베이스에서 정보 삭제하기
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("delete from filetest where `no` ="+no);
		
		
		rs.close();
		psmt.close();
		stmt.close();
		conn.close();
		
		
		// 파일 삭제
		String path = application.getRealPath("/uploads");
		File file = new File(path + File.separator + sname);
		file.delete();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("../2.fileDownloadTest.jsp");

%>