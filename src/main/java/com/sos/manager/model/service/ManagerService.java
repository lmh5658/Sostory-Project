package com.sos.manager.model.service;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sos.cart.model.vo.Order;
import com.sos.common.model.vo.Category;
import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model.dao.ManagerDao;
import com.sos.member.model.vo.Member;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.Qna;

public class ManagerService {

	private ManagerDao mDao = new ManagerDao();

	// 천체 회원목록 총 회원수
	public int selectCountList() {
		Connection conn = getConnection();
		int result = mDao.selectCountList(conn);
		close(conn);
		return result;
	}

	// 회원목록 List
	public List<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberList(conn, pi);
		close(conn);
		return list;
	}

	// 선택된 회원 비활성화
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

	// 회원검색 결과 회원수
	public int selectCountSearchList(String keyword) {
		Connection conn = getConnection();
		int result = mDao.selectCountSearchList(conn, keyword);
		close(conn);
		return result;
	}

	// 회원검색 결과 회원목록 List
	public List<Member> selectMemberByKeyword(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberByKeyword(conn, keyword, pi);
		close(conn);
		return list;
	}

	// 전체 상품목록 수
	public int selectCountProductList() {
		Connection conn = getConnection();
		int result = mDao.selectCountProductList(conn);
		close(conn);
		return result;
	}

	// 전체 상품목록 List
	public List<Product> selectProductList(PageInfo pi) {
		Connection conn = getConnection();
		List<Product> list = mDao.selectProductList(conn, pi);
		close(conn);
		return list;
	}

	// 선택된 상품 비활성화
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

	// 검색 상품 수
	public int selectCountSearchProductList(String keyword) {
		Connection conn = getConnection();
		int result = mDao.selectCountSearchProductList(conn, keyword);
		close(conn);
		return result;
	}

	// 검색 상품 List
	public List<Product> selectProductByKeyword(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		List<Product> list = mDao.selectProductByKeyword(conn, pi, keyword);
		close(conn);
		return list;
	}

	// 상품 카테고리 List 조회
	public List<Category> selectCategory() {
		Connection conn = getConnection();
		List<Category> list = mDao.selectCategory(conn);
		close(conn);
		return list;
	}

	// 상품등록(추가)
	public int insertProduct(Product p) {
		Connection conn = getConnection();
		int result = mDao.insertProduct(conn, p);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 상품 번호로 상품 select
	public Product selectProduct(int productNo) {
		Connection conn = getConnection();
		Product p = mDao.selectProduct(conn, productNo);
		close(conn);
		return p;
	}

	// 상품 정보 update
	public int updateProduct(Product p) {
		Connection conn = getConnection();
		int result = mDao.updateProduct(conn, p);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Order> selectOrderList(PageInfo pi) {
		Connection conn = getConnection();
		List<Order> list = mDao.selectOrderList(conn, pi);
		close(conn);
		return list;
	}

	//메인 -상품문의 조회
	public List<Qna> selectProductQnaList(){
		Connection conn = getConnection();
		List<Qna> list = mDao.selectProductQnaList(conn);
		close(conn);
		return list;
	}

	public int selectCountOrderList() {
		Connection conn = getConnection();
		int result = mDao.selectCountOrderList(conn);
		close(conn);
		return result;
	}

	public int selectCountOrderSearch(String keyword) {
		Connection conn = getConnection();
		int result = mDao.selectCountOrderSearch(conn, keyword);
		close(conn);
		return result;
	}

	public List<Order> selectOrderSearchList(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		List<Order> list = mDao.selectOrderSearchList(conn, pi, keyword);
		close(conn);
		return list;
	}

	public int updateOrderStatus(Order o) {
		Connection conn = getConnection();
		int result = mDao.updateOrderStatus(conn, o);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	//메인 -1대1문의 조회
		public List<Qna> selectOneQnaList(){
			Connection conn = getConnection();
			List<Qna> list = mDao.selectOneQnaList(conn);
			close(conn);
			return list;
		}
	//메인 - 답변 미완료 문의 총 갯수
		public int selectQnaCount(){
			Connection conn = getConnection();
			int result = mDao.selectQnaCount(conn);
			close(conn);
			return result;
		}

	//메인 - 하루 접속자 수
		/*public int selectTodayCount() {
			Connection conn = getConnection();
			int result = mDao.selectTodayCount(conn);
			close(conn);
			return result;
		}*/


}
