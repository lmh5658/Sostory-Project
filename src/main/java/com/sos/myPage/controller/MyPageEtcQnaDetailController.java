package com.sos.myPage.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.myPage.model.service.MyPageService;
import com.sos.product.model.vo.AttachmentProduct;
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class MyPageEtcQnaDetailController
 */
@WebServlet("/detailQna.me")
public class MyPageEtcQnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageEtcQnaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 사용자가 마이페이지에서 1:1문의 상세조회 요청시 실행될 controller
		 * 
		 * case 01) 로그인한 사용자가 정상적인 경로(마이페이지)로 마이페이지 1:1문의 상세조회 요청시
		 *          case 01-1) 조회된 문의글이 있을경우
		 *                     응답화면 : 1:1문의상세페이지 (포워딩)
		 *                     응답데이터 : 상세조회된 1:1문의정보
		 *                     
		 *          case 01-2) 조회된 문의글이 없을경우
		 *                     응답화면 : 1:1문의 목록페이지 (리다이렉트)
		 *                     응답데이터 : "유효하지 않은 문의이거나 조회된 문의정보가 없습니다."
		 *          
		 * case 02) 로그인을 하지않은 사용자가 비정상적인 경로(URL 공격 등)로 마이페이지 1:1문의 상세조회 요청시
		 *           응답화면 : 로그인페이지 (리다이렉트)
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			
			String answerNo = request.getParameter("qNo");	// 조회할 문의번호
			
			HashMap<String, Object> info = new MyPageService().selectQna(answerNo);
			Qna q = (Qna)info.get("qna");
			AttachmentProduct ap = (AttachmentProduct)info.get("file");
			
			if(q == null) { // 조회된 문의글이 없을경우
				request.getSession().setAttribute("alertMsg", "유효하지 않은 문의이거나 조회된 문의정보가 없습니다.");
				response.sendRedirect(request.getContextPath() + "/qna.me?type=2&page=1");
			}else { // 조회된 문의글이 있을경우
				request.setAttribute("qna", q);
				request.setAttribute("file", ap);
				
				request.getRequestDispatcher("/views/myPage/myPageEtcQnaDetail.jsp").forward(request, response);
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
