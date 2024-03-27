package com.sos.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.service.MemberService;
import com.sos.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HashMap<String, String> loginInfo = new HashMap<>();
		loginInfo.put("userId", request.getParameter("userId"));
		loginInfo.put("userPwd", request.getParameter("userPwd"));
		
		Member loginUser = new MemberService().loginMember(loginInfo);
		
		if(loginUser == null) { // 조회된 회원이 없을경우
			// 로그인 실패 메세지의 알림창을 띄워주기 ==> 메인페이지로 이동
			request.setAttribute("failMsg", "등록되지 않은 아이디이거나 아이디 또는 비밀번호가 일치하지 않습니다.");
			request.getRequestDispatcher("/views/member/memberLoginForm.jsp").forward(request, response);
			
		}else { // 조회된 회원이 있을경우 : 메인페이지로 이동
			// 로그인화면의 메인페이지로 이동
			request.getSession().setAttribute("loginUser", loginUser);
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
