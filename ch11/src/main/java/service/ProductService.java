package service;

import java.util.List;

import dao.CustomerDAO;
import dao.ProductDAO;
import dto.CustomerDTO;
import dto.ProductDTO;

public enum ProductService {
	
	// 열거타입으로 싱글톤 생성
	INSTANCE;
	
	private ProductDAO dao = ProductDAO.getInstance();
	
	public void insertProduct(ProductDTO dto) {
		dao.insertProduct(dto);
	}
	
	public ProductDTO selectProduct(int prodId) {
		return dao.selectProduct(prodId);
	}
	
	public List<ProductDTO> selectProducts() {
		return dao.selectProducts();
	}
	
	public void updateProduct(ProductDTO dto) {
		dao.updateProduct(dto);
	}
	
	public void deleteProduct(int prodNo) {
		dao.deleteProduct(prodNo);
	}
}