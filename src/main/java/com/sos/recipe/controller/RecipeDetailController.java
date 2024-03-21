package com.sos.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.recipe.model.sevice.RecipeService;
import com.sos.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeDetailController
 */
@WebServlet("/detail.re")
public class RecipeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.레시피 글번호 요청 -> jsp
		//2.해당 레시피 조회 썸네일, 분류, 이름, 설명, 태그?,재료 정보(조인),스텝(조인) -> 쿼리 
		//3.정보(조인),스텝(조인) 첨부파일 포함 -> Attachment
		
		int recipeNo = Integer.parseInt(request.getParameter("no"));
		
		Recipe detailRecipe = new RecipeService().selectDetailRecipe(recipeNo); //상세에 들어갈 것들
		List<Recipe> ingredient = new RecipeService().selectIngridient(recipeNo);//재료 
		List<Recipe> step = new RecipeService().selectStep(recipeNo);//step
        //Attachment at = new RecipeService().selectAttachment(reciprNo);
		System.out.println(step);
		
		request.setAttribute("step", step);//step
		request.setAttribute("ingredient", ingredient); //재료 -= 카테고리도 int일 때 넘기는 법 물어보기 ->jsp에서 안돼
		request.setAttribute("detailRecipe", detailRecipe);
		//request.setAttribute("at", at);
		
		request.getRequestDispatcher("/views/recipe/recipeDetail.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
