package com.sos.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.sos.common.template.MyFileRenamePolicy;
import com.sos.member.model.vo.Member;
import com.sos.product.model.service.ProductService;
import com.sos.product.model.vo.AttachmentProduct;

/**
 * Servlet implementation class ProductQnaInsertController
 */
@WebServlet("/minsert.pr")
public class ProductQnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductQnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int fileSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, fileSize, "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			int proNo = Integer.parseInt(multiRequest.getParameter("proNo"));
			System.out.println(content);
			System.out.println(title);

			AttachmentProduct ap = null;
			if(multiRequest.getOriginalFileName("upfiles") != null) {
				ap = new AttachmentProduct();
				ap.setFileName(multiRequest.getOriginalFileName("upfiles"));
				ap.setFileChangeName(multiRequest.getFilesystemName("upfiles"));
				ap.setFileRoute("resources/uploadFiles/");
			}
			
			int result = new ProductService().insertQna(title, content, userNo, proNo, ap);

			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "문의등록이 완료되었습니다.");	
			}else {
				if(ap != null) {
					new File(savePath + ap.getFileChangeName()).delete();
				}else {
					request.getSession().setAttribute("alertMsg", "문의등록을 실패하였습니다.");
				}
			}
			
			response.sendRedirect(request.getContextPath() + "/detail.pr?no="+ proNo);
			
			
			
			
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
