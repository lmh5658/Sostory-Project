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
 * Servlet implementation class MemberSignupCotroller
 */
@WebServlet("/signup.me")
public class MemberSignupCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSignupCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		Member m = new Member(request.getParameter("userId"),
							  request.getParameter("userPwd"),
							  request.getParameter("userName"),
							  request.getParameter("birthDate"),
							  request.getParameter("nickName"),
							  request.getParameter("phone"),
							  request.getParameter("email"),
							  request.getParameter("address"),
							  request.getParameter("addressDetail"),
							  request.getParameter("gender"));
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			request.setAttribute("userName", m.getUserName());
			request.getRequestDispatcher("/views/member/signupComplete.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "회원가입 요청에 실패했습니다.");
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
