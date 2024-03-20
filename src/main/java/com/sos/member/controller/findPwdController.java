package com.sos.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.service.MemberService;
import com.sos.member.model.vo.Member;

/**
 * Servlet implementation class findPwdController
 */
@WebServlet("/findPwd.me")
public class findPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findPwdController() {
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
		m.setUserId(request.getParameter("userId"));
		
		String userPwd = new MemberService().findPwdByEmail(m);
		
		request.setAttribute("userId", m.getUserId());
		request.setAttribute("userPwd", userPwd);
		request.getRequestDispatcher("/views/member/findPwdSuccess.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
