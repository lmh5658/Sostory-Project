package com.sos.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class myPageUpdatePwdFormController
 */
@WebServlet("/updatePwdForm.me")
public class myPageUpdateMemberPwdFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageUpdateMemberPwdFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 사용자 마이페이지 비밀번호변경페이지 요청시 실행될 controller
		 * 
		 * case 01) 로그인한 사용자가 마이페이지 비밀번호변경페이지 이동요청을 할경우 (URL | 마이페이지네비바)
		 *          응답화면 ==> 마이페이지 비밀번호변경페이지
		 * case 02) 로그인을 하지않은 사용자가 마이페이지 비밀번호변경페이지 이동요청을 할경우 (URL 공격 등)
		 *          응답화면 ==> 로그인페이지
		 */
		
		if(request.getSession().getAttribute("loginUser") != null) {
			request.getRequestDispatcher("/views/myPage/myPageUpdateMemberPwdForm.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
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
