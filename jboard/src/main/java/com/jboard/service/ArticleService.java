package com.jboard.service;

import java.util.List;

import com.jboard.dao.ArticleDao;
import com.jboard.dao.TermsDAO;
import com.jboard.dto.ArticleDto;
import com.jboard.dto.TermsDTO;

public class ArticleService {
	// 열거타입으로 싱글톤 생성
	private static ArticleService instance = new ArticleService();
	public static ArticleService getInstance() {
		return instance;
	}
	private ArticleService() {}
	
	
	
	private ArticleDao dao = ArticleDao.getInstance();
	
	public int insertArticle(ArticleDto dto) {
		return dao.insertArticle(dto);
	}
	public ArticleDto selectArticle() {
		return dao.selectArticle();
	}
	public List<ArticleDto> selectArticles() {		
		return dao.selectArticles();
	}
	public void updateArticle(ArticleDto dto) {
		dao.updateArticle(dto);
	}
	public void deleteArticle() {
		dao.deleteArticle();
	}
}
