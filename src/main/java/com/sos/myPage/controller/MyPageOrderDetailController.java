package com.sos.myPage.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.cart.model.vo.Order;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageOrderDetailController
 */
@WebServlet("/detailOrder.me")
public class MyPageOrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageOrderDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 사용자가 주문상세페이지 이동요청시 실행될 controller  
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 주문상세조회 요청할경우
		 *          응답페이지 : 로그인폼페이지 (로그인 유도)
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지-주문목록페이지)로 주문상세조회 요청할경우
		 *          응답페이지 : 주문상세페이지
		 *          응답데이터 : 조회된 해당주문번호의 상세정보 객체
		 * 
		 */
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			// 주문상세정보를 조회할 주문번호
			int orderNo = Integer.parseInt(request.getParameter("oNo"));
			
			// 주문상세정보 조회요청
			HashMap<String, Object> result = new MyPageService().selectOrder(orderNo);
			Order orderInfo = (Order)result.get("orderInfo");	// 조회된 주문정보 객체 (null | 주문정보)

			if(loginUser.getUserType().equals("Y")) {
				if(orderInfo != null) { // 주문정보가 있을경우 == 유효한 주문내역(주문번호)
					request.setAttribute("result", result);
					request.getRequestDispatcher("/views/myPage/myPageOrderDetail.jsp").forward(request, response);
				}else {
					request.getSession().setAttribute("alertMsg", "조회된 내역이 없습니다. 유효한 주문인지 확인해주세요.");
					response.sendRedirect(request.getContextPath() + "/olist.me");
				}
			} else {
				if(orderInfo != null) { // 주문정보가 있을경우 == 유효한 주문내역(주문번호)
					request.setAttribute("result", result);
					request.getRequestDispatcher("/views/manager/orderDetail.jsp").forward(request, response);
				}else {
					request.getSession().setAttribute("alertMsg", "조회된 내역이 없습니다. 유효한 주문인지 확인해주세요.");
					response.sendRedirect(request.getContextPath() + "/paymentList.ma?page=1");
				}
			}
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
