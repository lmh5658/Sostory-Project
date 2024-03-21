package com.sos.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.manager.model.service.ManagerService;

/**
 * Servlet implementation class DeleteProductController
 */
@WebServlet("/deleteProduct.ma")
public class DeleteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] strProductNo = request.getParameterValues("productNo");
		int[] productNo = new int[strProductNo.length];
		for(int i=0; i<strProductNo.length; i++) {
			productNo[i] = Integer.parseInt(strProductNo[i]);
		}
		strProductNo = null;
		
		int result = new ManagerService().deleteProduct(productNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", productNo.length + "개의 상품이 비활성화 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memberList.ma?page=1");
		} else {
			request.getSession().setAttribute("alertMsg", "상품삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/memberList.ma?page=1");
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
