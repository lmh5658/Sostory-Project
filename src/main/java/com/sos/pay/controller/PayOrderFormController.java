package com.sos.pay.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		// 장바구니 목록리스트에 담긴 상품사진, 상품명, 상품가격, 상품수량 배열로조회
		String[] count = request.getParameterValues("changeCount"); // input 수량 증감버튼으로 바뀐 상품수량
		String[] name = request.getParameterValues("cartName");
		String[] price = request.getParameterValues("changePrice");
		String[] path = request.getParameterValues("cartImage");
		
		List<Pay> list = null;
		
		for(int i=0; i<count.length; i++) {
			
			Pay p = new Pay();
			p.setCount(count[i]);
			p.setProductName(name[i]);
			p.setPrice(price[i]);
			p.setPath(path[i]);
			
			list.add(p);
			
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/pay/payList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
