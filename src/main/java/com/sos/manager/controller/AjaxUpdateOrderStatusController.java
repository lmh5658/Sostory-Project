package com.sos.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.cart.model.vo.Order;
import com.sos.manager.model.service.ManagerService;

/**
 * Servlet implementation class AjaxUpdateOrderStatusController
 */
@WebServlet("/updateOrderStatus.ma")
public class AjaxUpdateOrderStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateOrderStatusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Order o = new Order();
		o.setOrderStatus(request.getParameter("orderStatus"));
		o.setOrderNo(Integer.parseInt(request.getParameter("orderNo")));
		
		int result = new ManagerService().updateOrderStatus(o);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
