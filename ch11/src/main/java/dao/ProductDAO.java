package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import dto.ProductDTO;
import util.DBHelper;

public class ProductDAO extends DBHelper{
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	private ProductDAO() {}
	
	//로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	public void insertProduct(ProductDTO dto) {
		
		String sql = "insert into product values (?,?,?,?,?)";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getProdNo());
			psmt.setString(2, dto.getProdName());
			psmt.setInt(3, dto.getStock());
			psmt.setInt(4, dto.getPrice());
			psmt.setString(5, dto.getCompany());
			psmt.executeUpdate();
			closeAll();
			
		}catch (Exception e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		}
		
	}
	
	public ProductDTO selectProduct(int prodNo) {
		return null;
	}
	
	public List<ProductDTO> selectProducts() {
		
		List<ProductDTO> products = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `product`");
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdNo(rs.getInt(1));
				dto.setProdName(rs.getString(2));
				dto.setStock(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
				products.add(dto);
			}
			closeAll();
		}catch (Exception e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		}
		return products;
	}
	
	public void updateProduct(ProductDTO dto) {
		
	}
	
	public void deleteProduct(int prodNo) {
		
	}
}
