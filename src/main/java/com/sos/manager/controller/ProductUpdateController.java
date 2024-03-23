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
 * Servlet implementation class ProductUpdateController
 */
@WebServlet("/updateProduct.ma")
public class ProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateController() {
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
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Product p = new Product();
			p.setProductNo(Integer.parseInt(multiRequest.getParameter("productNo")));
			p.setCategoryNo(multiRequest.getParameter("categoryNo"));
			p.setProductName(multiRequest.getParameter("productName"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("price")));
			p.setDiscountPrice(Integer.parseInt(multiRequest.getParameter("discountPrice")));
			p.setInventory(multiRequest.getParameter("inventory"));
			
			// 썸네일 이미지 첨부파일을 변경했을 경우
			if(multiRequest.getFilesystemName("productThumbnail") != null) {
				p.setPath("resources/uploadFiles/" + multiRequest.getFilesystemName("productThumbnail"));				
			}
			// 상세 이미지 청부파일을 번경했을 경우
			if(multiRequest.getFilesystemName("productContent") != null) {
				p.setContentPath("resources/uploadFiles/" + multiRequest.getFilesystemName("productContent"));				
			}
			
			int result = new ManagerService().updateProduct(p);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "상품정보가 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/productList.ma?page=1");
			} else {
				session.setAttribute("alertMsg", "상품정보 수정에 실패했습니다.");
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
