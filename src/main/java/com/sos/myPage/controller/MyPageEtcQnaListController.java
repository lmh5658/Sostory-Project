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
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class MyPageEtcQnaListController
 */
@WebServlet("/qna.me")
public class MyPageEtcQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageEtcQnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 1:1문의 목록조회 요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 1:1문의목록페이지 요청시
		 *          응답페이지 : 로그인폼페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 * 
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지)로 1:1문의목록페이지 요청시
		 *          응답페이지 : 1:1문의목록페이지
		 *          응답데이터 : 조회된 1:1문의목록
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {

			/* 상태별 1:1문의목록페이지 페이징정보
			 * 
			 * case 01) null == 전체1:1문의 	(처리 + 미처리)
			 * case 02)   on == 미처리 1:1문의
			 * case 02)  off ==  처리 1:1문의
			 * 
			 */
			String status = request.getParameter("status");
			
			// 총문의수 조회요청을 위한 값담기
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			
			Qna q = new Qna();								// 총문의수 조회요청시 전달할 문의정보객체
			q.setAnswerType(request.getParameter("type"));	// 문의유형 (2 == 1:1문의 | 1 == 상품문의)
			q.setUserNo(String.valueOf(userNo));			// 조회요청 사용자번호
			
			// 답변상태별(처리 | 미처리) 문의조회 요청시
			if(status != null) {
				if(status.equals("on")){
					 q.setAnswerStatus("미처리");
				}else if(status.equals("off")) {
					q.setAnswerStatus("처리");
				}
			}
			
			// 페이징바 정보
			int total = new MyPageService().totalQna(q);
			int currentPage = Integer.parseInt(request.getParameter("page"));
			int pageLimit = 10;
			int qnaLimit = 10;
			int maxPage = (int)Math.ceil((double)total / qnaLimit);
			int startPage = (currentPage/pageLimit) + 1;
			int lastPage = startPage + (pageLimit - 1);
			if(lastPage > maxPage) {
				lastPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(total, currentPage, pageLimit, qnaLimit, maxPage, startPage, lastPage);

			// 1:1문의 목록조회에 필요한 정보를 담을 객체 (회원번호, 페이징객체)
			HashMap<String, Object> info = new HashMap<>();
			info.put("pageInfo", pi);
			info.put("qna", q);
			
			// 1:1문의목록 조회요청 결과리스트
			List<Qna> list = new MyPageService().selectQnaList(info);
			
			request.setAttribute("qnaList", list);
			request.setAttribute("pageInfo", pi);
			
			/* 문의유형별 응답화면
			 * 
			 * case 01) 1:1문의 목록페이지 : views/myPage/myPageEtcQnaList.jsp
			 * case 02) 상품문의 목록페이지 : 
			 * 
			 */
			if(Integer.parseInt(q.getAnswerType()) == 2) { // 1:1문의
				request.getRequestDispatcher("/views/myPage/myPageEtcQnaList.jsp").forward(request, response);				
			}else{ // 상품문의
				
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
