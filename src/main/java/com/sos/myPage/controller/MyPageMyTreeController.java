package com.sos.myPage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;
import com.sos.recipe.model.vo.Recipe;

/**
 * Servlet implementation class MyPageMyTreeController
 */
@WebServlet("/recipe.me")
public class MyPageMyTreeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMyTreeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 사용자가 MyTree(내가 작성한 레시피) 목록페이지 요청시 실행될 controller
		 * 
		 * case 01) 사용자가 비정상적인 경로(URL 공격 등)로 MyTree목록페이지 요청시
		 *          응답페이지 : 로그인폼페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 *          
		 * case 02) 사용자가 정상적인 경로(마이페이지)로 MyTree목록페이지 요청시
		 *          응답페이지 : MyTree페이지 (요청한 페이지의)
		 *          응답데이터 : 페이징바객체, 조회된 레시피객체 리스트
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			
			// 서비스요청시 전달할 데이터를 담을 HashMap객체
			HashMap<String, Object> info = new HashMap<>();
			
			// 서비스요청 회원번호
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();	
			info.put("userNo", userNo);
			
			// 페이징바 정보
			int totalRecipe = new MyPageService().totalRecipe(userNo);
			int currentPage = Integer.parseInt(request.getParameter("page"));
			int pageLimit = 5;
			int listLimit = 5;
			int maxPage = (int)Math.ceil((double)totalRecipe/listLimit);
			int startPage = ((currentPage - 1) / pageLimit) + 1;
			int endPage = startPage + (pageLimit - 1);
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(totalRecipe, currentPage, pageLimit, listLimit, maxPage, startPage, endPage);
			info.put("pageInfo", pi);
			
			// 사용자가 작성한레시피목록 조회요청
			List<Recipe> list = new MyPageService().selectRecipeList(info);
			
			// 응답(반환)데이터
			request.setAttribute("recipeList", list);
			request.setAttribute("pageInfo", pi);
			
			// 응답페이지
			request.getRequestDispatcher("/views/myPage/myPageMyTree.jsp").forward(request, response);
			
			
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
