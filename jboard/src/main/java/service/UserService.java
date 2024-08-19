package service;

import java.util.List;

import dao.TermsDAO;
import dao.UserDao;
import dto.UserDto;

public class UserService {
	
	public static UserService instance = new UserService();
	public static UserService getinstance() {
		return instance;
	}
	
	private UserService(){}	

	private UserDao dao = UserDao.getInstance();
	
	public void insertUser(UserDto dto) {
		dao.insertUser(dto);
	}
	public UserDto selectUser(String uid) {
		return dao.selectUser(uid);
	}
	public List<UserDto> selectUsers() {
		return dao.selectUsers();
	}
	public void updateUser(UserDto dto) {
		dao.updateUser(dto);
	}
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
}
