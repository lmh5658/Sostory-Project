package com.sos.product.controller;

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
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class AjaxReviewListController
 */
@WebServlet("/qlist.pr")
public class AjaxQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxQnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productNo = Integer.parseInt(request.getParameter("proNo"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int countList = new ProductService().selectQnaCount(productNo);
		int boardLimit = 5;
		int pageLimit = 5;
		int maxPage = (int)Math.ceil((double)countList / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(countList, currentPage, boardLimit, pageLimit, maxPage, startPage, endPage);
		
		List<Qna> qlist = new ProductService().selectQnaList(productNo, pi);
		
		HashMap<String, Object> hmap = new HashMap();
		if(!qlist.isEmpty()) {
			hmap.put("qlist", qlist);
			hmap.put("pi", pi);			
		}
	

		
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(hmap, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
