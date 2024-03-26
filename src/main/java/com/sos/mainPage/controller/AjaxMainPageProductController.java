package com.sos.mainPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sos.cart.model.service.CartService;
import com.sos.cart.model.vo.Cart;
import com.sos.mainPage.model.service.MainPageService;
import com.sos.member.model.vo.Member;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Product;

/**
 * Servlet implementation class MainPageController
 */
@WebServlet("/product.mp")
public class AjaxMainPageProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMainPageProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 메인페이지 노출용 Product 리스트 조회
		 * 
		 * case 01) 미로그인 사용자 == loginUser == null
		 *          >> 조회결과 : 메인페이지용 상품목록
		 * 
		 * case 02) 로그인한 사용자 == loginUser != null
		 *          >> 조회결과 1 : 메인페이지용 상품목록
		 *          >> 조회결과 2 : 사용자가 장바구니에 담은 상품목록 (장바구니 담김표시)
		 *          >> 조회결과 3 : 사용자가 찜한 상품목록  (찜 표시)
		 *          >> 전달객체 4 : 로그인한 사용자
		 * 
		 */
		
		// 메인페이지 상품목록
		String category = request.getParameter("category");
		
		// 노출할 상품리스트 조회요청
		List<Product> productList = new MainPageService().selectProductList(category);
		
		// 상품리스트 JSON화
		JSONArray jProductList = new JSONArray();	// 상품리스트를 담을 JSON배열
		
		if(!productList.isEmpty()) {
			for(Product p : productList) {
				JSONObject jProduct = new JSONObject();
				
				jProduct.put("productNo", p.getProductNo());
				jProduct.put("categoryName", p.getCategoryName());
				jProduct.put("productName", p.getProductName());
				jProduct.put("price", p.getPrice());
				jProduct.put("discountPrice", p.getDiscountPrice());
				jProduct.put("productUrl", p.getPath());
				
				jProductList.add(jProduct);
			}
		}
		
		/* 로그인한 사용자일 경우 필요한 정보
		 * 
		 * (1) 로그인 사용자정보 (회원번호)
		 * (2) 사용자가 장바구니에 추가한 상품정보
		 * (3) 사용자가 찜한 상품정보
		 * 
		 */
		List<Integer> cartProducts = new ArrayList<>();							// 로그인한 사용자가 장바구니에 추가한 상품번호를 담을 배열변수
		List<Integer> likedProducts = new ArrayList<>();						// 로그인한 사용자가 찜한 상품번호를 담을 배열변수
		Member user = (Member)request.getSession().getAttribute("loginUser");	// 로그인한 사용자
		
		JSONObject jUser = new JSONObject();									// 로그인한 회원일 경우 회원번호를 담을 객체변수
		
		if(user != null) {
			
			// (1) 로그인한 사용자 정보 JSONObject화
			jUser.put("userNo", user.getUserNo());
			
			
			// (2) 장바구니에 추가한 상품목록 조회
			List<Cart> cartList =  new CartService().selectCart(user.getUserNo());
			
			for(Cart ca : cartList) {
				cartProducts.add(ca.getProductNo());
			}
			
			// (3) 찜한 상품목록 조회 
			likedProducts = new ProductService().likeProductAll(user.getUserNo()); // 찜한 상품번호 배열
			
		}
		
		// (2) 장바구니 추가한 상품목록 JSONArray화
		JSONArray jCartList = new JSONArray();		// 장바구니 추가한 상품번호를 담을 JSON 배열객체
		
		if(!cartProducts.isEmpty()) {
			for(int i=0 ; i<cartProducts.size() ; i++) {
				JSONObject jPno = new JSONObject();
				jPno.put("pNo", cartProducts.get(i));
				jCartList.add(jPno);
			}
		}
		
		// (3) 찜한 상품목록 JSONArray화
		JSONArray jLikedList = new JSONArray();		// 찜한 상품번호를 담을 JSON 배열객체
		
		if(!likedProducts.isEmpty()) {
			for(int i=0 ; i<likedProducts.size() ; i++) {
				JSONObject jPno = new JSONObject();
				jPno.put("pNo", likedProducts.get(i));
				jLikedList.add(jPno);
			}
		}
		
		// 전송데이터(메인페이지상품목록, 장바구니상품목록, 찜한상품목록) 단일객체화
		JSONArray jResult = new JSONArray();
		jResult.add(jProductList);
		jResult.add(jCartList);
		jResult.add(jLikedList);
		jResult.add(jUser);
		
		// 결과전송
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jResult);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
