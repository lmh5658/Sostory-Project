package com.sos.newProduct.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.common.model.vo.PageInfo;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Product;

/**
 * Servlet implementation class ProductNewSearchController
 */
@WebServlet("/slistNew.pr")
public class ProductNewSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductNewSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색어를 가지고 list, pi 를 작업한 후
				String search = request.getParameter("search");
				int currentPage = Integer.parseInt(request.getParameter("page"));
				int countList = new ProductService().searchCountList(search);
				int pageLimit = 5;
				int boardLimit = 9;
				int maxPage = (int)Math.ceil((double)countList / boardLimit);
				int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;  
				int endPage = startPage + pageLimit - 1;
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				PageInfo pi = new PageInfo(countList, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
				List<Product> list = new ProductService().selectSearchList(search, pi);
				
				request.setAttribute("list", list);
				request.setAttribute("pi", pi);
				request.setAttribute("search", search);
				if(list.isEmpty()) {
					request.getRequestDispatcher("/views/newProduct/productNewNotList.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/views/newProduct/productNewList.jsp").forward(request, response);			
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
