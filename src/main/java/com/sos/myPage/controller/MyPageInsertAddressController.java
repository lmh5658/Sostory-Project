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
 * Servlet implementation class MyPageInsertAddressController
 */
@WebServlet("/insertAddr.me")
public class MyPageInsertAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageInsertAddressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* 서블릿 역할 : 마이페이지에서 사용자가 배송지추가 등록요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 신규배송지 등록요청을 하고자할경우
		 *          응답페이지 : 로그인폼페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지 배송지관리메뉴)로 신규배송지 등록요청을 할경우
		 *          응답페이지 : 배송지등록페이지 (팝업창)
		 * 
		*/
		
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
			
		}else {
			// 등록할 신규배송지 정보추출 및 주소객체에 담기
			Address addr = new Address();
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			addr.setAddressWriter(String.valueOf(userNo));
			addr.setAddressLocal(request.getParameter("addressLocal"));
			addr.setAddressName(request.getParameter("addressName"));
			addr.setAddressAddress(request.getParameter("addressAddress"));
			addr.setAddressDetail(request.getParameter("addressDetail"));
			addr.setAddressPhone(request.getParameter("addressPhone"));
			
			/* addressType 추출값
			 * 
			 * case 01) null일 경우 : 기본배송지로 설정하지 않고 신규배송지 추가등록
			 *                      1. 신규배송지 등록요청 (INSERT)
			 *                      
			 * case 02)  'Y'일 경우 : 신규배송지를 기본배송지로하면서 추가등록
			 *                      1. 기존의 기본배송지 유무조회 (SELECT) ==> 0(없음) | 1(존재)
			 *                
			 *            case 01) 기존의 기본배송지가 존재할 경우
			 *                     2. 기존의 기본배송지 ADDRESS_TYPE = 'N' (UPDATE) ==> 0 | 1
			 *                     3. 신규배송지 등록요청 (INSERT)
			 *                     
			 *            case 02) 기존의 기본배송지가 존재하지 않을경우
			 *                     2. 신규배송지 등록요청 (INSERT)
			 */
			String addressType = request.getParameter("addressType");
			
			MyPageService mpService = new MyPageService();
			
			int result = 0;
			
			if(addressType == null) { // 기본배송지가 아닌 일반배송지로 추가등록
				
				// 기본배송지 설정여부 N으로 설정
				addr.setAddressType("N");
				// 신규배송지 추가등록
				result = mpService.insertAddress(addr);
				
			}else{ // 기본배송지로 배송지를 추가등록
				addr.setAddressType(addressType);		// "Y"
				
				// 1. 기존에 등록된 기본배송지 유무조회
				int count = mpService.selectDefaultAddress(userNo);
				
				if(count > 0) { // 등록된 기존 기본배송지가 존재할경우
					// 2. 기존 기본배송지 ADDRESS_TYPE 수정요청
					int updateResult = mpService.updateAddressType(userNo);
					
					if(updateResult > 0) { //  기존 기본배송지 ADDRESS_TYPE 수정성공
						// 3. 신규배송지 기본배송지로 추가등록
						result = mpService.insertAddress(addr);
					}
					
				}else { // 등록된 기존 기본배송지가 존재하지 않을경우
					// 2. 신규배송지 기본배송지로 추가등록
					result = mpService.insertAddress(addr);
				}
				
			}

			// 배송지 추가등록 요청처리 결과에 따른 알림메세지
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "배송지 등록이 완료되었습니다.");
			}else {
				request.getSession().setAttribute("alertMsg", "배송지 등록이 정상적으로 완료되지 않았습니다. 다시 시도해주세요.");
				
			}
			
			// 공통 응답화면 (마이페이지 배송관리페이지)
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
