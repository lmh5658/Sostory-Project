package com.sos.newProduct.model.dao;

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
import com.sos.common.model.vo.PageInfo;
import com.sos.newProduct.model.vo.ProductNew;
import com.sos.product.model.dao.ProductDao;
import com.sos.product.model.vo.Product;

public class ProductNewDao {
	
	private Properties prop = new Properties();
	
	public ProductNewDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/mappers/productNew-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Product> selectNewProductList(Connection conn, PageInfo pi) {
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewProductList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
		
			
			
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductNo(rset.getInt("PRODUCT_NO"));
				pro.setCategoryNo(rset.getString("CATEGORY_NAME"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				pro.setPrice(rset.getInt("PRICE"));
				pro.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
				pro.setPath(rset.getString("PATH"));
				list.add(pro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		
		return list;
	}

	public int selectNewProductListCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewProductListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}

	public List<Product> selectjlist(Connection conn) {
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectjlist");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductNo(rset.getInt("PRODUCT_NO"));
				pro.setCategoryNo(rset.getString("CATEGORY_NAME"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));				
				pro.setPrice(rset.getInt("PRICE"));
				pro.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
				pro.setPath(rset.getString("PATH"));
				list.add(pro);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		return list;
		
		
	}

	public int insertLike(Connection conn, ProductNew p) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getType());
			pstmt.setInt(3, p.getProductNo());
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	public int countLike(Connection conn, ProductNew p) {
		int result=0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getType());
			pstmt.setInt(3, p.getProductNo());
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteLike(Connection conn, ProductNew p) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getType());
			pstmt.setInt(3, p.getProductNo());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	public List<ProductNew> selectLike(Connection conn, int userNo) {
		
			List<ProductNew> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectLike");
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				
				rset=pstmt.executeQuery();
				
				while(rset.next()) {
					ProductNew p = new ProductNew();
					p.setProductNo(rset.getInt("LIKE_REFNO"));
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

	
	
	
	
	
	
	
	
	
	
	

}
