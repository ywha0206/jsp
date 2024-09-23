package com.farm.controller.article;

import java.io.IOException;

import com.farm.dto.ArticleDto;
import com.farm.service.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/view.do")
public class ArticleViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String type = req.getParameter("type");
		String cate = req.getParameter("cate");
		// 데이터 조회
		ArticleDto articleDto = service.selectArticle(no);
		
		// 공유 참조
		req.setAttribute("articleDto", articleDto);
		req.setAttribute("cate", cate);
		// 포워드 (화면 출력)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/view.jsp?cate="+cate+"type="+type);
		dispatcher.forward(req, resp);
	}

	
}

