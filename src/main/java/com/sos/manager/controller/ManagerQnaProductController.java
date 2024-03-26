package com.sos.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.common.model.vo.PageInfo;
import com.sos.newProduct.model.service.ProductNewService;
import com.sos.newProduct.model.vo.ProductNew;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class QnaProductController
 */
@WebServlet("/qnaProduct.ma")
public class ManagerQnaProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerQnaProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = new ProductService().selectQnaAllCount();// 상품문의 총 개수
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
		
		
		// 문의테이블에서, 문의번호, 작성일자, 회원아이디, 상품명, 문의내역 , 처리결과
		List<Qna> list = new ProductService().selectQnaAllList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/manager/qnaProduct.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
