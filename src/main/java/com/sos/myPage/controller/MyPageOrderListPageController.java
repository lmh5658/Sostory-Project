package com.sos.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyPageOrderListPageController
 */
@WebServlet("/olist.me")
public class MyPageOrderListPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageOrderListPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 마이페이지 주문목록페이지 이동요청시 실행될 서블릿
		 * 
		 * case 01) 로그인한 사용자가 정상적인 경로(마이페이지)로 주문조회페이지 요청했을 경우
		 *          응답화면 : 주문조회목록페이지
		 *          
		 * case 02) 로그인을 하지않은 사용자가 비정상적인 경로(URL 공격 등)로 주문조회페이지 요청했을 경우 
		 *          응답화면 : 로그인페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			request.getRequestDispatcher("/views/myPage/myPageOrderList.jsp").forward(request, response);
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
