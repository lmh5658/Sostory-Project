package com.sos.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.service.MemberService;
import com.sos.member.model.vo.Member;

/**
 * Servlet implementation class FindIdController
 */
@WebServlet("/findId.me")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = new Member();
		m.setUserName(request.getParameter("userName"));
		m.setEmail(request.getParameter("email"));
		
		String userId = new MemberService().findIdByEmail(m);
		
		if(userId != null) {
			request.setAttribute("userId", userId);
			request.setAttribute("userName", m.getUserName());
			request.getRequestDispatcher("/views/member/findIdSuccess.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "아이디를 찾지 못했습니다.");
			response.sendRedirect(request.getContextPath());
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
