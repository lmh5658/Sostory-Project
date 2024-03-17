package com.sos.product.model.service;

import java.sql.Connection;
import java.util.List;

import static com.sos.common.template.JDBCTemplate.*;
import com.sos.product.model.dao.ProductDao;
import com.sos.product.model.vo.Product;

public class ProductService {
	
	private ProductDao pDao = new ProductDao();
	
	public List<Product> selectProductList(){
		Connection conn = getConnection();
		
		List<Product> list = pDao.selectProductList(conn);
		
		close(conn);
		
		return list;	
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		int count = pDao.selectListCount(conn);
		close(conn);
		return count;
	}
	
	
	

}
