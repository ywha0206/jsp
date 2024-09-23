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

@WebServlet("/article/write.do")
public class ArticleWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// private ArticleService service = ArticleService.getInstance();

	private ArticleService articleService = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String type = req.getParameter("type");
		String cate = req.getParameter("cate");
		
		req.setAttribute("type", type);
		req.setAttribute("cate", cate);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/write.jsp");
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String type = req.getParameter("type");
		String cate = req.getParameter("cate");
		String regip = req.getRemoteAddr();
		

		ArticleDto dto = new ArticleDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setType(type);
		dto.setCate(cate);
		dto.setRegip(regip);
		
		// 글 등록
		int result = articleService.insertArticle(dto);
		req.setAttribute("result",result);
		
		resp.sendRedirect("/farm/article/list.do?cate="+cate+"&type="+type);
	}
}


