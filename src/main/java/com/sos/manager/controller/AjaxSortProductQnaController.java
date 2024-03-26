package com.sos.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model2.service2.ManagerService2;
import com.sos.newProduct.model.service.ProductNewService;
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class AjaxSortProductQnaController
 */
@WebServlet("/sort.ma")
public class AjaxSortProductQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSortProductQnaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount =0;
		String category = request.getParameter("category");
		if(category.equals("jang")) {
			listCount = new ProductNewService().countCategoryJang();// 상품문의 장류 총 개수
		}else if(category.equals("dress")) {
			listCount = new ProductNewService().countCategoryDress();// 상품문의 드레싱 총 개수
		}else if(category.equals("etc")){
			listCount = new ProductNewService().countCategoryEtc();// 상품문의 기타 총 개수
		}else if(category.equals("all")) {
			listCount = new ProductNewService().countCategoryAll();// 상품문의 기타 총 개수

		}
		
		
		
		int currentPage = Integer.parseInt(request.getParameter("page")); 
		int pageLimit = 5;
		int boardLimit = 6;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage= startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Qna> list =new ProductNewService().selectCategoryList(category,pi);
		HashMap<String,Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		hm.put("category", category);
		
	
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(hm, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
