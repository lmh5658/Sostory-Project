package com.sos.mainPage.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.sos.member.model.vo.Member;
import com.sos.recipe.model.sevice.RecipeService;
import com.sos.recipe.model.vo.Recipe;

/**
 * Servlet implementation class AjaxMainPageRecipeController
 */
@WebServlet("/recipe.mp")
public class AjaxMainPageRecipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMainPageRecipeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* 서블릿 역할 : 메인페이지 노출용 Recipe 리스트 조회
		 * 
		 * case 01) 미로그인 사용자 == loginUser == null
		 *          >> 조회결과 : 메인페이지용 레시피목록
		 * 
		 * case 02) 로그인한 사용자 == loginUser != null
		 *          >> 조회결과 1 : 메인페이지용 레시피목록
		 *          >> 조회결과 2 : 사용자가 찜한 레시피목록  (찜 표시)
		 *          >> 전달정보 3 : 최대페이지 (maxPage)
		 * 
		 */
		
		// 레시피 리스트용 페이징바
		int totalRecipe = new MainPageService().totalRecipe();
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int recipeLimit = 3;	// 3개단위로 레시피노출
		int pageLimit = 10;
		int maxPage = (int)Math.ceil((double)totalRecipe/recipeLimit);
		int startPage = ((currentPage - 1) / recipeLimit) + 1;
		int endPage = startPage + (pageLimit - 1);
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(totalRecipe, currentPage, pageLimit, recipeLimit, maxPage, startPage, endPage);
		
		// 노출할 레시피리스트 조회요청
		List<Recipe> recipeList = new MainPageService().selectRecipeList(pi);

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
				jRecipe.put("productNo", r.getProductNo());
				jRecipe.put("productName", r.getProductName());
				jRecipe.put("price", r.getPrice());
				jRecipe.put("discountPrice", r.getDiscountPrice());
				jRecipe.put("productUrl", r.getPath());
				
				jRecipeList.add(jRecipe);
			}
		}
		
		
		// 로그인한 사용자일 경우 필요한 정보(찜한 레시피목록)
		Member user = (Member)request.getSession().getAttribute("loginUser");
		
		List<Integer> likedList = new ArrayList<>();	// 로그인한 사용자가 찜한 레시피번호 리스트가 담길 변수객체
		
		if(user != null) {
			likedList = new RecipeService().selectRecipeLikeList(user.getUserNo());
		}
		
		JSONArray jLikedRecipes = new JSONArray();		// 찜한 레시피번호 리스트를 담을 JSONArray 배열객체
		
		if(!likedList.isEmpty()) {
			for(Integer rNo : likedList) {
				jLikedRecipes.add(rNo);
			}
		}
		
		// 전송결과를 담을 JSONArray
		JSONArray jResult = new JSONArray();
		jResult.add(jRecipeList);
		jResult.add(pi.getMaxPage());		// 메인페이지 레시피목록 주기적 변경을 위해 필요함
		jResult.add(jLikedRecipes);
		
		// 결과전송
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jResult);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
