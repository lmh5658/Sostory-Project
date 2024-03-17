package com.sos.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.vo.Member;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.ProductRecipe;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/detail.pr")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productNo = Integer.parseInt(request.getParameter("no"));
		
		Product pro = new ProductService().selectProduct(productNo);
		List<Member> list = new ProductService().selectPaymentUser();
		List<ProductRecipe> rlist = new ProductService().selectRecipeList(productNo);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pro", pro);
		request.setAttribute("rlist", rlist);
		request.getRequestDispatcher("/views/product/productDetail.jsp").forward(request, response);			
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
