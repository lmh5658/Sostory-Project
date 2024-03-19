package com.sos.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;
import com.sos.myPage.model.vo.Address;

/**
 * Servlet implementation class MyPageDeleteAddressController
 */
@WebServlet("/deleteAddr.me")
public class MyPageDeleteAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageDeleteAddressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 배송지 삭제요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 배송지삭제 요청할경우
		 *          응답페이지 : 로그인폼페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 로그인 사용자가 정상적인 경로(마이페이지)로 배송지삭제 요청할경우
		 *          1. 배송지 삭제요청 (UPDATE)
		 *          2. 회원 MODIFY_DAATE 수정요청 (UPDATE) --> Service
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
			
		}else {
			// 배송지삭제에 필요한 데이터 추출 (배송지번호, 회원번호)
			Address addr = new Address();
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			addr.setAddressWriter(String.valueOf(userNo));	// 회원번호 : UPDATE MODIFY_DATE시 필요
			addr.setAddressNo(Integer.parseInt(request.getParameter("addressNo")));	// 배송지번호 : UPDATE ADDRESS_STATUS시 필요
			
			// 배송지 삭제요청
			int result = new MyPageService().deleteAddress(addr);
			
			// 처리결과에 다른 응답메세지
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "배송지 삭제 완료되었습니다.");
			}else {
				request.getSession().setAttribute("alertMsg", "배송지 삭제가 정상적으로 완료되지 않았습니다. 다시 시도해주세요.");
			}
			
			// 공통 응답화면 : 마이페이지 배송지관리페이지
			response.sendRedirect(request.getContextPath() + "/address.me");
			
			
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
