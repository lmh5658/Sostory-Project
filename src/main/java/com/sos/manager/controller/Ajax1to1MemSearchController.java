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
import com.sos.product.model.vo.ProductQnaReply;

/**
 * Servlet implementation class ManagerMemSearchController
 */
@WebServlet("/msearch.ma")
public class Ajax1to1MemSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajax1to1MemSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("search");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		int listCount = new ManagerService2().searchMemCount(search);
		int pageLimit = 5;
		int boardLimit = 6;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage= startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		List<ProductQnaReply> list = new ManagerService2().searchMemList(search, pi);
		System.out.println(pi);
		HashMap<String, Object> hm = new HashMap();
		if(!list.isEmpty()) {
			hm.put("pi", pi);
			hm.put("list", list);
			hm.put("search", search);
		}
		System.out.println(list);
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
