package com.sos.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sos.member.model.vo.Member;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.ProductReview;

/**
 * Servlet implementation class ProductReviewinsert
 */
@WebServlet("/rinsert.pr")
public class AjaxReviewinsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewinsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// category(평점), content
		int point = Integer.parseInt(request.getParameter("category"));
		String content = request.getParameter("content");
		int userNo = (int)((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int productNo = Integer.parseInt(request.getParameter("proNo"));
		System.out.println(point);
		
		ProductReview pr = new ProductReview();
		pr.setProductNo(productNo);
		pr.setWriterNo(String.valueOf(userNo));
		pr.setRating(point);
		pr.setReviewContent(content);
		
		System.out.println(pr);
		
		int result = new ProductService().insertReview(pr);
		System.out.println(result);
		
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(result, response.getWriter());
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
