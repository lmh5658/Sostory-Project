package com.sos.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Product;

/**
 * Servlet implementation class ProductBestList
 */
@WebServlet("/rank.pr")
public class ProductBestListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBestListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount = 20;
		int currentPage = Integer.parseInt(request.getParameter("page")); 
		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage= startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		int userNo = 0;
		if(request.getSession().getAttribute("loginUser") != null) {
			userNo = (int)((Member)request.getSession().getAttribute("loginUser")).getUserNo();	
			
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		List<Product> list = new ProductService().productBestList(pi);
		
		// 좋아요한 상품데이터
		List<Integer> likeList = new ProductService().likeProductAll(userNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("likeList", likeList);
		
		request.getRequestDispatcher("/views/product/productBest.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
