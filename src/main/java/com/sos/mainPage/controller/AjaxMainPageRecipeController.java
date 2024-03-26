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
		
		// 서블릿 역할 : 메인페이지 노출용 Recipe 리스트 조회
		System.out.println("레시피");
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
				jRecipe.put("prdocutNo", r.getProductNo());
				jRecipe.put("productName", r.getProductName());
				jRecipe.put("price", r.getPrice());
				jRecipe.put("discountPrice", r.getDiscountPrice());
				jRecipe.put("productUrl", r.getPath());
				
				jRecipeList.add(jRecipe);
			}
		}
		
		// 결과전송
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jRecipeList);
		
		// 헤더로 전송할 데이터
		request.getSession().setAttribute("recipePageInfo", pi);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
