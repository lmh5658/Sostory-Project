package com.sos.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageDeleteQnaController
 */
@WebServlet("/deleteQna.me")
public class MyPageDeleteQnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageDeleteQnaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 마이페이지에서 사용자가 특정문의 삭제요청시 실행될 controller
		 * 
		 * case 01) 삭제요청 처리성공
		 *          응답페이지 : 1:1문의페이지 or 상품문의페이지
		 *          응답메세지(성공) : "문의가 삭제되었습니다."
		 *          
		 * case 02) 삭제요청 처리실패 (유효하지 않은 문의번호 등)
		 *          응답페이지 : 에러페이지
		 *          응답메세지 : "문의 삭제가 정상적으로 진행되지 않았습니다. 유효한 문의인지 확인해주세요."
		 * 
		*/
		
		// 삭제할 문의번호
		int answerNo = Integer.parseInt(request.getParameter("qNo"));
		
		// 문의삭제요청 및 처리결과
		int result = new MyPageService().deleteQna(answerNo);
		
		
		
		
		
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
