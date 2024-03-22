package com.sos.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.sos.common.template.MyFileRenamePolicy;
import com.sos.manager.model.service.ManagerService;
import com.sos.product.model.vo.Product;

/**
 * Servlet implementation class EnrollProduct
 */
@WebServlet("/insertProduct.ma")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			HttpSession session = request.getSession();
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			MultipartRequest muliRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Product p = new Product();
			p.setCategoryNo(muliRequest.getParameter("categoryNo"));
			p.setProductName(muliRequest.getParameter("productName"));
			p.setPrice(Integer.parseInt(muliRequest.getParameter("price")));
			p.setDiscountPrice(Integer.parseInt(muliRequest.getParameter("discountPrice")));
			p.setInventory(muliRequest.getParameter("inventory"));
			
			p.setPath("resources/uploadFiles/" + muliRequest.getFilesystemName("productThumbnail"));
			p.setContentPath("resources/uploadFiles/" + muliRequest.getFilesystemName("productContent"));
			
			int result = new ManagerService().insertProduct(p);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "상품이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/productList.ma?page=1");
			} else {
				session.setAttribute("alertMsg", "상품이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/productList.ma?page=1");
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
