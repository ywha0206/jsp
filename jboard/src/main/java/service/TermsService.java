package service;

import java.util.List;

import dao.TermsDAO;
import dto.TermsDTO;

public class TermsService {
	// 열거타입으로 싱글톤 생성
		private static TermsService instance = new TermsService();
		public static TermsService getInstance() {
			return instance;
		}
		private TermsService() {}
		
		
		
		private TermsDAO dao = TermsDAO.getInstance();
		
		public void insertTerms(TermsDTO dto) {
			dao.insertTerms(dto);
		}
		public TermsDTO selectTerms() {
			return dao.selectTerms();
		}
		public List<TermsDTO> selectTermses() {		
			return dao.selectTermses();
		}
		public void updateTerms(TermsDTO dto) {
			dao.updateTerms(dto);
		}
		public void deleteTerms() {
			dao.deleteTerms();
		}
		
}
