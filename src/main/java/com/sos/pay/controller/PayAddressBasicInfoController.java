package com.sos.pay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sos.myPage.model.vo.Address;
import com.sos.pay.model.service.PayService;

/**
 * Servlet implementation class PayAddressBasicInfoController
 */
@WebServlet("/addressBasicInfo.pa")
public class PayAddressBasicInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayAddressBasicInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 결제페이지 회원번호 조회
		int userNo =  Integer.parseInt(request.getParameter("userNo"));
		// 배송지테이블에서 기본배송지 조회
		// 배송지주소, 배송지 상세주소, 배송지명
		Address a = new PayService().selectAddressBasicInfo(userNo);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(a, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
