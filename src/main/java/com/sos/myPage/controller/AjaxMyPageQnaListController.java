package com.sos.myPage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;
import com.sos.product.model.vo.Qna;

/**
 * Servlet implementation class MyPageEtcQnaListController
 */
@WebServlet("/qna.me")
public class AjaxMyPageQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMyPageQnaListController() {
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
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지)로 문의목록페이지 요청시
		 * 			case 02-1) 1:1문의목록페이지 요청시
		 * 					   응답페이지 : 1:1문의목록페이지
		 *                     응답데이터 : JSONArray(HashMap : 조회된 1:1문의객체리스트, 페이징바객체)
		 *                     
		 * 			case 02-2) 상품문의목록페이지 요청시
		 *          	       응답페이지 : 상품문의목록페이지
		 *                     응답데이터 : JSONArray(HashMap : 조된된 상품문의객체리스트, 페이징바객체)
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {

			/* 상태별 1:1문의목록페이지 페이징정보
			 * 
			 * case 01) all == 전체1:1문의 	(처리 + 미처리)
			 * case 02)   on == 미처리 1:1문의
			 * case 02)  off ==  처리 1:1문의
			 * 
			 */
			
			// 총문의수 조회요청을 위한 값담기
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			
			Qna q = new Qna();								// 총문의수 조회요청시 전달할 문의정보객체
			q.setAnswerType(request.getParameter("type"));	// 문의유형 (2 == 1:1문의 | 1 == 상품문의)
			q.setUserNo(String.valueOf(userNo));			// 조회요청 사용자번호
			
			String status = request.getParameter("status"); // 답변상태별(처리 | 미처리) 문의조회 요청시
			
			if(status.equals("all")) {
				q.setAnswerStatus("전체");	
			}else if(status.equals("on")) {
				q.setAnswerStatus("미처리");
			}else if(status.equals("off")) {
				q.setAnswerStatus("처리");
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

			// 문의 목록조회에 필요한 정보를 담을 객체 (회원번호, 페이징객체)
			HashMap<String, Object> info = new HashMap<>();
			info.put("pageInfo", pi);
			info.put("qna", q);
			
			// 문의목록 조회요청 결과리스트
			List<Qna> list = new MyPageService().selectQnaList(info);

			/* 방법 1) 응답데이터들을 Ajax 통신용 응답데이터로 변환 및 담기 : JSON활용
			 * 
			 * (1) 조회된 Qna목록(List)
			 *     (1-1) Qna객체 --(JSONObject 객체화)--> jQna객체
			 *     (1-2) 여러 jQna객체 --(JSONArray 배열추가)--> jQnaList배열객체 == jQnaList[jQna, jQna, ...]
			 *     
			 * (2) 조회된 Qna목록에 대한 페이징바(PageInfo)객체
			 *     (2-1) PageInfo객체 --(JSONObject 객체화)--> jPageInfo객체
			 *     
			 * (3) jQnaList(문의리스트), jPageInfo(페이징바) 객체들을 한개의 결과객체로 담기
			 *     (3-1) jQnaList --(JSONArray 배열추가)--> jResult[jQnaList[jQna, jQna,...]]
			 *     (3-2) jPageInfo --(JSONArray 배열추가 =)--> jResult[jQnaList[], jPageInfo]
			 *     
			 */
			
			// (1) 조회된 Qna목록 JSONArray로 변환
			JSONArray jQnaList = new JSONArray();	// 조회된 Qna목록을 담을 JSONArray 객체
			
			if(list != null && !list.isEmpty()) {	// 리스트에 값이 있을경우
				
				for(Qna qa : list) {
					JSONObject jQna = new JSONObject();
					
					jQna.put("answerNo", qa.getAnswerNo());
					jQna.put("productNo", qa.getProductNo());
					jQna.put("productName", qa.getProductName());
					jQna.put("answerDate", qa.getAnswerDate());
					jQna.put("answerTitle", qa.getAnswerTitle());
					jQna.put("answerStatus", qa.getAnswerStatus());
					
					jQnaList.add(jQna);
					
				}
				
			}
			
			// (2) Qna목록에 대한 페이징바객체 JSONObject로 변환
			JSONObject jPageInfo = new JSONObject();
			
			jPageInfo.put("listCount", pi.getListCount());
			jPageInfo.put("currentPage", pi.getCurrentPage());
			jPageInfo.put("pageLimit", pi.getPageLimit());
			jPageInfo.put("boardLimit", pi.getBoardLimit());
			jPageInfo.put("maxPage", pi.getMaxPage());
			jPageInfo.put("startPage", pi.getStartPage());
			jPageInfo.put("endPage", pi.getEndPage());
			
			// (3) jQnaList(문의리스트), jPageInfo(페이징바) 단일결과객체화
			JSONArray jResult = new JSONArray();
			jResult.add(jQnaList);
			jResult.add(jPageInfo);
			
			// 응답데이터 전달
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(jResult);
			
			/* 방법 2) 응답데이터들을 Ajax 통신용 응답데이터로 변환 및 담기 : Gson
			 
			// 결과객체 정보를 담을 HashMap 객체 (문의리스트, 페이징바)
			HashMap result = new HashMap();
			if(list != null && !list.isEmpty()) {
				result.put("pageInfo", pi);
				result.put("list", list);
			}
			
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(result, response.getWriter());
			
			*/
			
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
