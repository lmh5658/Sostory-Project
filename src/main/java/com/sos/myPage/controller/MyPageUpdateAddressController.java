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
 * Servlet implementation class MyPageUpdateAddressController
 */
@WebServlet("/updateAddr.me")
public class MyPageUpdateAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateAddressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 기존의 배송지정보 수정요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인경로(URL 공격 등)로 배송지수정 요청을 시도할경우
		 *          응답페이지 : 로그인폼페이지 (로그인 유도)
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 로그인한 사용자가 정상적인경로(마이페이지 배송지관리페이지)로 기존배송지 정보수정 요청을 할경우
		 *          응답페이지 : 배송지수정페이지(팝업창)
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
			
		}else {
			
			// 수정할 배송지정보 추출
			Address addr = new Address();
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			addr.setAddressWriter(String.valueOf(userNo));
			addr.setAddressNo(Integer.parseInt(request.getParameter("addressNo")));
			addr.setAddressLocal(request.getParameter("addressLocal"));
			addr.setAddressName(request.getParameter("addressName"));
			addr.setAddressPhone(request.getParameter("addressPhone"));
			addr.setAddressAddress(request.getParameter("addressAddress"));
			addr.setAddressDetail(request.getParameter("addressDetail"));
			
			
			/* addressType 추출값
			 * 
			 * case 01) null일 경우 : 기본배송지로 설정하지 않고 배송지수정
			 *                      1. 해당배송지 수정요청 (UPDATE)
			 *                      
			 * case 02)  'Y'일 경우 : 수정배송지를 기본배송지로하면서 수정
			 *                      1. 기존의 기본배송지 유무조회 (SELECT) ==> 0(없음) | 1(존재)
			 *                
			 *            case 01) 기존의 기본배송지가 존재할 경우
			 *                     2. 기존의 기본배송지 ADDRESS_TYPE = 'N' (UPDATE) ==> 0 | 1
			 *                     3. 해당배송지 수정요청 (UPDATE)
			 *                     
			 *            case 02) 기존의 기본배송지가 존재하지 않을경우
			 *                     2. 해당배송지를 기본배송지로 수정요청 (UPDATE)
			 */
			String addressType = request.getParameter("addressType");	// 'Y' | null
			
			MyPageService mpService = new MyPageService();
			
			int result = 0;
			
			if(addressType == null) { // case 01) 기본배송지로 설정하지않고 배송지수정만
				
				addr.setAddressType("N");
				result = mpService.updateAddress(addr);
				
			}else { // case 02) 기본배송지로 수정배송지를 설정하며 수정
				
				addr.setAddressType(addressType);
				
				// 해당회원의 기존기본배송지 유무조회
				int count = mpService.selectDefaultAddress(userNo);
				
				if(count == 0) { // case 02-1) 기존배송지가 존재하지 않음
					
					result = mpService.updateAddress(addr);
					
				}else { // case 02-2) 기존배송지가 존재함
					
					int updateDefault = mpService.updateAddressType(userNo);
					
					if(updateDefault > 0) { // 기존기본배송지 ADDRESS_TYPE == "N" 수정성공
						result = mpService.updateAddress(addr);
					}
					
				}
				
			}
			
			// 서비스 처리결과에 따른 응답메세지
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "배송지 수정이 완료되었습니다.");
			}else {
				request.getSession().setAttribute("alertMsg", "배송지 수정이 정상적으로 완료되지 않았습니다. 다시 시도해주세요.");
			}
			
			// 공통 응답페이지 : 마이페이지 배송관리페이지 (새로고침)
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
