package com.sos.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sos.member.model.vo.Member;
import com.sos.pay.model.service.PayService;

/**
 * Servlet implementation class PayOrderInfocontroller
 */
@WebServlet("/loginInfo.pa")
public class PayOrderInfocontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayOrderInfocontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원이름, 휴대폰번호, 이메일
		int userNo =  Integer.parseInt(request.getParameter("userNo"));
		Member m = new PayService().selectOrderInfo(userNo);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(m, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
