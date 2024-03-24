package com.sos.newProduct.model.service;
import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.newProduct.model.dao.ProductNewDao;
import com.sos.newProduct.model.vo.ProductNew;
import com.sos.product.model.vo.Product;

public class ProductNewService {
	
	private ProductNewDao pDao = new ProductNewDao();

	public List<Product> selectNewProductList(PageInfo pi) {
		
		Connection conn = getConnection();
		List<Product> list = pDao.selectNewProductList(conn,pi);
		close(conn);
		return list;
		
		
	}

	public int selectNewProductListCount() {
		
		Connection conn = getConnection();
		int count = pDao.selectNewProductListCount(conn);
		close(conn);
		return count;
		
	}

	public List<Product> selectjlist() {
		
		Connection conn = getConnection();
		List<Product> list = pDao.selectjlist(conn);
		close(conn);
		return list;
		
		
		
		
	}

	public int insertLike(ProductNew p) {
		
		Connection conn = getConnection();
		int result = pDao.insertLike(conn,p);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
		
	}

	public int countLike(ProductNew p) {
		Connection conn = getConnection();
		int result = pDao.countLike(conn,p);
		close(conn);
		
		return result;
	}

	public int deleteLike(ProductNew p) {
		
		Connection conn = getConnection();
		int result = pDao.deleteLike(conn,p);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}

	public List<ProductNew> selectLike(int userNo) {
		
		Connection conn = getConnection();
		List<ProductNew> list = pDao.selectLike(conn,userNo);
		close(conn);
		return list;
		
		
	}
	

	
	
	
	
	
	
	
	
	
	

}
