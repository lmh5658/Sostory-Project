package com.sos.recipe.model.sevice;


import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.recipe.model.dao.RecipeDao;
import com.sos.recipe.model.vo.Ingredient;
import com.sos.recipe.model.vo.OrderProduct;
import com.sos.recipe.model.vo.Recipe;
import com.sos.recipe.model.vo.Step;;

public class RecipeService {
	
	//1.dao 객체 생성 
	private RecipeDao rDao = new RecipeDao();

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount= rDao.selectListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Recipe> selectRecipeList(PageInfo pi) {
		Connection conn = getConnection();
		List<Recipe> list= rDao.selectRecipeList(conn, pi);
		close(conn);
		return list;
	}

	public List<Recipe> selectCategoryList(PageInfo pi, int categoryNo) {
		Connection conn = getConnection();
		List<Recipe> categoryList= rDao.selectCategoryList(conn, pi, categoryNo);
		close(conn);
		return categoryList;
	}

	public List<Recipe> selectSearchList(PageInfo pi, String search) {
		Connection conn = getConnection();
		List<Recipe> searchList= rDao.selectSearchList(pi, conn, search);
		close(conn);
		return searchList;
	}

	public int selectCategoryListCount(int categoryNo) {
		Connection conn = getConnection();
		int categoryListCount= rDao.selectCategoryListCount(conn, categoryNo);
		close(conn);
		return categoryListCount;
	}

	//레시피상세 조회
	public Recipe selectDetailRecipe(int recipeNo) {
		Connection conn = getConnection();
		Recipe detailRecipe = rDao.selectDetailRecipe(conn, recipeNo);
		close(conn);
		return detailRecipe;
	
	}
	
	//레시피 재료
	public List<Recipe> selectIngridient(int recipeNo) {
		Connection conn = getConnection();
		List<Recipe> ingredient = rDao.selectIngridient(conn, recipeNo);
		close(conn);
		return ingredient;
		
	}

	public List<Recipe> selectStep(int recipeNo) {
		Connection conn = getConnection();
		List<Recipe> step= rDao.selectStep(conn, recipeNo);
		close(conn);
		return step;

	}
	
	//등록- 구매확정상품 조회
	public List<OrderProduct> selectOrderProduct(int userNo) {
		Connection conn = getConnection();
		List<OrderProduct> orderProduct= rDao.selectOrderProduct(conn, userNo);
		close(conn);
		return orderProduct;

	}

	//등록 -레시피 정보, 재료 정보, 스텝 정보
	public int insertRecipe(Recipe recipe, List<Ingredient> ingredient, List<Step> step) {
		Connection conn = getConnection();

		int recipeResult = rDao.insertRecipe(conn, recipe);
		int ingredientResult = rDao.insertIngredient(conn, ingredient);
		int stepResult = rDao.insertStep(conn, step);
	
		if(recipeResult > 0 && ingredientResult > 0 && stepResult > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return recipeResult * ingredientResult * stepResult;
	}

	//수정 - 작성했던 레시피 목록
	public List<OrderProduct> selectUpdateOrderProduct(int userNo) {
		Connection conn = getConnection();
		List<OrderProduct> writeRecipetitle= rDao.selectUpdateOrderProduct(conn, userNo);
		close(conn);
		return writeRecipetitle;

	}

	public int insertLikeProduct(int recipeNo, int userNo) {
		Connection conn = getConnection();
		int result = rDao.insertLikeProduct(conn, recipeNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;	
	}
	
	
	public int deleteLikeProduct(int recipeNo, int userNo) {
		Connection conn = getConnection();
		int result = rDao.deleteLikeProduct(conn, recipeNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;	
	}

	public int selectMemberLike(int recipeNo, Member loginUser) {
		Connection conn = getConnection();
		int result = rDao.selectMemberLike(conn, recipeNo, loginUser);
		close(conn);
		return result;
	}

	public void insertLike(int recipeNo, int userNo) {
		Connection conn = getConnection();
		int result = rDao.insertLike(conn, recipeNo, userNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
	}

	public void deleteLike(int recipeNo, int userNo) {
		Connection conn = getConnection();
		int result = rDao.deleteLike(conn, recipeNo, userNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
	}

	

	
	}


