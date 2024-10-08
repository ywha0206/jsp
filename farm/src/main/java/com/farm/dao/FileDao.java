package com.farm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farm.dto.FileDto;
import com.farm.util.DBHelper;
import com.farm.util.SQL;

public class FileDao extends DBHelper {
    private static FileDao instance = new FileDao();

    public static FileDao getInstance() {
        return instance;
    }

    private FileDao() {}
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    public void insertFile(FileDto dto) {   
        try {
        	conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_FILE);
            psmt.setInt(1, dto.getProdid());
            psmt.setString(2, dto.getoName());
            psmt.setString(3, dto.getsName());
            psmt.executeUpdate();
            closeAll();
        } catch (Exception e) {
        	logger.error(e.getMessage());
        } 
    }
    public FileDto selectFile(String fno) {
    	return null;
    }
    
    public List<FileDto> selectFiles(){
    	return null;
    }
    public void updateFile(FileDto dto) {
		
	}
    
    public void deleteFile(int fno) {
		
	}
}
