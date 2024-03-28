package com.sos.product.controller;

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
import com.sos.member.model.vo.Member;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.ProductLike;
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
		List<Member> list = new ProductService().selectPaymentUser(productNo);
		List<ProductRecipe> rlist = new ProductService().selectRecipeList(productNo);
		
		int userNo = 0;
		if(request.getSession().getAttribute("loginUser") != null) {
			userNo = (int)((Member)request.getSession().getAttribute("loginUser")).getUserNo();			
		}
		
		
		List<ProductLike> likeUser = new ProductService().likeUserNo(userNo);				
		
		
		List<Integer> likedProductNo = new ArrayList<>();  // 상품번호 배열
		for(ProductLike pl : likeUser) {
			likedProductNo.add(pl.getLikeRefNo());
			
		}
		
		//사용자가 장바구니에 담은상품번호 리스트(장바구니 담김여부 표시를 위함)
		List<Cart> cartList = new CartService().selectCart(userNo);
		ArrayList<Integer> pNoList = new ArrayList<>();
		for(Cart ca : cartList) {
			pNoList.add(ca.getProductNo());
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pro", pro);
		request.setAttribute("rlist", rlist);
		request.setAttribute("likeUser", likeUser);
		request.setAttribute("likedProductNo", likedProductNo);
		request.setAttribute("pNoList", pNoList);
		
		
		
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
