package com.farm.controller.article;

import java.io.IOException;
import java.util.List;

import com.farm.dto.PageGroupDto;
import com.farm.dto.ArticleDto;
import com.farm.service.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/list.do")
public class ArticleListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ArticleService service = ArticleService.INSTANCE;

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String type = req.getParameter("type");
			String pg = req.getParameter("pg");
			String cate = req.getParameter("cate");
			
			// 현재 페이지 번호 구하기
			int currentPage = service.getCurrentPage(pg);
			
			// 전체 게시물 갯수 구하기
			int total = service.selectCountTotal(Integer.parseInt(type));
			
			// 마지막 페이지 번호 구하기
			int lastPageNum = service.getLastPageNum(total);
			
			// 현재 페이지 그룹 구하기
			PageGroupDto pageGroup = service.getCurrentPageGroup(currentPage, lastPageNum);
			
			// Limit용 시작 번호 구하기
			int start = service.getStartNum(currentPage);
			
			// 페이지 시작 번호 구하기(목록에서 순서번호로 활용)
			int pageStartNum = service.getPageStartNum(total, currentPage);
			
			// 데이터 조회
			List<ArticleDto> articles = service.selectArticles(start,Integer.parseInt(type));
	
			// 공유 참조
			req.setAttribute("articles", articles);
			req.setAttribute("type", type);
			req.setAttribute("cate",cate);
			
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroup", pageGroup);
			req.setAttribute("pageStartNum", pageStartNum);
			req.setAttribute("currentPage", currentPage);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/list.jsp?cate="+cate+"$type="+type);
			dispatcher.forward(req, resp);

		}
	}
