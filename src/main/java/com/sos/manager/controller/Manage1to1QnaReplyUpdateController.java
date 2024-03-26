package com.sos.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.manager.model2.service2.ManagerService2;
import com.sos.member.model.vo.Member;

/**
 * Servlet implementation class Manage1to1QnaReplyUpdateController
 */
@WebServlet("/updataReply.ma")
public class Manage1to1QnaReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manage1to1QnaReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int answerNo = Integer.parseInt(request.getParameter("answerNo"));
		String replyContent = request.getParameter("replyContent");
		int adminNo = (int)((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		System.out.println(answerNo);
		System.out.println(replyContent);
		System.out.println(adminNo);
		
		
		int result = new ManagerService2().insertQnaReply(answerNo, replyContent, adminNo);
		if(result > 0) {
			request.setAttribute("alertMsg", "문의등록이 성공적으로 완료되었습니다.");
		}else {
			request.setAttribute("alertMsg", "문의등록을 실패하였습니다.");
		}
		
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
