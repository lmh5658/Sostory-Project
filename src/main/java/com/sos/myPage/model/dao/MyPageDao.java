package com.sos.myPage.model.dao;

import static com.sos.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import com.sos.member.model.vo.Member;

public class MyPageDao {
	
	Properties prop = new Properties();
	
	public MyPageDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(MyPageDao.class.getResource("/db/mappers/myPage-mapper.xml").getPath()));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 마이페이지에서 사용자가 비밀번호변경 요청을 했을 경우 실행될 메소드
	 * 
	 * @param conn
	 * @param mem : 사용자의 수정비밀번호, 회원번호, 기존비밀번호 정보가 담긴객체
	 * @return : 비밀번호 수정요청 처리결과 행 수
	 */
	public int updateMemberPwd(Connection conn, HashMap<String, Object> mem) {
		System.out.println(mem.get("userNo"));
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMemberPwd");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)mem.get("newPwd"));
			pstmt.setInt(2, Integer.parseInt(String.valueOf(mem.get("userNo"))));
			pstmt.setString(3, (String)mem.get("oldPwd"));
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 회원정보 변경요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param mem : 수정할 회원정보가 담긴 회원객체
	 * @return : 회원정보 수정 처리결과 행 수
	 */
	public int updateMemberInfo(Connection conn, Member mem) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMemberInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getNickName());
			pstmt.setString(2, mem.getPhone());
			pstmt.setString(3, mem.getGender());
			pstmt.setString(4, mem.getBirthDate());
			pstmt.setString(5, mem.getUserPath());
			pstmt.setInt(6, mem.getUserNo());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	

}
