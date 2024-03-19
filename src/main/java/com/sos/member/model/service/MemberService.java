package com.sos.member.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import static com.sos.common.template.JDBCTemplate.*;
import com.sos.member.model.dao.MemberDao;
import com.sos.member.model.vo.Member;

public class MemberService {

	private MemberDao mDao = new MemberDao();
	
	// 로그인 요청시 실행될 메소드
	public Member loginMember(HashMap<String, String> loginInfo) {
		
		Connection conn = getConnection();
		Member loginUser = mDao.loginMember(conn, loginInfo);
		close(conn);
		return loginUser;
		
	}

	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = mDao.idCheck(conn, checkId);
		close(conn);
		
		return count;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result1 = mDao.insertMember(conn, m);
		int result2 = mDao.insertAddress(conn, m);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	public List<Member> findIdByEmail(Member m) {
		Connection conn = getConnection();
		List<Member> list = mDao.findIdByEmail(conn, m);
		close(conn);
		return list;
	}

	public String findPwdByEmail(Member m) {
		Connection conn = getConnection();
		String userPwd = mDao.findPwdByEmail(conn, m);
		close(conn);
		return userPwd;
	}
	
}
