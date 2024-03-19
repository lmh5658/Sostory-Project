package com.sos.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageDeleteMemberController
 */
@WebServlet("/delete.me")
public class MyPageDeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageDeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 회원탈퇴 요청시 실행될 controller
		 * 
		 * case 01) 회원탈퇴 요청처리 성공시
		 *          응답페이지 : 메인페이지 (로그아웃상태)
		 *          응답메세지 : "그동안 이용해주셔서 감사합니다."
		 *          
		 * case 02) 회원탈퇴 요청처리 실패시
		 *          응답페이지 : 에러페이지
		 *          응답메세지 : "탈퇴요청이 정상적으로 처리되지 않았습니다. 다시 시도해주세요."
		 * 
		 */
		
		// 탈퇴요청한 회원번호
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		// 회원탈퇴 요청 및 결과 (UPDATE)
		int result = new MyPageService().deleteMember(userNo);
		
		if(result > 0) {
			request.getSession().invalidate();	// 로그아웃처리
			request.getSession().setAttribute("alertMsg", "그동안 이용해주셔서 감사합니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			// 에러페이지
			// 에러메세지
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
