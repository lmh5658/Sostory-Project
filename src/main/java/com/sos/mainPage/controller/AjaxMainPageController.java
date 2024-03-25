package com.sos.mainPage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sos.common.model.vo.PageInfo;
import com.sos.mainPage.model.service.MainPageService;
import com.sos.product.model.vo.Product;
import com.sos.recipe.model.vo.Recipe;

/**
 * Servlet implementation class MainPageController
 */
@WebServlet("/main.pg")
public class AjaxMainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 서블릿 역할 : 메인페이지 노출용 Product 및 Recipe 리스트 조회
		
		// ========================================== 상품조회 =================================================
		
		/* 조회할 상품리스트 카테고리
		 * 
		 * category "all" == 전체상품
		 * 
		 * category "best" == 랭킹상품
		 * 
		 * category "new" == 신상품
		 * 
		 */
		String category = request.getParameter("category");
		
		// 노출할 상품리스트 조회요청
		List<Product> productList = new MainPageService().selectProductList(category);
		
		// ========================================== 레시피조회 =================================================
		
		// 레시피 리스트용 페이징바
		int totalRecipe = 6;	// 좋아요순 상위 6개 레시피
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int recipeLimit = 3;	// 3개단위로 레시피노출
		int pageLimit = 1;		// 1페이지씩
		int maxPage = (int)Math.ceil((double)totalRecipe/recipeLimit);
		int startPage = ((currentPage - 1) / recipeLimit) + 1;
		int endPage = startPage + (pageLimit - 1);
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(totalRecipe, currentPage, pageLimit, recipeLimit, maxPage, startPage, endPage);
		
		// 노출할 레시피리스트 조회요청
		List<Recipe> recipeList = new MainPageService().selectRecipeList(pi);
		
		// ========================================== 조회결과 ================================================= 
		
		// 상품리스트 JSON화
		JSONArray jProductList = new JSONArray();	// 상품리스트를 담을 JSON배열
		
		if(!productList.isEmpty()) {
			for(Product p : productList) {
				JSONObject jProduct = new JSONObject();
				
				jProduct.put("productNo", p.getProductNo());
				jProduct.put("categoryName", p.getCategoryName());
				jProduct.put("productName", p.getProductName());
				jProduct.put("price", p.getPrice());
				jProduct.put("discountPrice", p.getDiscountPrice());
				jProduct.put("productUrl", p.getPath());
				
				jProductList.add(jProduct);
			}
		}
		
		// 레시피리스트 JSON화
		JSONArray jRecipeList = new JSONArray();	// 레시피리스트를 담을 JSON배열
		
		if(!recipeList.isEmpty()) {
			for(Recipe r : recipeList) {
				JSONObject jRecipe = new JSONObject();
				
				jRecipe.put("recipeNo", r.getRecipeNo());
				jRecipe.put("recipeTitle", r.getRecipeTitle());
				jRecipe.put("recipeIntro", r.getRecipeIntro());
				jRecipe.put("recipeUrl", r.getThumbnailUrl());
				jRecipe.put("categoryName", r.getCategoryName());
				jRecipe.put("userId", r.getUserName());
				jRecipe.put("userUrl", r.getUserPath());
				jRecipe.put("totalLiked", r.getLikeCount());
				jRecipe.put("prdocutNo", r.getProductNo());
				jRecipe.put("productName", r.getProductName());
				jRecipe.put("price", r.getPrice());
				jRecipe.put("discountPrice", r.getDiscountPrice());
				jRecipe.put("productUrl", r.getPath());
				
				jRecipeList.add(jRecipe);
			}
		}
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
