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

@WebServlet("/article/update.do")
public class ArticleUpdateController extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	private ArticleService articleService = ArticleService.INSTANCE;
	//private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String type = req.getParameter("type");
		String cate = req.getParameter("cate");
		String no = req.getParameter("no");

	
		articleService.selectArticle(no);
		
		ArticleDto articleDto = articleService.selectArticle(no);
		req.setAttribute("articleDto", articleDto);
		req.setAttribute("articleNO",no);
		req.setAttribute("cate",cate);
		req.setAttribute("type",type); 
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/update.jsp?cate="+cate+"&type="+type);
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ano = req.getParameter("no");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();
		String type = req.getParameter("type");
		String cate = req.getParameter("cate");

		ArticleDto dto = new ArticleDto();
		dto.setNo(Integer.parseInt(ano));
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setRegip(regip);
		
		articleService.updateArticle(dto);
		
		resp.sendRedirect("/farm/article/view.do?cate="+cate+"&type="+type+"&no="+ano);
	}
			
}
