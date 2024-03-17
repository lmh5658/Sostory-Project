package com.sos.cart.model.service;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sos.cart.model.dao.CartDao;
import com.sos.cart.model.vo.Cart;
import com.sos.member.model.vo.Member;

public class CartService {

	 private CartDao cDao = new CartDao();
	 
	 public int insertCart(Cart c) {
		 
		Connection conn = getConnection();
		int result = cDao.insertCart(conn, c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		 return result;
	 }
	 
	 
	 public int countCart(Cart c) {
		 
		 Connection conn = getConnection();
		 int count = cDao.countCart(conn,c);
		 close(conn);
		 
		 return count;
		 
	 }
	 
	 public List<Cart> selectCart(int userNo) {
		 Connection conn = getConnection();
		 List<Cart> list = cDao.selectCart(conn,userNo);
		 close(conn);
		 
		 return list;
		 
	 }
	 
		public int pageCount(int userNo) {
				 
		 Connection conn = getConnection();
		 int count = cDao.pageCount(conn,userNo);
		 close(conn);
		 
		 return count;
				 
	 }
	 
		public int deleteCart(int userNo, int productNo) {
			
			Connection conn = getConnection();
			int result = cDao.deleteCart(conn,userNo,productNo);
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			return result;
			
		}
	 
	 
	 
	 
	 
	 
	 
	 
}
