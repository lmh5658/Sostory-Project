package com.sos.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

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
		
		// 삭제할 문의번호, 문의유형
		int answerNo = Integer.parseInt(request.getParameter("qNo"));
		int answerType = Integer.parseInt(request.getParameter("type"));	// 문의유형 (1 == 상품문의 | 2 == 1:1문의)
				
		// 문의삭제요청 및 처리결과
		HashMap<String, Object> result = new MyPageService().deleteQna(answerNo);
		
		/* 문의유형(1:1문의 or 상품문의)별 응답화면 및 응답메세지
		 * 
		 * case 01) 삭제요청 처리성공시
		 *          응답메세지 : "문의가 삭제되었습니다."
		 *          
		 *          case 01-1) 1:1문의 삭제요청시
		 *                     응답화면(성공시) : 1:1문의목록페이지 (리다이렉트)
		 *          
		 *          case 01-2) 상품문의 삭제요청시
		 *                     응답화면(성공시) : 상품문의목록페이지 (리다이렉트)
		 *          
		 * case 02) 삭제요청 처리실패시         
		 *          응답페이지 : 에러페이지
		 *          응답메세지 : "문의 삭제가 정상적으로 진행되지 않았습니다. 유효한 문의인지 확인해주세요."
		 *   
		 */
		
		int delResult = Integer.parseInt(result.get("result").toString());
		String file = (String)result.get("file");
		
		if(delResult > 0) {
			// uploadFiles 파일삭제
			request.getSession().setAttribute("alertMsg", "문의가 삭제되었습니다.");
			
			//  첨부파일삭제
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			new File(savePath + file).delete();
			
			if(answerType == 1) { // 상품문의 삭제응답페이지
				
			}else{ // 1:1문의 삭제응답페이지
				response.sendRedirect(request.getContextPath() + "/qna.me?type=2&page=1");
			}
			
		}else {
			// 에러페이지
			// 에러메세지
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
