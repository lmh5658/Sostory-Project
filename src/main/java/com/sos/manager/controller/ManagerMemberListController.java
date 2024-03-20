package com.sos.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model.service.ManagerService;
import com.sos.member.model.vo.Member;

/**
 * Servlet implementation class ManagerMemberList
 */
@WebServlet("/memberList.ma")
public class ManagerMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리
		int listCount = new ManagerService().selectCountList();
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		int maxPage = (int)Math.ceil((listCount * 1.0) / boardLimit);
		int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {endPage = maxPage;}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 게시글 조회
		List<Member> list = new ManagerService().selectMemberList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/manager/memberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
