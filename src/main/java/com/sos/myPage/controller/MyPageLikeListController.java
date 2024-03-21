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
import com.sos.myPage.model.vo.Liked;

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
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			MyPageService mpService = new MyPageService();

			HashMap<String, Object> info = new HashMap<>();		// 데이터 전달목적의 객체
			// 찜목록 조회요청 회원번호
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			
			// 찜목록 유형(상품 == "p" | 레시피 == "r")
			String type = request.getParameter("type");
			
			info.put("type", type);
			info.put("userNo", userNo);
			
			// 페이징바 정보
			int total = mpService.selectTotalLiked(info);
			int currentPage = Integer.parseInt(request.getParameter("page"));
			int pageLimit = 5;
			int boardLimit = 12;
			int maxPage = (int)Math.ceil((double)total/boardLimit);
			int startPage = (currentPage - 1) / pageLimit + 1;
			int endPage = startPage + (pageLimit - 1);
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(total, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			
			// 리스트 조회요청
			info.put("pageInfo", pi);
			List<Liked> list = mpService.selectLikedList(info);
			
			// 조회결과별 응답화면 및 응답데이터(실패메세지)
			request.setAttribute("pageInfo", pi);	// 페이징바 객체는 공통적으로 반환
			
			if(list == null) { // 조회결과 없을경우
				
				if(type.equals("p")) {
					// case 01) 찜상품 목록조회 요청시
					request.getSession().setAttribute("alertMsg", "찜한 상품내역이 없습니다.");
				}else {
					// case 02) 찜레시피 목록조회 요청시
					request.getSession().setAttribute("alertMsg", "찜한 레시피내역이 없습니다.");				}

				
			}else { // 조회결과 있을경우
				
				request.setAttribute("list", list);
				
				if(type.equals("p")) {
					// case 01) 찜상품 목록조회 요청시 ==> 찜상품 목록페이지반환
					request.getRequestDispatcher("/views/myPage/myPageLikedProductList.jsp").forward(request, response);
				}else {
					// case 02) 찜레시피 목록조회 요청시 ==> 찜레시피 목록페이지반환
					request.getRequestDispatcher("/views/myPage/myPageLikedRecipeList.jsp").forward(request, response);
				}
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
