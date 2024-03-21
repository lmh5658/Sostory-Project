package com.sos.manager.model.service;

import java.sql.Connection;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model.dao.ManagerDao;
import com.sos.member.model.vo.Member;

import static com.sos.common.template.JDBCTemplate.*;

public class ManagerService {
	
	private ManagerDao mDao = new ManagerDao();

	public int selectCountList() {
		Connection conn = getConnection();
		int result = mDao.selectCountList(conn);
		close(conn);
		return result;
	}

	public List<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberList(conn, pi);
		close(conn);
		return list;
	}

	public int deleteMember(int[] userNo) {
		Connection conn = getConnection();
		int result = mDao.deleteMember(conn, userNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int selectCountSearchList(String keyword) {
		Connection conn = getConnection();
		int result = mDao.selectCountSearchList(conn, keyword);
		close(conn);
		return result;
	}
	
	public List<Member> selectMemberByKeyword(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberByKeyword(conn, keyword, pi);
		close(conn);
		return list;
	}


}
