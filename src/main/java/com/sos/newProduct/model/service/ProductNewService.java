package com.sos.newProduct.model.service;
import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.newProduct.model.dao.ProductNewDao;
import com.sos.newProduct.model.vo.ProductNew;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.ProductQnaReply;
import com.sos.product.model.vo.Qna;

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

	public int deleteQna(int answerNo) {
		Connection conn = getConnection();
		int result = pDao.deleteQna(conn,answerNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public List<Qna> selectCategoryList(String category, PageInfo pi) {
		
		Connection conn = getConnection();
		List<Qna> list = new ArrayList<>();
		if(category.equals("jang")) {
			list = pDao.selectCategoryJang(conn,pi);
		}else if(category.equals("dress")) {
			list = pDao.selectCategoryDress(conn,pi);
		}else if(category.equals("etc")){
			list = pDao.selectCategoryEtc(conn,pi);
		}else if(category.equals("all")) {
			list = pDao.selectCategoryAll(conn,pi);

		}
		
		close(conn);
		return list;
		
	}

	public int countCategoryJang() {
		
		Connection conn = getConnection();
		int result = pDao.countCategoryJang(conn);
		close(conn);
		
		return result;
		
	}

	public int countCategoryDress() {
		Connection conn = getConnection();
		int result = pDao.countCategoryDress(conn);
		close(conn);
		
		return result;
	}

	public int countCategoryEtc() {
		
		Connection conn = getConnection();
		int result = pDao.countCategoryEtc(conn);
		close(conn);
		
		return result;
	}

	public int countCategoryAll() {
		Connection conn = getConnection();
		int result = pDao.countCategoryAll(conn);
		close(conn);
		
		return result;
	}

	public List<Qna> selectProcList(String select, PageInfo pi) {
		Connection conn = getConnection();
		List<Qna> list = new ArrayList<>();
		if(select.equals("all")) {
			list = pDao.managerQnalist(conn, pi);			
		}else if(select.equals("processed")) {
			list = pDao.managerProQnalist(conn, pi);
		}else if(select.equals("unprocessed")) {
			list = pDao.managerUnproQnalist(conn, pi);
		}
		close(conn);
		return list;
	}
	

	public Qna selectReplyList(int no) {
		Connection conn = getConnection();
		Qna q = pDao.selectReplyList(conn,no);
		close(conn);
		return q;
		
	}

	public int updateReply(int no, String content) {
		
			Connection conn = getConnection();
			int result = pDao.updateReply(conn,no,content);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		
		
		
	}

	public List<Qna> selectSearchList(String search, PageInfo pi) {
		
		Connection conn = getConnection();
		List<Qna> list = pDao.selectSearchList(conn,search,pi);
		close(conn);
		return list;
		
	}

	public int countSearch(String search) {
		
		Connection conn = getConnection();
		int result = pDao.countSearch(conn,search);
		close(conn);
		
		return result;
		
	}
	
	
	
	
	
	
	

}
