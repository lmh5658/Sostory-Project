package com.sos.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.recipe.model.sevice.RecipeService;
import com.sos.recipe.model.vo.OrderProduct;

/**
 * Servlet implementation class RecipeEnrollForm
 */
@WebServlet("/enroll.re")
public class RecipeEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("no"));
	
		List<OrderProduct> orderProduct = new RecipeService().selectOrderProduct(userNo);
		
		if(orderProduct == null || orderProduct.isEmpty()) {
			request.getSession().setAttribute("alertMsg", "배송 완료된 상품만 레시피 작성이 가능합니다.");
			response.sendRedirect(request.getContextPath() + "/list.re?page=1");
		}else {
			request.setAttribute("list", orderProduct);
			request.getRequestDispatcher("/views/recipe/recipeEnroll.jsp").forward(request, response);
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
