package com.sos.myPage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;
import com.sos.myPage.model.vo.Address;

/**
 * Servlet implementation class MyPageAddressListController
 */
@WebServlet("/address.me")
public class MyPageAddressListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageAddressListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 마이페이지 배송지관리페이지 요청시 실행될 서블릿
		 * 
		 * case 01) 로그인한 사용자가 정상적인 경로로 마이페이지 배송지관리페이지 요청했을 경우 (마이페이지의에서 배송지관리 클릭)
		 *          응답화면 : 배송지관리페이지
		 *          응답데이터 : 등록한 배송지객체 리스트 (SELECT) ==> List<Address> : null | list
		 *          필요데이터 : 회원번호
		 *          
		 * case 02) 로그인을 하지않은 사용자가 마이페이지 배송지관리페이지 요청했을 경우 (URL 공격 등)
		 *          응답화면 : 로그인페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 */

		if(request.getSession().getAttribute("loginUser") != null) {

			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			
			List<Address> list = new MyPageService().selectAddressList(userNo);
			
			request.setAttribute("addressList", list);
			request.getRequestDispatcher("/views/myPage/myPageAddressList.jsp").forward(request, response);
			
		}else{
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/login.me");
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
