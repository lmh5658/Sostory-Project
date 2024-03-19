package com.sos.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyPageDeleteMemberFormController
 */
@WebServlet("/deleteForm.me")
public class MyPageDeleteMemberFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageDeleteMemberFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 회원탈퇴페이지 요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 회원탈퇴 요청할경우
		 *          응답페이지 : 로그인폼페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지)로 회원탈퇴 요청할경우
		 *          응답페이지 : 회원탈퇴페이지 (포워딩)
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");	
		}else {
			request.getRequestDispatcher("/views/myPage/myPageDeleteMemberForm.jsp").forward(request, response);
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
