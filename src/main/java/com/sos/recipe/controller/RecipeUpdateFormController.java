package com.sos.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sos.member.model.vo.Member;
import com.sos.recipe.model.sevice.RecipeService;
import com.sos.recipe.model.vo.OrderProduct;
import com.sos.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeUpdateFormController
 */
@WebServlet("/updateForm.re")
public class RecipeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recipeNo = Integer.parseInt(request.getParameter("no"));
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		List<OrderProduct> orderProduct = new RecipeService().selectOrderProduct(userNo);
		List<Recipe> ingredient = new RecipeService().selectIngridient(recipeNo);
		List<Recipe> step = new RecipeService().selectStep(recipeNo);
		Recipe recipe = new RecipeService().selectDetailRecipe(recipeNo);
		
		request.setAttribute("orderProduct", orderProduct);
		request.setAttribute("ingredient", ingredient);
		request.setAttribute("step", step);
		request.setAttribute("recipe", recipe);
		request.getRequestDispatcher("/views/recipe/recipeUpdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
