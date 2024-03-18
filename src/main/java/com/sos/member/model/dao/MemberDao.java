package com.sos.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import static com.sos.common.template.JDBCTemplate.*;
import com.sos.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/mappers/member-mapper.xml").getPath()));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 로그인 요청시 실행될 메소드
	public Member loginMember(Connection conn, HashMap<String, String> loginInfo) {
		
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginInfo.get("userId"));
			pstmt.setString(2, loginInfo.get("userPwd"));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setUserNo(rset.getInt("user_no"));
				loginUser.setUserId(rset.getString("user_id"));
				loginUser.setUserPwd(rset.getString("user_pwd"));
				loginUser.setUserName(rset.getString("user_name"));
				loginUser.setBirthDate(rset.getString("birth_date"));
				loginUser.setNickName(rset.getString("nickname"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setAddressDetail(rset.getString("addressdetail"));
				loginUser.setGender(rset.getString("gender"));
				loginUser.setEnrollDate(rset.getString("enroll_date"));
				loginUser.setModifyDate(rset.getString("modify_date"));
				loginUser.setUserType(rset.getString("user_type"));
				loginUser.setUserPath(rset.getString("user_path"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
			
	}

	public int idCheck(Connection conn, String checkId) {
		int checkResult = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				checkResult = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return checkResult;
	}

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getBirthDate());
			pstmt.setString(5, m.getNickName());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getAddress());
			pstmt.setString(9, m.getAddressDetail());
			if(m.getGender().equals("no_gender")) {
				pstmt.setString(10, "X");
			} else {
				pstmt.setString(10, m.getGender());	
			}
			pstmt.setString(11, "resources/images/user.png");
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
