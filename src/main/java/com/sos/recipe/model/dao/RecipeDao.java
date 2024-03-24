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
import com.sos.recipe.model.vo.Step;
import com.sos.recipe.model.vo.Ingredient;
import com.sos.recipe.model.vo.OrderProduct;

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

	//recipeList 페이지 페이징 수
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

	//레시피 게시글 전체 조회
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
	
	//키워드 검색시 레시피 조회
	public List<Recipe> selectSearchList(PageInfo pi, Connection conn, String search) {
		List<Recipe> searchList = new ArrayList<>();	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("SelectSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				searchList.add(new Recipe( rset.getInt("RECIPE_NO"), 
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
		
		return searchList;
		
	}

	//카테고리 클릭시 게시글 총 수
	public int selectCategoryListCount(Connection conn, int categoryNo){
			int categoryListCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCategoryListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, categoryNo);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					categoryListCount = rset.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return categoryListCount;
			
		}
	

	//카테고리 클릭시 레시피 목록조회
	public List<Recipe> selectCategoryList(Connection conn, PageInfo pi, int categoryNo) {
			List<Recipe> categoryList = new ArrayList<>();	
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCategoryList");
			try {
				pstmt = conn.prepareStatement(sql);

				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				pstmt.setInt(1, categoryNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					categoryList.add(new Recipe( rset.getInt("RECIPE_NO"), 
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
			
			return categoryList;
			
		}
	
	
	//레시피 상세 조회
	public Recipe selectDetailRecipe(Connection conn, int recipeNo) { //단일레시피 
		Recipe detailRecipe = null;	
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				detailRecipe  =  new Recipe( rset.getInt("RECIPE_NO"), 
											rset.getInt("USER_NO"),
											rset.getString("CATEGORY_NAME"), 
											rset.getString("RECIPE_TITLE"),
											rset.getString("THUMBNAIL_URL"),
											rset.getString("RECIPE_INTRO"),
											rset.getString("DIFFICULTY"),
											rset.getInt("SERVING"),
											rset.getInt("COOKING_TIME"),
											rset.getString("USER_NAME"),
											rset.getString("USER_PATH"),
											rset.getInt("LIKE_COUNT"),
											rset.getString("PRODUCT_NAME"),
											rset.getInt("PRICE"),
											rset.getInt("DISCOUNT_PRICE"),
											rset.getString("PATH")
								  );
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return detailRecipe;
	}
	
	//레시피 재료 
	public List<Recipe> selectIngridient(Connection conn, int recipeNo) {
		List<Recipe> ingredients = new ArrayList<>();	
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectIngridient");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ingredients.add(new Recipe( rset.getInt("RECIPE_NO"), 
									rset.getString("INGREDIENT_NAME"),
									rset.getInt("INGREDIENT_AMOUNT"),
									rset.getString("INGREDIENT_UNIT"),
									rset.getInt("INGREDIENT_COUNT")
								  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ingredients;
		
	}
		
		
		
	//레시피 상세 step 목록들
	public List<Recipe> selectStep(Connection conn, int recipeNo) {
		List<Recipe> step = new ArrayList<>() ;	
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStep");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				step.add(new Recipe( rset.getInt("RECIPE_NO"),
									 rset.getInt("STEP_NO"), 
									 rset.getInt("STEP_COUNT"), 
									 rset.getString("STEP_CONTENT"),
									 rset.getString("STEP_ATTACHMENT_URL")
								  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return step;
		
	}
	
	//등록페이지 - 구매확정 상품 
	public List<OrderProduct> selectOrderProduct(Connection conn, int userNo) {
		List<OrderProduct> orderProduct = new ArrayList<>() ;	
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				orderProduct.add(new OrderProduct( rset.getString("PRODUCT_NAME"),
												   rset.getInt("PRODUCT_NO"),
												   rset.getInt("CATEGORY_NO")

								  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return orderProduct;
		
	}


	
	//등록 - 레시피 정보
	public int insertRecipe(Connection conn, Recipe recipe) {
		int recipeResult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, recipe.getCategoryNo());
			pstmt.setInt(2, recipe.getUserNo());
			pstmt.setInt(3, recipe.getProductNo());
			pstmt.setString(4, recipe.getRecipeTitle());
			pstmt.setString(5, recipe.getThumbnailUrl());
			pstmt.setString(6, recipe.getRecipeIntro());
			pstmt.setString(7, recipe.getDifficulty());
			pstmt.setInt(8, recipe.getServing());
			pstmt.setInt(9, recipe.getCookingTime());

			recipeResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return recipeResult;
	}
	
	
	//등록 - 재료 정보
	public int insertIngredient(Connection conn, List<Ingredient> ingredient) {
		int ingredientResult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertIngredientList");
		
		try {
			for(Ingredient in : ingredient) {
				String amount = in.getAmount() + in.getUnit();

				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, in.getIngredientName());
				pstmt.setString(2, in.getAmount());
				pstmt.setString(3, in.getUnit());

				ingredientResult = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return ingredientResult;
	}
	
	//등록 - 스텝 정보
	public int insertStep(Connection conn, List<Step> step) {
		int stepResult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStepList");
		
		try {
			for(Step st : step) {

				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, st.getStepContent());
				pstmt.setString(2, st.getStepAttachUrl()); //어마운트와 유닛은 붙여서 하나 값으로 만들어 넣기
				stepResult = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return stepResult;
	}
	
	
	//수정페이지 - 작성했던 글의 타이틀
	public List<OrderProduct> selectUpdateOrderProduct(Connection conn, int userNo) {
		List<OrderProduct> writeRecipetitle = new ArrayList<>() ;	
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUpdateOrderProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				writeRecipetitle.add(new OrderProduct( rset.getInt("PRODUCT_NO"),
												   rset.getString("RECIPE_TITLE"),
												   rset.getInt("CATEGORY_NO")

								  ));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return writeRecipetitle;
		
	}
	
}
	

		


