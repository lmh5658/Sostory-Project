package com.sos.myPage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.sos.common.template.MyFileRenamePolicy;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageUpdateMemberInfoController
 */
@WebServlet("/update.me")
public class MyPageUpdateMemberInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateMemberInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 서블릿 역할 : 마이페이지 회원정보변경 요청시 실행될 controller
		 * 
		 * 데이터 : 회원번호, 닉네임, 전화번호, 성별, 생년월일, [프로필파일URL]
		 * 요청서비스 : 회원정보 변경요청 (UPDATE)
		 */
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 사용자 프로필 URL 저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			// 프로필 첨부파일 제한용량 (10Mbyte)
			int maxSize = 10 * 1024 * 1024;
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 사용자로부터 입력받은 회원수정정보
			Member mem = new Member();
			mem.setUserNo(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
			mem.setNickName(multiRequest.getParameter("nickname"));
			mem.setPhone(multiRequest.getParameter("phone"));
			mem.setGender(multiRequest.getParameter("gender"));
			mem.setBirthDate(multiRequest.getParameter("birthDate"));
			
			System.out.println(mem);
			
			// 사용자가 업로드한 프로필 첨부파일이 있을경우 : 해당 프로필첨부파일 저장경로+수정파일명 저장
			if(multiRequest.getOriginalFileName("upProfile") != null) {
				mem.setUserPath("resources/uploadFiles/" + multiRequest.getFilesystemName("upProfile"));
			}else {
				// 사용자가 업로드한 프로필 첨부파일이 없을경우 : user.png이미지 첨부파일 저장경로+수정파일명 저장 (default)
				mem.setUserPath("resources/images/user.png");
			}
			
			// 회원정보 수정요청 및 결과반환
			int result = new MyPageService().updateMemberInfo(mem);
			
			/* 처리결과에 따른 응답화면
			 * case 01) 정보수정이 정상적으로 처리되었을경우
			 *          응답화면 ==> 마이페이지 메인페이지
			 *          응답메세지 : "정보수정이 완료되었습니다. 수정된 정보반영을 위해서는 로그아웃 후 재로그인을 진행해주셔야합니다."
			 *          
			 * case 02) 정보수정이 정상적으로 처리되지 않았을경우
			 *          응답화면 ==> 마이페이지 메인페이지
			 *          응답메세지 : "정보수정이 정상적으로 이루어지지 않았습니다. 다시 시도해주세요."
			 *          추가작업 : 미수정된 회원정보 객체의 프로필첨부파일 삭제
			 */
			if(result > 0){
				request.getSession().setAttribute("alertMsg", "정보수정이 완료되었습니다. 수정된 정보반영을 위해서는 로그아웃 후 재로그인을 진행해주셔야합니다.");
				response.sendRedirect(request.getContextPath() + "/myPage.me");
			}else{
				request.getSession().setAttribute("alertMsg", "정보수정이 정상적으로 이루어지지 않았습니다. 다시 시도해주세요.");
				response.sendRedirect(request.getContextPath() + "/myPage.me");
				
				// 미수정된 회원정보 객체의 프로필첨부파일 삭제
				new File(savePath + multiRequest.getFilesystemName("upProfile")).delete();
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
