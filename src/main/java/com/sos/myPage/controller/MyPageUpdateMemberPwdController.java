package com.sos.myPage.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;

/**
 * Servlet implementation class myPageUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MyPageUpdateMemberPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateMemberPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 서블릿 역할 : 마이페이지 비밀번호변경 페이지에서 넘어온 데이터로 해당 회원의 비밀번호 변경 요청
		
		// 전달 데이터 : 기존비밀번호, 변경비밀번호, 회원번호 
		HashMap<String, Object> mem = new HashMap();
		mem.put("oldPwd", request.getParameter("oldPwd"));
		mem.put("newPwd", request.getParameter("newPwd"));
		int userNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUserNo();
		mem.put("userNo", userNo);
		
		// 서비스측에 변경요청 및 처리결과 반환받기
		int result = new MyPageService().updateMemberPwd(mem);
		
		// 결과처리에 따른 응답화면
		if(result > 0) { 
			/* 변경처리 성공시
			 * 응답데이터 : alert 메세지
			 * 응답페이지 : 마이페이지메인 (리다이렉트)
			 */
			request.getSession().setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		} else {
			/* 변경처리 실패시
			 * 응답데이터 : alert 메세지
			 * 응답페이지 : 마이페이지메인 (리다이렉트)
			 */
			request.getSession().setAttribute("alertMsg", "비밀번호 변경중 예상치못한 오류가 발생했습니다. 다시 시도해주세요.");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
