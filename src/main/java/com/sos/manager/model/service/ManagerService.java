package com.sos.manager.model.service;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sos.common.model.vo.Category;
import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model.dao.ManagerDao;
import com.sos.member.model.vo.Member;
import com.sos.product.model.vo.Product;

public class ManagerService {
	
	private ManagerDao mDao = new ManagerDao();

	public int selectCountList() {
		Connection conn = getConnection();
		int result = mDao.selectCountList(conn);
		close(conn);
		return result;
	}

	public List<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberList(conn, pi);
		close(conn);
		return list;
	}

	public int deleteMember(int[] userNo) {
		Connection conn = getConnection();
		int result = mDao.deleteMember(conn, userNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int selectCountSearchList(String keyword) {
		Connection conn = getConnection();
		int result = mDao.selectCountSearchList(conn, keyword);
		close(conn);
		return result;
	}
	
	public List<Member> selectMemberByKeyword(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberByKeyword(conn, keyword, pi);
		close(conn);
		return list;
	}

	public int selectCountProductList() {
		Connection conn = getConnection();
		int result = mDao.selectCountProductList(conn);
		close(conn);
		return result;
	}

	public List<Product> selectProductList(PageInfo pi) {
		Connection conn = getConnection();
		List<Product> list = mDao.selectProductList(conn, pi);
		close(conn);
		return list;
	}

	public int deleteProduct(int[] productNo) {
		Connection conn = getConnection();
		int result = mDao.deleteProduct(conn, productNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int selectCountSearchProductList(String keyword) {
		Connection conn = getConnection();
		int result = mDao.selectCountSearchProductList(conn, keyword);
		close(conn);
		return result;
	}

	public List<Product> selectProductByKeyword(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		List<Product> list = mDao.selectProductByKeyword(conn, pi, keyword);
		close(conn);
		return list;
	}

	public List<Category> selectCategory() {
		Connection conn = getConnection();
		List<Category> list = mDao.selectCategory(conn);
		close(conn);
		return list;
	}


}
