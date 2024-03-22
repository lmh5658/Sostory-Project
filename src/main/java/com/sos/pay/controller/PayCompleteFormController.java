package com.sos.pay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.cart.model.vo.Order;
import com.sos.member.model.vo.Member;
import com.sos.pay.model.service.PayService;
import com.sos.pay.model.vo.Pay;

/**
 * Servlet implementation class PayCompleteFormController
 */
@WebServlet("/payComplete.pa")
public class PayCompleteFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayCompleteFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//Order(vo) 클래스에 담아서 ==> TB_ORDER
		
		// 로그인한 회원번호, 주문자 이름, 휴대폰번호, 이메일 
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		String name = request.getParameter("orderName");
		String phone = request.getParameter("orderPhone");
		String email = request.getParameter("orderEmail");
		
		// 배송지 주소, 상세주소, 요청사항, 총상품금액
		String addressName = request.getParameter("addressName");
		String addressDetail = request.getParameter("addressDetail");
		String requestContent = request.getParameter("requestContent");
		int payPrice =  Integer.parseInt(request.getParameter("payPrice"));
		
		// 예금주명,은행명,계좌번호
		String accountHolder = request.getParameter("accountHolder");
		String bankName = request.getParameter("bankName");
		String accountNumber = request.getParameter("accountNumber");
		
		Order o = new Order(userNo,name,phone,email,addressName,addressDetail,requestContent,payPrice,accountHolder,bankName,accountNumber);
		
		
		// 상품번호, 주문수량 => Pay(vo) 클래스에 담아서 ==> TB_ORDER_PRODUCT 
		// 상품이름, 상품금액, 상품수량 => Pay(vo) 클래스에 담아서 ==> PayComplete.jsp에 값뿌려주기
		String[] count = request.getParameterValues("productCount");
		String[] productNo = request.getParameterValues("productNo");
		String[] productName = request.getParameterValues("productName");
		String[] productPrice = request.getParameterValues("productPrice");
		String[] productDiscountPrice = request.getParameterValues("productDiscountPrice");
		String[] productPath = request.getParameterValues("productPath");
		String[] productMinusPrice = request.getParameterValues("productMinusPrice");
		
	
		
		List<Pay> list = new ArrayList<>(); 
		
		for(int i=0; i<count.length; i++) {
			
			Pay p = new Pay();
			p.setCount(count[i]);
			p.setProductNo(productNo[i]);
			p.setProductName(productName[i]);
			p.setPrice(productPrice[i]);
			p.setPath(productPath[i]);
			p.setDiscountPrice(productDiscountPrice[i]);
			p.setPriceMinusDcprice(productMinusPrice[i]);
			list.add(p);
			
		}
		
		int result = new PayService().insertOrder(o,list);
		Order or = new PayService().selectOrder(userNo);
		int result2 = new PayService().deleteCart(userNo,productNo);
		
		
		if(result>0) {
			
			request.setAttribute("or", or);
			request.setAttribute("list", list);
			request.setAttribute("o", o);
			request.getRequestDispatcher("/views/pay/payComplete.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "결제에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.ca");
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
