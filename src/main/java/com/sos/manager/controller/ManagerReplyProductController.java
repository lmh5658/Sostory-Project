package com.sos.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.manager.model2.service2.ManagerService2;
import com.sos.newProduct.model.service.ProductNewService;
import com.sos.product.model.vo.AttachmentProduct;
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class ManagerReplyProductController
 */
@WebServlet("/productReply.ma")
public class ManagerReplyProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerReplyProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 해당 게시글번호, 상품번호, 제목, 내용
		int no = Integer.parseInt(request.getParameter("no"));
		
		Qna q = new ProductNewService().selectReplyList(no);
		AttachmentProduct ap = new ProductNewService().selectReplyListFile(no);
		
		
		request.setAttribute("q", q);
		request.setAttribute("ap", ap);
		request.getRequestDispatcher("/views/manager/qnaProductAnswer.jsp").forward(request, response);

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
