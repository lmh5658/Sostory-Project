package com.sos.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.myPage.model.service.MyPageService;

/**
 * Servlet implementation class AjaxMyPageDeleteRecipeController
 */
@WebServlet("/deleteRecipe.me")
public class AjaxMyPageDeleteRecipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMyPageDeleteRecipeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 사용자가 주문내역 주문취소 요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 레시피삭제 요청을 시도할경우
		 *          응답페이지 : 로그인폼페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지)로 레시피삭제 요청을 시도할경우
		 *          응답결과 : 레시피삭제요청 처리결과 행 수
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			// 삭제할 레시피번호
			int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
			
			// 레시피 삭제요청
			int result = new MyPageService().deleteRecipe(recipeNo);
			
			// 처리결과 반환
			response.getWriter().print(result);
			
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
