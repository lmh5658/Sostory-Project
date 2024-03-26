package com.sos.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.newProduct.model.service.ProductNewService;

/**
 * Servlet implementation class ManagerReplyProductInsertController
 */
@WebServlet("/insertReply.ma")
public class ManagerReplyProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerReplyProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해당 문의번호, 답변내용 받아와서 REPLY(답변내용), REPLY(답변날짜) UPDATE해주기
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("replyContent");

		int result = new ProductNewService().updateReply(no,content); // 답변내용 업데이트 후, 미처리 => 처리로
		
		
		request.getSession().setAttribute("alertMsg", "답변이 성공적으로 등록되었습니다");
		response.sendRedirect(request.getContextPath() +"/qnaProduct.ma?page=1");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
