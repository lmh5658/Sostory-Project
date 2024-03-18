package com.sos.product.model.dao;

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

import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.ProductRecipe;
import com.sos.product.model.vo.ProductReview;
import com.sos.product.model.vo.Qna;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/mappers/product-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Product> selectProductList(Connection conn, PageInfo pi){
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);	
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_NO"),
									rset.getString("CATEGORY_NAME"),
									rset.getString("PRODUCT_NAME"),
									rset.getInt("price"),
									rset.getString("path")		
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;	
	}
	
	public int selectListCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
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
	
	public Product selectProduct(Connection conn, int productNo) {
		
		Product pro = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pro = new Product(rset.getInt("PRODUCT_NO"),
								  rset.getString("CATEGORY_NAME"),
								  rset.getString("PRODUCT_NAME"),
								  rset.getInt("PRICE"),
								  rset.getString("PATH")
						);
				pro.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return pro;
	}
	
	public List<Member> selectPaymentUser(Connection conn) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPaymentUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public int selectQnaCount(Connection conn, int productNo) {
		
		int countList = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				countList = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return countList;
	}
	
	
	public List<Qna> selectQnaList(Connection conn, int productNo, PageInfo pi){

		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;	
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setProductNo(rset.getString("PRODUCT_NAME"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setUserNo(rset.getString("USER_ID"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerType(rset.getString("ANSWER_STATUS"));
				q.setReply(rset.getString("REPLY"));
				q.setReplyDate(rset.getString("REPLY_DATE"));
				
				list.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<ProductRecipe> selectRecipeList(Connection conn, int productNo){
		
		List<ProductRecipe> rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecipeList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ProductRecipe pr = new ProductRecipe();
				pr.setRecipeNo(rset.getInt("RECIPE_NO"));
				pr.setUserNo(rset.getString("USER_ID"));
				pr.setProductNo(rset.getString("PRODUCT_NAME"));
				pr.setCategoryNo(rset.getString("CATEGORY_NAME"));
				pr.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				pr.setThumbnailUrl(rset.getString("THUMBNAIL_URL"));
				pr.setRecipeIntro(rset.getString("RECIPE_INTRO"));
				pr.setProductPrice(rset.getInt("PRICE"));
				pr.setProductPath(rset.getString("PATH"));
				rlist.add(pr);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}
	
	public int selectReviewCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	public List<ProductReview> selectReviewList(Connection conn, int productNo, PageInfo pi){
		
		
		List<ProductReview> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductReview pr = new ProductReview();
				pr.setProductNo(rset.getInt("PRODUCT_NO"));
				pr.setReviewContent(rset.getString("REVIEW_CONTENT"));
				pr.setRating(rset.getInt("RATING"));
				pr.setWriterNo(rset.getString("USER_ID"));
				pr.setPostDate(rset.getString("POST_DATE"));
				list.add(pr);
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
