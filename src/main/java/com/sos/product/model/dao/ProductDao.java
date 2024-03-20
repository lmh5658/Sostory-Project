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
import com.sos.product.model.vo.AttachmentProduct;
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
									rset.getInt("DISCOUNT_PRICE"),
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
								  rset.getInt("DISCOUNT_PRICE"),
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
				pr.setLikeCount(rset.getInt("COUNT"));
				pr.setProductPath(rset.getString("PATH"));
				pr.setUserPath(rset.getString("USER_PATH"));
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
	
	public int selectReviewCount(Connection conn, int productNo) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
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
	
	public int insertReview(Connection conn, ProductReview pr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pr.getProductNo());
			pstmt.setString(2, pr.getWriterNo());
			pstmt.setInt(3, pr.getRating());
			pstmt.setString(4, pr.getReviewContent());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;	
	}
	
	public int searchCountList(Connection conn, String search) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchCountList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rset = pstmt.executeQuery();
			if(rset.next()){
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
	
	public List<Product> selectSearchList(Connection conn, String search, PageInfo pi){
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
	
	public int insertQna(Connection conn, String title, String content, int userNo, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQna");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertQnaFiles(Connection conn, AttachmentProduct ap, int productNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQnaFiles");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ap.getFileName());
			pstmt.setString(2, ap.getFileChangeName());
			pstmt.setString(3, ap.getFileRoute());
			pstmt.setInt(4, productNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;		
	}
	
	public int selectJangListCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectJangListCount");
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
	
	public List<Product> selectProductJang(Connection conn, PageInfo pi){
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductJang");
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	public int countListJang(Connection conn, String search) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countListJang");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
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
	
	public List<Product> searchProductJangList(Connection conn, PageInfo pi, String search){
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchProductJangList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product pr = new Product();
				pr.setProductNo(rset.getInt("PRODUCT_NO"));
				pr.setCategoryNo(rset.getString("CATEGORY_NAME"));
				pr.setProductName(rset.getString("PRODUCT_NAME"));
				pr.setPrice(rset.getInt("PRICE"));
				pr.setPrice(rset.getInt("DISCOUNT_PRICE"));
				pr.setPath(rset.getString("PATH"));
				
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
	
	public int countListDressing(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countListDressing");
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
	
	public List<Product> selectDressingList(Connection conn, PageInfo pi){
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDressingList");
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	public int countSearchList(Connection conn, String search) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countSearchList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
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
	
	public List<Product> searchProductDressingList(Connection conn, PageInfo pi, String search){
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchProductDressingList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			int starRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = starRow + pi.getBoardLimit() - 1;
			pstmt.setInt(2, starRow);
			pstmt.setInt(3, endRow);
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
	
	public int countListEtc(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countListEtc");
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
	
	public List<Product> selectEtcProductList(Connection conn, PageInfo pi){
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEtcProductList");
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	public int countEtcProduct(Connection conn, String search) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countEtcProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public List<Product> searchProductEtcList(Connection conn, String search, PageInfo pi){
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchProductEtcList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1; 
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
		System.out.println(list);
		return list;
	}
	
	public int countLikeList(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countLikeList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
		
	}
	
	
	
	

}
