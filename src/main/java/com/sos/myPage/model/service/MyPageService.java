package com.sos.myPage.model.service;

import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;

import com.sos.member.model.dao.MemberDao;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.dao.MyPageDao;

public class MyPageService {

	private MyPageDao mpDao = new MyPageDao();
	
	/**
	 * 마이페이지에서 사용자가 비밀번호변경 요청을 했을 경우 실행될 메소드
	 * 
	 * @param mem : 사용자의 수정비밀번호, 회원번호, 기존비밀번호 정보가 담긴객체
	 * @return : 비밀번호 수정요청 처리결과 행 수
	 */
	public int updateMemberPwd(HashMap<String, Object> mem) {
		
		Connection conn = getConnection();
		
		int result = mpDao.updateMemberPwd(conn, mem);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
		
	}
	
	/**
	 * 마이페이지에서 사용자가 회원정보 변경요청시 실행될 메소드
	 * 
	 * @param mem : 수정할 회원정보가 담긴 회원객체
	 * @return : 회원정보 변경요청 처리결과 행 수
	 */
	public int updateMemberInfo(Member mem) {
		
		Connection conn = getConnection();
		
		int result = mpDao.updateMemberInfo(conn, mem);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
}
