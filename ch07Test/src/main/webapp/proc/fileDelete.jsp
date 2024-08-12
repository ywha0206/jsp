<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sub1.FileVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String no = request.getParameter("no");
	String sname = null;

	try{

	//데이터베이스 파일 정보 삭제
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		PreparedStatement psmt = conn.prepareStatement("select sname from filetest where `no` = ?");
		psmt.setString(1, no);
		Statement stmt = conn.createStatement();
		
		ResultSet rs = psmt.executeQuery();
		
		
		if(rs.next()){
			sname = rs.getString(1);
		}
		stmt.executeUpdate("delete from `filetest` where `no`="+no);
		
		rs.close();
		stmt.close();
		psmt.close();
		conn.close();
	
	//디렉터리 파일 삭제
	
	String path = application.getRealPath("/uploads");
	File file = new File(path + File.separator + sname);
	
	file.delete();

	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	response.sendRedirect("../2.fileDownloadTest.jsp");
	
%>