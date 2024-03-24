package com.sos.newProduct.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.cart.model.service.CartService;
import com.sos.cart.model.vo.Cart;
import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.newProduct.model.service.ProductNewService;
import com.sos.newProduct.model.vo.ProductNew;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Product;

/**
 * Servlet implementation class ProductNewSortdlist
 */
@WebServlet("/sddlistNew.pr")
public class ProductNewSortdlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductNewSortdlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String select = request.getParameter("select");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int countList = new ProductService().countListDressing();
		int pageLimit = 5;
		int boardLimit = 9;
		int maxPage = (int)Math.ceil((double)countList / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(countList, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Product> list = new ProductService().sortDressingList(select, pi);
		int userNo = 0;
		if(request.getSession().getAttribute("loginUser") != null) {
			userNo = (int)((Member)request.getSession().getAttribute("loginUser")).getUserNo();			
		}
		List<Cart> cartList = new CartService().selectCart(userNo);
		ArrayList<Integer> pNoList = new ArrayList<>();
		for(Cart ca : cartList) {
			pNoList.add(ca.getProductNo());
		}
		
		
		// 사용자가 좋아요테이블에 담은 상품번호 리스트
		List<ProductNew> LikeList = new ProductNewService().selectLike(userNo);
		ArrayList<Integer> pNoLikeList = new ArrayList<>();
		for(ProductNew pr : LikeList) {
			pNoLikeList.add(pr.getProductNo());
			
		}
		request.setAttribute("pNoList", pNoList);
		request.setAttribute("pNoLikeList", pNoLikeList);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("select", select);
		
		request.getRequestDispatcher("/views/newProduct/productNewdlist.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
