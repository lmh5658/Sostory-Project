package com.sos.pay.model.dao;

import static com.sos.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sos.cart.model.dao.CartDao;
import com.sos.cart.model.vo.Order;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.vo.Address;
import com.sos.pay.model.vo.Pay;

public class PayDao {
	
	
private Properties prop = new Properties();
	
	public PayDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(CartDao.class.getResource("/db/mappers/pay-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public Member selectOrderInfo(Connection conn, int userNo) {
		
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderInfo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				m= new Member();
				m.setUserName(rset.getString("user_name"));
				m.setPhone(rset.getString("phone"));
				m.setEmail(rset.getString("email"));
			}
			

			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
		
	}
	
	public List<Address> selectAddressInfo(Connection conn, int userNo) {
		
		
		List<Address> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAddressInfo");
		
		try {
			// 기본주소, 상세주소
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Address(rset.getString("address_address")
								  	,rset.getString("address_detail")
								  	,rset.getString("address_local")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	
	public Address selectAddressBasicInfo(Connection conn, int userNo) {
		
		Address a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAddressBasicInfo");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()){
				a = new Address(rset.getString("address_address"),
						  		rset.getString("address_detail"),
						  		rset.getString("address_local"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}
	
	
	public int insertOrderInfo(Connection conn, Order o) {
		
		int result=0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrder");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, o.getUserNo());
			pstmt.setString(2, o.getName());
			pstmt.setString(3, o.getPhone());
			pstmt.setString(4, o.getEmail());
			pstmt.setString(5, o.getAddress());
			pstmt.setString(6, o.getAddressDetail());
			pstmt.setString(7, o.getRequestContent());
			pstmt.setInt(8, o.getPay());
			pstmt.setString(9, o.getAccountHolder());
			pstmt.setString(10, o.getBankName());
			pstmt.setString(11, o.getAccountNumber());
			
			result=pstmt.executeUpdate();
		
	
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int insertOrderProduct(Connection conn, List<Pay> list) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrderProduct");
		
		try {
			for(Pay p : list) {
				pstmt=conn.prepareStatement(sql);
				String countString = p.getCount();
	            if (countString != null) {
	                int count = Integer.parseInt(countString);
	                pstmt.setInt(1, count);
	            }
	            String productNoString = p.getProductNo();
	            if (productNoString != null) {
	                int productNo = Integer.parseInt(productNoString);
	                pstmt.setInt(2, productNo);
	            }
			
				result = pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Order selectOrder(Connection conn, int userNo) {
		
		Order o = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrder");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				o= new Order();
				o.setOrderNo(rset.getInt("order_no"));
				o.setPayDate(rset.getString("pay_date"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
		
	}
	
	public int deleteCart(Connection conn, int userNo, String[] productNo) {
	
		// String sql = "delete from cart where user_no = ?";      and product_no in (1, 2)
		// sql += "and product_no in ("
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCart");
		sql+="AND PRODUCT_NO IN (";

		for (int i = 0; i < productNo.length; i++) {
			sql+= "'"+productNo[i]+"'";
			if(i<productNo.length -1) {
				sql+=",";
			}
			
		}
		sql+=")";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
		
		
	}
	
	
	public List<Pay> selectCartInfo(Connection conn, int userNo, String[] productNo) {
		
		List<Pay> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCartInfo");
		sql+="AND PRODUCT_NO IN (";
		
		for (int i = 0; i < productNo.length; i++) {
			sql+= "'"+productNo[i]+"'";
			if(i<productNo.length -1) {
				sql+=",";
			}
			
		}
		sql+=")";
		
		try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				rset=pstmt.executeQuery();
				
	// 체크된 상품들의 상품번호(String[])로 DB에서 상품이름, 상품가격, 상품할인가격, 이미지경로, 수량 받아오기
				while(rset.next()) {
					Pay p = new Pay();
					p.setProductName(rset.getString("product_name"));
					p.setPrice(rset.getString("price"));
					p.setDiscountPrice(rset.getString("discount_price"));
					p.setPath(rset.getString("path"));
					p.setCount(rset.getString("cart_amount"));
					p.setPriceMinusDcprice(rset.getString("dcprice"));
					p.setProductNo(rset.getString("product_no"));
					list.add(p);
				}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		return list;
		
		
		
	}


	public int updateCount(Connection conn, String[] count, int userNo, String[] hiddencartProductNo) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCount");
		
		try {
			
			for(int i=0; i<count.length; i++) {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, count[i]);
				pstmt.setInt(2, userNo);
				pstmt.setString(3, hiddencartProductNo[i]);
				
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int updateProduct(Connection conn, String[] productNo, String[] count) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct");
		
		try {
			
			for(int i=0; i<count.length; i++) {
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, count[i]);
				pstmt.setString(2, productNo[i]);
				
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	

	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
