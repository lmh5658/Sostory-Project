package com.sos.pay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.member.model.vo.Member;
import com.sos.myPage.model.vo.Address;
import com.sos.pay.model.service.PayService;
import com.sos.pay.model.vo.Pay;

/**
 * Servlet implementation class PayOrderFormController
 */
@WebServlet("/payForm.pa")
public class PayOrderFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayOrderFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인한 회원의 회원번호 받아오기
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		// 장바구니 목록리스트에 담긴 상품사진, 상품명, 상품가격, 상품할인가격, 상품수량 배열로조회
		String[] count = request.getParameterValues("changeCount"); // input 수량 증감버튼으로 바뀐 상품수량
		String[] name = request.getParameterValues("cartName");
		String[] path = request.getParameterValues("cartImage");
		String[] price = request.getParameterValues("changePrice");
		String[] priceMinusDcprice = request.getParameterValues("priceMisnusDiscountPrice");
		String[] discountPrice = request.getParameterValues("changeDiscountPrice");
		String[] hiddencartProductNo = request.getParameterValues("hiddencartProductNo"); // 히든값으로 모든 상품들의 상품번호 받아옴
		
		String[] productNo = request.getParameterValues("productNo"); // 체크된 상품들의 상품번호
		
		int result = new PayService().updateCount(count,userNo,hiddencartProductNo);
		
		
		
		List<Pay> list = new ArrayList<>(); // List를 초기화
		
		for(int i=0; i<count.length; i++) {
			// 장바구니의 담겨있는 상품들의 수량, 이름, 가격, 이미지 경로를 담아와서
			// list에 담아주기
			Pay p = new Pay();
			p.setCount(count[i]);
			p.setProductName(name[i]);
			p.setPrice(price[i]);
			p.setPath(path[i]);
			p.setDiscountPrice(discountPrice[i]);
			p.setProductNo(hiddencartProductNo[i]);
			p.setDiscountPrice(priceMinusDcprice[i]);
			list.add(p);
			
		}
		
		// 상품들의 정가 총합
		int totalPrice =  Integer.parseInt(request.getParameter("allPrice"));
		
		// 상품들의 할인가 총합
		int dcPrice =  Integer.parseInt(request.getParameter("discountPrice"));
		
		// 회원이 마이페이지에서 등록한 배송지리스트 조회
		List<Address> addressList = new PayService().selectAddressInfo(userNo);
		
		// 체크된 상품들의 상품번호(String[])로 DB에서 상품이름, 상품가격, 상품할인가격, 이미지경로, 수량 받아오기
		List<Pay> productInfolist = new PayService().selectCartInfo(userNo,productNo);
		
		if(list.isEmpty()) { // 장바구니에 상품이 없을 시 
			request.getSession().setAttribute("alertMsg", "장바구니에 상품이 없습니다.");
			response.sendRedirect(request.getContextPath()+"/list.ca");
			
		}else { // 장바구니에 상품이 담겨있을 시 결제페이지로 이동
		
			request.setAttribute("count", count);
			request.setAttribute("productInfolist", productInfolist);
			request.setAttribute("list", list);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("discountPrice", dcPrice);
			
			if(!addressList.isEmpty()) {
				request.setAttribute("addressList", addressList);
			}
			
			request.getRequestDispatcher("/views/pay/payList.jsp").forward(request, response);
		}
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
