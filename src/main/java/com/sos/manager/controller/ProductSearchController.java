package com.sos.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model.service.ManagerService;
import com.sos.product.model.vo.Product;

/**
 * Servlet implementation class MemberSearchController
 */
@WebServlet("/searchProduct.ma")
public class ProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		
		int listCount = new ManagerService().selectCountSearchProductList(keyword);
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		int maxPage = (int)Math.ceil((listCount * 1.0) / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {endPage = maxPage;}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Product> list = new ManagerService().selectProductByKeyword(keyword, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.getRequestDispatcher("/views/manager/productList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
