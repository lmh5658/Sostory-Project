package com.sos.product.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.sos.product.model.vo.ProductLike;

/**
 * Servlet implementation class ProductListController
 */
@WebServlet("/list.pr")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int listCount = new ProductService().selectListCount();// 총사진게시글갯수
		int currentPage = Integer.parseInt(request.getParameter("page")); 
		int pageLimit = 5;
		int boardLimit = 9;
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
		
		// 전체상품게시글 데이터 조회
		List<Product> list = new ProductService().selectProductList(pi);
		// 좋아요한 상품데이터
		List<ProductLike> likeList = new ProductService().likeProductAll(userNo);
		
		List<Integer> proNo = new ArrayList<>();
		
		
		for(ProductLike pl : likeList) {
			proNo.add(pl.getLikeRefNo());
		}
		
		System.out.println(proNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("proNo", proNo);
		
		
		request.getRequestDispatcher("/views/product/productAllList.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
