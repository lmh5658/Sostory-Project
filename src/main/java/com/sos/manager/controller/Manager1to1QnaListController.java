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
import com.sos.manager.model2.service2.ManagerService2;
import com.sos.product.model.vo.ProductQnaReply;

/**
 * Servlet implementation class Manager1to1QnaListController
 */
@WebServlet("/qnaPersonal.ma")
public class Manager1to1QnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager1to1QnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = new ManagerService2().managerQnalistCount();
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

		List<ProductQnaReply> list =  new ManagerService2().managerQnalist(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("listCount", listCount);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/manager/qnaPersonal.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
