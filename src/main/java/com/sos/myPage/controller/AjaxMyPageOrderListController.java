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

import com.sos.cart.model.vo.Order;
import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;

/**
 * Servlet implementation class AjaxMyPageOrderListController
 */
@WebServlet("/order.me")
public class AjaxMyPageOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMyPageOrderListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 사용자가 주문목록페이지 요청시 실행될 controller
		 * 
		 * case 01) 미로그인 사용자가 비정상적인 경로(URL 공격 등)로 주문목록페이지 요청시
		 *          응답페이지 : 로그인폼페이지
		 *          응답메세지 : "로그인을 먼저 진행해주세요."
		 * 
		 * case 02) 로그인한 사용자가 정상적인 경로(마이페이지)로 주문목록페이지 요청시
		 * 		    응답페이지 : 주문목록페이지 (Ajax통신요청페이지)
		 *          응답데이터 : JSONArray(HashMap : 조회된 주문목록리스트객체(JSONArray[JSONObject{},...]), 페이징바객체(JSONObject))
		 * 
		 */
		
		if(request.getSession().getAttribute("loginUser") == null) {
			request.getSession().setAttribute("alertMsg", "로그인을 먼저 진행해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			
			// 로그인한 사용자번호 (주문목록페이지 요청한 사용자번호)
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			
			// 서비스 요청시 전달할 데이터를 담을객체
			HashMap<String, Object> info = new HashMap<>();
			info.put("userNo", userNo);
			info.put("from", request.getParameter("from"));		// 조회시작일
			info.put("to", request.getParameter("to"));			// 죄회마지막일
			
			// 페이징바
			int total = new MyPageService().totalOrders(info);
			int currentPage = Integer.parseInt(request.getParameter("page"));
			int pageLimit = 10;
			int listLimit = 10;
			int maxPage = (int)Math.ceil((double)total/listLimit);
			int startPage = ((currentPage - 1)/pageLimit) + 1;
			int endPage = startPage + (pageLimit - 1);
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(total, currentPage, pageLimit, listLimit, maxPage, startPage, endPage);
			
			info.put("pageInfo", pi);		// 주문목록 조회요청시 필요한 페이징객체 추가
			
			// 주문목록조회 요청
			List<Order> list = new MyPageService().selectOrderList(info);
			System.out.println(list);
			/* 방법 1) 응답데이터들을 Ajax 통신용 응답데이터로 변환 및 담기 : JSON활용
			 * 
			 * (1) 조회된 주문목록(List)
			 *     (1-1) Order객체 --(JSONObject 객체화)--> jOrder객체
			 *     (1-2) 여러 jOrder객체 --(JSONArray 배열추가)--> jOlist배열객체 == jQnaList[jOrder{}, jOrder{}, ..]
			 *     
			 * (2) 조회된 주문목록에 대한 페이징바(PageInfo)객체
			 *     (2-1) PageInfo객체 --(JSONObject 객체화)--> jPageInfo객체
			 *     
			 * (3) jOlist(주문목록), jPageInfo(페이징바) 객체들을 한개의 결과객체로 담기
			 *     (3-1) jOList --(JSONArray 배열추가)--> jResult[jQnaList[jQna, jQna,...]]
			 *     (3-2) jPageInfo --(JSONArray 배열추가 =)--> jResult[jQnaList[], jPageInfo]
			 *     
			 */
			
			// (1) 조회된 주문목록 JSONArray로 변환
			JSONArray jOlist = new JSONArray();
			
			if(!list.isEmpty()) {
				for(Order o : list) {
					JSONObject jOrder = new JSONObject();
					
					jOrder.put("orderNo", o.getOrderNo());
					jOrder.put("titleProductName", o.getTitleProductName());
					jOrder.put("totalOrder", o.getTotalOrder());
					jOrder.put("orderDate", o.getOrderDate());
					jOrder.put("orderStatus", o.getOrderStatus());
					
					jOlist.add(jOrder);
				}
			}
			
			// (2) 페이징바(PageInfo) JSONObject로 변환
			JSONObject jPageInfo = new JSONObject();
			jPageInfo.put("totalList", pi.getListCount());
			jPageInfo.put("currentPage", pi.getCurrentPage());
			jPageInfo.put("pageLimit", pi.getPageLimit());
			jPageInfo.put("listLimit", pi.getBoardLimit());
			jPageInfo.put("maxPage", pi.getMaxPage());
			jPageInfo.put("startPage", pi.getStartPage());
			jPageInfo.put("endPage", pi.getEndPage());
			
			// (3) jPageInfo객체, jOlist배열객체 하나의 JSONArray객체로 합치기
			JSONArray jResult = new JSONArray();
			jResult.add(jOlist);
			jResult.add(jPageInfo);
			System.out.println("가림 테스트 : " + jOlist);
			// 응답데이터 전달
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(jResult);
			
			
			
			/* 방법 2) 응답데이터들을 Ajax 통신용 응답데이터로 변환 및 담기 : Gson
			 
			// 결과객체 정보를 담을 HashMap 객체 (주문목록, 페이징바)
			HashMap result = new HashMap();
			if(!list.isEmpty()) {
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
