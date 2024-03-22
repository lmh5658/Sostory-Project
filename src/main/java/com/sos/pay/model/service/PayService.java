package com.sos.pay.model.service;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sos.cart.model.vo.Order;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.vo.Address;
import com.sos.pay.model.dao.PayDao;
import com.sos.pay.model.vo.Pay;



public class PayService {
	
	
	private PayDao pDao = new PayDao();
	
	
	public Member selectOrderInfo(int userNo) {
		
		Connection conn = getConnection();
		Member m = pDao.selectOrderInfo(conn,userNo);
		close(conn);
		return m;
	
	}
	
	public List<Address> selectAddressInfo(int userNo) {
		
		Connection conn = getConnection();
		List<Address> list = pDao.selectAddressInfo(conn,userNo);
		close(conn);
		
		return list;
		
		
	}
	
	public Address selectAddressBasicInfo(int userNo) {
		
		Connection conn = getConnection();
		Address a = pDao.selectAddressBasicInfo(conn,userNo);
		close(conn);
		
		return a;
		
	}
	
	public int insertOrder(Order o, List<Pay> list) {
		
		Connection conn = getConnection();
		int result1 = pDao.insertOrderInfo(conn,o);

		int result2 = pDao.insertOrderProduct(conn,list);
		
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
		
		
	}
	
	public Order selectOrder(int userNo) {
		Connection conn = getConnection();
		Order o = pDao.selectOrder(conn,userNo);
		close(conn);
		
		return o;
	}
	
	public int deleteCart(int userNo, String[] productNo) {
		
		Connection conn = getConnection();
		int result = pDao.deleteCart(conn,userNo,productNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
		
	}
	
	public List<Pay> selectCartInfo(int userNo,String[] productNo) {
		
		Connection conn = getConnection();
		List<Pay> list = pDao.selectCartInfo(conn,userNo,productNo);
		close(conn);
		
		return list;
		
	}

	public int updateCount(String[] count ,int userNo, String[] hiddencartProductNo ) {
		
		Connection conn = getConnection();
		int result = pDao.updateCount(conn,count,userNo,hiddencartProductNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
