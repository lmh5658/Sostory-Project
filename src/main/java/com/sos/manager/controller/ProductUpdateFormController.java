package com.sos.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.sos.common.model.vo.Category;
import com.sos.common.template.MyFileRenamePolicy;
import com.sos.manager.model.service.ManagerService;
import com.sos.product.model.vo.Product;

/**
 * Servlet implementation class ProductUpdateFormController
 */
@WebServlet("/updateProductForm.ma")
public class ProductUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		Product p = new ManagerService().selectProduct(productNo);
		
		p.setProductNo(productNo);
		
		List<Category> list = new ManagerService().selectCategory();
		
		request.setAttribute("product", p);
		request.setAttribute("categoryList", list);
		request.getRequestDispatcher("/views/manager/productUpdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
