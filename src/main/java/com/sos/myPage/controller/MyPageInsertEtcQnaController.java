package com.sos.myPage.controller;

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
import com.sos.myPage.model.service.MyPageService;
import com.sos.product.model.vo.AttachmentProduct;
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class MyPageInsertEtcQnaController
 */
@WebServlet("/insertEq.me")
public class MyPageInsertEtcQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageInsertEtcQnaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 마이페이지에서 사용자가 1:1문의글 작성등록 요청시 실행될 controller
		 * 
		 * case 01) 첨부파일이 있는 1:1문의글 등록요청
		 *          (1) INSERT 첨부파일
		 *          (2) INSERT 1:1문의글
		 *          
		 * case 02) 첨부파일이 없는 1:1문의글 등록요청
		 *          (1) INSERT 1:1문의글
		 * 
		 * 응답화면 : 마이페이지 1:1문의목록페이지 (1페이지)
		 * 응답메세지(성공) : "문의 등록이 완료되었습니다."
		 * 응답메세지(실패) : "문의가 정상적으로 등록되지 않았습니다. 다시 시도해주세요."
		 * 
		 */
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			
			int maxSize = 10 * 1024 * 1024; 	// 파일용량제한 : 10Mbyte
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 등록할 문의글정보를 담을 문의객체
			Qna q = new Qna();
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			q.setUserNo(String.valueOf(userNo));
			q.setAnswerTitle(multiRequest.getParameter("answerTitle"));
			q.setAnswerContent(multiRequest.getParameter("answerContent"));
			
			// 등록할 문의글 첨부파일 유무조회
			AttachmentProduct ap = null;
			if(multiRequest.getOriginalFileName("uploadFile") != null) {
				ap = new AttachmentProduct();
				ap.setFileName(multiRequest.getOriginalFileName("uploadFile"));
				ap.setFileChangeName(multiRequest.getFilesystemName("uploadFile"));
				ap.setFileRoute("resources/uploadFiles/");
			}
			
			// 문의글 등록요청
			int result = new MyPageService().insertQna(q, ap);
			
			// 처리결과에 따른 응답메세지
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "문의 등록이 완료되었습니다.");
			}else {
				request.getSession().setAttribute("alertMsg", "문의가 정상적으로 등록되지 않았습니다. 다시 시도해주세요.");
				
				new File(savePath + ap.getFileChangeName()).delete();
			}
			
			// 응답화면 : 마이페이지 1:1문의목록페이지
			response.sendRedirect(request.getContextPath() + "/qna.me?type=2&page=1");
			
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
