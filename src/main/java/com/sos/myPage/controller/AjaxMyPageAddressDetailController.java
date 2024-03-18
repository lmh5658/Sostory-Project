package com.sos.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sos.myPage.model.service.MyPageService;
import com.sos.myPage.model.vo.Address;

/**
 * Servlet implementation class AjaxMyPageAddressDetailController
 */
@WebServlet("/addrDetail.me")
public class AjaxMyPageAddressDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMyPageAddressDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 배송지정보 수정요청시 수정할 배송지의 기존배송지 정보를 Ajax기법으로 조회 및 결과를 반환하는 controller  
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 배송지수정 요청을 시도할경우
		 *          응답페이지 : 로그인폼페이지 (로그인 유도)
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 로그인한 사용자가 정상적인 경로로 기존배송지 정보수정 요청을 할경우
		 *          ==> 배송지 정보조회 및 조회결과(객체) 반환
		 * 
		 */

		if(request.getSession().getAttribute("loginUser") == null ) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			
			// 조회할 배송지의 배송지번호
			int addressNo = Integer.parseInt(request.getParameter("addressNo"));
			
			Address addr = new MyPageService().selectAddress(addressNo);

			if(addr != null) {

				/* 1. JSON 방식
				JSONObject jObj = new JSONObject();
				
				jObj.put("addressNo", addr.getAddressNo());
				jObj.put("addressLocal", addr.getAddressLocal());
				jObj.put("addressName", addr.getAddressName());
				jObj.put("addressPhone", addr.getAddressPhone());
				jObj.put("addressAddress", addr.getAddressAddress());
				jObj.put("addressDetail", addr.getAddressDetail());
				jObj.put("addressType", addr.getAddressType());
				
				// JSONObject 객체로 배송지정보 전달
				response.setContentType("application/json; charset=utf-8");
				response.getWriter().print(jObj);
				*/
				
				// 2. GSON 방식
				response.setContentType("application/json; charset=utf-8");
				new Gson().toJson(addr, response.getWriter());
				
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
