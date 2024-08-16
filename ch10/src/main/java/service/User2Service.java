package service;

import java.util.List;

import dao.User1DAO;
import dao.User2DAO;
import dto.User1DTO;
import dto.User2DTO;

public class User2Service {
	
	//싱글톤
	private static User2Service instance = new User2Service();
	public static User2Service getInstance() {
		return instance;
	}
	private User2Service() {}
	
	//dao 인스턴스
	private User2DAO dao = User2DAO.getInstance();
	
	//crud 메서드 호출
	public void insertUser2(User2DTO dto) {
		dao.insertUser2(dto);
	}
	
	public User2DTO selectUser2(String uid) {
		return dao.selectUser2(uid);
	}
	
	public List<User2DTO> selectUser2s() {
		return dao.selectUser2s();
	}
	
	public void updateUser2(User2DTO dto) {
		dao.updateUser2(dto);
	}
	
	public void deleteUser2(String uid) {
		dao.deleteUser2(uid);
	}
	
}
