package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.ArticleDto;
import com.jboard.dto.PageGroupDto;
import com.jboard.dto.TermsDTO;
import com.jboard.dto.UserDto;
import com.jboard.service.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 4818082532605926530L;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pg = req.getParameter("pg");
		
		// 현재 페이지 번호 구하기
		int currentPage = service.getCurrentPage(pg);
		
		//현재 페이지 그룹 구하기
		PageGroupDto pageGroup= service.getCurrentPageGroup(currentPage);		
		
		// 전체 게시물 갯수 구하기
		int total = service.selectCountTotal();
		
		// 마지막 페이지 번호 구하기
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 시작 번호 구하기
		int start = service.getStartNum(currentPage);
		
		// 데이터 조회
		List<ArticleDto> articles = service.selectArticles(start);
		
		//공유 참조
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroup", pageGroup);
	
		logger.debug(articles+": articles");
		logger.debug(req+": req");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/list.jsp");
		dispatcher.forward(req, resp);
		
	}
}
