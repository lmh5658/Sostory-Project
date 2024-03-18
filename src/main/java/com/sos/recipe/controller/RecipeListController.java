package com.sos.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.common.model.vo.PageInfo;
import com.sos.recipe.model.sevice.RecipeService;
import com.sos.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeListController
 */
@WebServlet("/list.re")
public class RecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이징 처리
		int listCount;		// 현재 게시글 총 갯수
		int currentPage;	// 현재 페이지 
		int pageLimit;		// 페이징바에 보이는 페이지 총 수
		int boardLimit; 	// 한 페이지에 보여질 게시글 총 수 
		
		int maxPage; 		// 마지막페이지
		int startPage;		// currentPage가 포함된 페이징바의 시작 수
		int endPage;		//currentPage가 포함된 페이징바의 끝 수
	
		listCount = new RecipeService().selectListCount(); //총 게시글 갯수
		currentPage = Integer.parseInt(request.getParameter("page")); //현재 페이지
		pageLimit = 5; //페이징바 최대 수 
		boardLimit = 9; //한 페이지당 게시글 총 수
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); //마지막 페이지
		startPage = ((currentPage - 1) / pageLimit) * pageLimit  + 1;// 페이징바 시작 값
		
		endPage = startPage + pageLimit - 1; //마지막 페이지
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		System.out.println(pi);
		
		List<Recipe> list = new RecipeService().selectRecipeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/recipe/recipeList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
