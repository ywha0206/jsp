package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import com.jboard.dto.ArticleDto;
import com.jboard.dto.FileDto;
import com.jboard.dto.UserDto;
import com.jboard.service.ArticleService;
import com.jboard.service.FileService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ArticleService service = ArticleService.getInstance();
	private FileService fileService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/write.jsp");
			dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//데이터 수신
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();
		

		//파일 업로드
		List<FileDto> files = fileService.fileUpload(req);//DB랑 상관없이 파일을 경로에 저장하고, 저장한 값을 files list에 저장
		
		//dto생성
		ArticleDto articleDto = new ArticleDto(); //article 데이터 수신한 거를 dto에 셋팅
		articleDto.setTitle(title);
		articleDto.setContent(content);
		articleDto.setFile(files.size());
		articleDto.setWriter(writer);
		articleDto.setRegip(regip);
		
		//글등록
		int no = service.insertArticle(articleDto); // article DB에 정보 추가하고 반환된 글번호를 int 타입 no변수에 저장
		
		
		
		for(FileDto fileDto : files ) { //여러개의 파일을 전부 열어본다
			fileDto.setAno(no); //아까 반환된 글번호를 dto에 세팅
			fileService.insertFile(fileDto);// 지금까지 싸악 저장한 file dto 객체를 file DB에 정보 추가
		}
		
		resp.sendRedirect("/jboard/article/list.do");
	}
}
