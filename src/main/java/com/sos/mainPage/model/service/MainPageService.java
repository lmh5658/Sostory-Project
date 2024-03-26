package com.sos.mainPage.model.service;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.mainPage.model.dao.MainPageDao;
import com.sos.product.model.vo.Product;
import com.sos.recipe.model.vo.Recipe;

public class MainPageService {

	private MainPageDao mpDao = new MainPageDao();
	
	/**
	 * 메인페이지 노출용 전체상품/랭킹별상품/신상품 리스트 조회시 실행될 메소드
	 * 
	 * @return : 조회된 5개 상품객체 리스트
	 */
	public List<Product> selectProductList(String category){
		
		Connection conn = getConnection();
		
		List<Product> list = mpDao.selectProductList(conn, category);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 유효한레시피 갯수조회시 실행될 메소드
	 * 
	 * @return : 조회된 유효한 레시피갯수
	 */
	public int totalRecipe() {
		
		Connection conn = getConnection();
		
		int total = mpDao.totalRecipe(conn);
		
		close(conn);
		
		return total;
		
	}
	
	/**
	 * 메인페이지 노출용 레시피 리스트 조회시 실행될 메소드
	 * 
	 * @return : 조회된 3개 레시피객체 리스트
	 */
	public List<Recipe> selectRecipeList(PageInfo pi){
		
		Connection conn = getConnection();
		
		List<Recipe> list = mpDao.selectRecipeList(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	
}
