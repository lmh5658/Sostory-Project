package com.sos.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyPageLikeListController
 */
@WebServlet("/like.me")
public class MyPageLikeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageLikeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 마이페이지에서 사용자가 찜한상품 or 찜한레시피 목록페이지 요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 해당페이지 요청시
		 *          응답화면 : 로그인폼페이지 (리다이렉트)
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 * 
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지)로 해당페이지 요청시
		 *          case 02-1) 찜한상품 목록페이지를 요청했을 경우 (type=p)
		 *                     응답화면 : 찜한상품 목록페이지
		 *                     응답데이터 : 조회된 찜한상품 목록리스트			(성공시 : 조회결과 있을경우)
		 *                     응답메세지 : "찜한 상품이 존재하지 않습니다."	(실패시 : 조회결과 없을경우)
		 *                     
		 *          case 02-2) 찜한레시피 목록페이지를 요청했을 경우 (type=r)
		 *                     응답화면 : 찜한레시피 목록페이지
		 *                     응답데이터 : 조회된 찜한레시피 목록리스트		(성공시 : 조회결과 있을경우)
		 *                     응답메세지 : "찜한 레시피가 존재하지 않습니다." 	(실패시 : 조회결과 없을경우)
		 */
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
