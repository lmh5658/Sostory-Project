package com.sos.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sos.cart.model.service.CartService;
import com.sos.cart.model.vo.Cart;

/**
 * Servlet implementation class CartSelectController
 */
@WebServlet("/count.ca")
public class CartCountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartCountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Cart c = new Cart();
		c.setProductNo(productNo);
		c.setUserNo(userNo);
		
		int count =new CartService().countCart(c);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(count, response.getWriter());
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
