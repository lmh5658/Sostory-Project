package com.sos.recipe.model.sevice;


import com.sos.common.model.vo.PageInfo;
import com.sos.recipe.model.dao.RecipeDao;
import com.sos.recipe.model.vo.Recipe;

import static com.sos.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;;

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

	public List<Recipe> selectCategoryRecipe(String categoryName) {
		Connection conn = getConnection();
		List<Recipe> categorylist= rDao.selectRecipeList(conn, categoryName);
		close(conn);
		return categorylist;
	}


}
