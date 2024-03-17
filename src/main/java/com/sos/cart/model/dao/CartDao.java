package com.sos.cart.model.dao;

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

import com.sos.cart.model.vo.Cart;

public class CartDao {

	private Properties prop = new Properties();
	
	public CartDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(CartDao.class.getResource("/db/mappers/cart-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertCart(Connection conn, Cart c) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCart");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getUserNo());
			pstmt.setInt(2, c.getProductNo());
			pstmt.setInt(3, c.getCartAmount());
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
		
	public int countCart(Connection conn, Cart c) {
		
		int count = 0;
		ResultSet rset= null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countCart");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, c.getUserNo());
			pstmt.setInt(2, c.getProductNo());
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				count=rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
		
		
	}
	
	public List<Cart> selectCart(Connection conn, int userNo) {
		
		List<Cart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCart");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cart(rset.getInt("user_no"),
								  rset.getInt("product_no"),
								  rset.getInt("cart_amount"),
								  rset.getString("product_name"),
								  rset.getInt("price"),
								  rset.getInt("discount_price"),
								  rset.getString("path"),
								  rset.getString("category_name")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public int pageCount(Connection conn, int userNo) {
		
		int count = 0;
		ResultSet rset= null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("pageCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				count=rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
		
		
	}
	
	public int deleteCart(Connection conn, int userNo, int productNo) {
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCart");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
