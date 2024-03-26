package com.sos.mainPage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sos.common.model.vo.PageInfo;
import com.sos.mainPage.model.service.MainPageService;
import com.sos.product.model.vo.Product;
import com.sos.recipe.model.vo.Recipe;

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
		
		// 서블릿 역할 : 메인페이지 노출용 Product 리스트 조회
		
		/* 조회할 상품리스트 카테고리
		 * 
		 * category "all" == 전체상품
		 * 
		 * category "best" == 랭킹상품
		 * 
		 * category "new" == 신상품
		 * 
		 */
		String category = request.getParameter("category");
		System.out.println(category);
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
		
		// 결과전송
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jProductList);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
