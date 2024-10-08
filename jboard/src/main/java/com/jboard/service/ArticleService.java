package com.jboard.service;

import java.util.List;

import com.jboard.dao.ArticleDao;
import com.jboard.dao.TermsDAO;
import com.jboard.dto.ArticleDto;
import com.jboard.dto.PageGroupDto;
import com.jboard.dto.TermsDTO;

public class ArticleService {
	// 열거타입으로 싱글톤 생성
	private static ArticleService instance = new ArticleService();
	public static ArticleService getInstance() {
		return instance;
	}
	private ArticleService() {}
	
	private ArticleDao dao = ArticleDao.getInstance();
	
	public int getLastPageNum(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = total / 10;
		}else {
			lastPageNum = total / 10 +1;
		}
		return lastPageNum;
	}
	
	//페이지 시작번호 (limit용)
	public int getStartNum(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	//현재 페이지번호 구하기
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	//현재 페이지 그룹 구하기
	public PageGroupDto getCurrentPageGroup(int currentPage) {
		
		int currentPageGroup = (int) Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPageGroup -1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10; 
		
		return new PageGroupDto(pageGroupStart, pageGroupEnd, currentPageGroup);
	}
	
	public int insertArticle(ArticleDto dto) {
		return dao.insertArticle(dto);
	}
	public int selectCountTotal() {
		return dao.selectCountTotal();
	}
	public ArticleDto selectArticle(String no) {
		return dao.selectArticle(no);
	}
	public List<ArticleDto> selectArticles(int start) {
		return dao.selectArticles(start);
	}
	public void updateArticle(ArticleDto dto) {
		dao.updateArticle(dto);
	}
	public void deleteArticle() {
		dao.deleteArticle();
	}
}
