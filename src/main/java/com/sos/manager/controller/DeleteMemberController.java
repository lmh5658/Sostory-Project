package com.sos.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.manager.model.service.ManagerService;

/**
 * Servlet implementation class ManagerMemberDeleteController
 */
@WebServlet("/deleteMember.ma")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] strUserNo = request.getParameterValues("userNo");
		int[] userNo = new int[strUserNo.length];
		for(int i=0; i<strUserNo.length; i++) {
			userNo[i] = Integer.parseInt(strUserNo[i]);
		}
		strUserNo = null;
		
		int result = new ManagerService().deleteMember(userNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", userNo.length + "명의 회원이 비활성화 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memberList.ma?page=1");
		} else {
			request.getSession().setAttribute("alertMsg", "회원삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/memberList.ma?page=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
