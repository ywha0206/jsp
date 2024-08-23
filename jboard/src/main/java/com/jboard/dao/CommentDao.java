package com.jboard.dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.CommentDto;
import com.jboard.util.DBHelper;
import com.jboard.util.SQL;

import jakarta.servlet.jsp.tagext.TryCatchFinally;

public class CommentDao extends DBHelper{
	private static CommentDao instance = new CommentDao();
	public static CommentDao getInstance() {
		return instance;
	}
	private CommentDao() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertComment(CommentDto dto) {
		int pk = 0;
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_COMMENT, Statement.RETURN_GENERATED_KEYS);
			psmt.setInt(1, dto.getParent());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegip());
			psmt.executeUpdate();
			
			rs = psmt.getGeneratedKeys();
			
			if(rs.next()) {
				pk = rs.getInt(1);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return pk;
	}
	
	public CommentDto selectComment(int no) {
		CommentDto dto = null;
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COMMENT);
			psmt.setInt(1, no);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new CommentDto();
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setContent(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setRegip(rs.getString(5));
				dto.setRdate(rs.getString(6));
			}
		} catch (Exception e) {
		}finally {
			closeAll();
		}
		
		
		return dto;
	}
	
	public List<CommentDto> selectComments(String parent) {
	
		List<CommentDto> comments = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setString(1, parent);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CommentDto dto = new CommentDto();
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setContent(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setRegip(rs.getString(5));
				dto.setRdate(rs.getString(6));
				dto.setNick(rs.getString(7));
				
				comments.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll();
		}
		logger.debug("dao comments: "+comments.toString());
		return comments;
	}
	
	public int updateComment(CommentDto dto) {
		int result = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_COMMENT);
			psmt.setString(1, dto.getContent());
			psmt.setInt(2, dto.getNo());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		
		return result;
	}
	
	public int deleteComment(String no) {
		int result = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
			psmt.setString(1, no);
			
			result = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return result;
	}
	
	
}
