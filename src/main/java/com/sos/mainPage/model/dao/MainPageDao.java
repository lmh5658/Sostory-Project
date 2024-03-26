package com.sos.mainPage.model.dao;

import static com.sos.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sos.common.model.vo.PageInfo;
import com.sos.product.model.vo.Product;
import com.sos.recipe.model.vo.Recipe;

public class MainPageDao {

	Properties prop = new Properties();
	
	public MainPageDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(MainPageDao.class.getResource("/db/mappers/mainPage-mapper.xml").getPath()));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 메인페이지 노출용 전체상품/랭킹별상품/신상품 리스트 조회시 실행될 메소드
	 * 
	 * @param conn
	 * @return : 조회된 5개 상품객체 리스트
	 */
	public List<Product> selectProductList(Connection conn, String category){
		
		List<Product> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		/* 검색 카테고리별 SQL구문
		 * 
		 * case 01) 전체 상품조회 (랜덤 5개) 
		 * 
		 * case 02) 랭킹별 상품조회 (별점순 5개)
		 * 
		 * case 03) 신상품조회 (최신등록순 5개)
		 * 
		 */
		if(category.equals("all")) {
			sql = prop.getProperty("selectProductList");
		}else if(category.equals("best")) {
			sql = prop.getProperty("selectHighRatedProducts");
		}else if(category.equals("new")) {
			sql = prop.getProperty("selectNewestProducts");
		}
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setProductNo(rset.getInt("product_no"));
				p.setCategoryName(rset.getString("category_name"));
				p.setProductName(rset.getString("product_name"));
				p.setPrice(rset.getInt("price"));
				p.setDiscountPrice(rset.getInt("discount_price"));
				p.setPath(rset.getString("path"));
				
				list.add(p);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}
	
	/**
	 * 유효한레시피 갯수조회시 실행될 메소드
	 * 
	 * @param conn
	 * @return : 조회된 유효한 레시피갯수
	 */
	public int totalRecipe(Connection conn) {
		
		int total = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("totalRecipe");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				total = rset.getInt("total");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return total;
		
	}
	
	/**
	 * 메인페이지 노출용 레시피 리스트 조회시 실행될 메소드
	 * 
	 * @param conn
	 * @return : 조회된 3개 레시피객체 리스트
	 */
	public List<Recipe> selectRecipeList(Connection conn, PageInfo pi){
		
		List<Recipe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHighestLikedRecipes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int endNo = pi.getCurrentPage() * pi.getBoardLimit();
			int startNo = endNo - (pi.getBoardLimit() - 1);
			
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Recipe r = new Recipe();
				
				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setRecipeIntro(rset.getString("recipe_intro"));
				r.setThumbnailUrl(rset.getString("thumbnail_url"));
				r.setCategoryName(rset.getString("category_name"));
				r.setUserName(rset.getString("user_id"));
				r.setUserPath(rset.getString("user_path"));
				r.setLikeCount(rset.getInt("total_liked"));
				r.setProductNo(rset.getInt("product_no"));
				r.setProductName(rset.getString("product_name"));
				r.setPrice(rset.getInt("price"));
				r.setDiscountPrice(rset.getInt("discount_price"));
				r.setPath(rset.getString("product_path"));
				
				list.add(r);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
}
