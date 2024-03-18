package com.sos.recipe.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.sos.common.model.vo.PageInfo;
import com.sos.recipe.model.vo.Recipe;
import static com.sos.common.template.JDBCTemplate.*;

public class RecipeDao {
	
	//1.sql문 담을 properties객체 생성
	private Properties prop = new Properties();
	
	//2.RecipeDao 객체 생성
	public RecipeDao() {
		
		try {
			//3.prop.loadFromXML로 sql문 읽어들이기. RecipeDao 안의 class (classes 폴더) 에서 해당 파일을 찾아주는 getResorce와 getPath로 물리적 경로를 찾아 반환함. 
			prop.loadFromXML(new FileInputStream(RecipeDao.class.getResource("/db/mappers/recipe-mapper.xml").getPath()));
			
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//recipeList 페이지 페이징
	public int selectListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}

	public List<Recipe> selectRecipeList(Connection conn, PageInfo pi) {
		List<Recipe> list = new ArrayList<>();	
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recipe( rset.getInt("RECIPE_NO"), 
									rset.getString("CATEGORY_NAME"), 
									rset.getString("RECIPE_TITLE"),
									rset.getString("THUMBNAIL_URL"),
									rset.getString("RECIPE_INTRO"),
									rset.getString("USER_NAME"),
									rset.getString("USER_PATH"),
									rset.getInt("LIKE_COUNT"),
									rset.getString("PRODUCT_NAME"),
									rset.getInt("PRICE"),
									rset.getInt("DISCOUNT_PRICE"),
									rset.getString("PATH")
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
	
	//카테고리 레시피게시글 필터링
	public List<Recipe> selectRecipeList(Connection conn, String categoryName) {
	    List<Recipe> categorylist = new ArrayList<>();
	    
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectCategoryRecipe");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, categoryName);
	        rset = pstmt.executeQuery();
	        
	        while(rset.next()) {
	        	categorylist.add(new Recipe( rset.getInt("RECIPE_NO"), 
	                                rset.getString("CATEGORY_NAME"), 
	                                rset.getString("RECIPE_TITLE"),
	                                rset.getString("THUMBNAIL_URL"),
	                                rset.getString("RECIPE_INTRO"),
	                                rset.getString("USER_NAME"),
	                                rset.getString("USER_PATH"),
	                                rset.getInt("LIKE_COUNT"),
	                                rset.getString("PRODUCT_NAME"),
	                                rset.getInt("PRICE"),
	                                rset.getInt("DISCOUNT_PRICE"),
	                                rset.getString("PATH")
	                              ));
	        }
	        
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    
	    return categorylist;
	}

}

