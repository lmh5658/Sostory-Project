package com.sos.myPage.model.dao;

import static com.sos.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.sos.member.model.vo.Member;
import com.sos.myPage.model.vo.Address;

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
	
	/**
	 * 마이페이지에서 사용자가 배송지관리페이지 요청시 실행될 메소드 (배송지리스트 조회)
	 * 
	 * @param conn
	 * @param userNo : 서비스요청 사용자 회원번호
	 * @return : 조회된 해당회원의 배송지객체 리스트 (null | 리스트)
	 */
	public List<Address> selectAddressList(Connection conn, int userNo){
		
		List<Address> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAddressList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Address addr = new Address();
				
				addr.setAddressNo(rset.getInt("address_no"));
				addr.setAddressLocal(rset.getString("address_local"));
				addr.setAddressName(rset.getString("address_name"));
				addr.setAddress(rset.getString("address"));
				addr.setAddressPhone(rset.getString("address_phone"));
				addr.setAddressType(rset.getString("address_type"));	// Y(기본배송지) | N(기타배송지)
				
				list.add(addr);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * 기존배송지 정보조회 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param addressNo : 조회할 배송지의 배송지번호
	 * @return : 조회된 배송지정보를 담은 배송지객체
	 */
	public Address selectAddress(Connection conn, int addressNo) {
		
		Address addr = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, addressNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				addr = new Address();
				addr.setAddressNo(rset.getInt("address_no"));
				addr.setAddressLocal(rset.getString("address_local"));
				addr.setAddressName(rset.getString("address_name"));
				addr.setAddressPhone(rset.getString("address_phone"));
				addr.setAddressAddress(rset.getString("address_address"));
				addr.setAddressDetail(rset.getString("address_detail"));
				addr.setAddressType(rset.getString("address_type"));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return addr;
	}
	
	/**
	 * @param conn
	 * @param userNo
	 * @return
	 */
	
	
	/**
	 * 해당회원의 정보가 새롭게 수정|등록 되었을 경우 회원정보 수정일 수정시 실행될 메소드
	 * 
	 * @param conn
	 * @param userNo : 수정일 정보를 수정할 회원번호
	 * @return : 회원정보 수정요청 처리결과 행 수
	 */
	public int updateMemberModifyDate(Connection conn, String userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMemberModifyDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 배송지등록 | 배송지수정 요청시 해당 사용자의 기본배송지 유무조회시 실행될 메소드
	 * 
	 * @param conn
	 * @param userNo : 배송지 추가 | 수정 요청 사용자의 회원번호
	 * @return : 조회된 해당사용자의 기본배송지 갯수
	 */
	public int selectDefaultAddress(Connection conn, int userNo) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDefaultAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				count = rset.getInt("count");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	/**
	 * 배송지등록 | 배송지수정시 새로운 배송지를 기본배송지로 지정할 경우 실행될 메소드 (기존 기본배송지 ADDRESS_TYPE = 'N')
	 * 
	 * @param conn
	 * @param userNo : 배송지등록 | 배송지수정 요청한 사용자의 회원번호
	 * @return : 배송지유형(ADDRESS_TYPE) 수정요청 처리결과 행 수
	 */
	public int updateAddressType(Connection conn, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAddressType");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 마이페이지에서 배송지관리페이지에서 배송지등록 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param addr : 등록할 배송지정보가 담긴 배송지객체
	 * @return : 신규 배송지등록 처리결과 행 수
	 */
	public int insertAddress(Connection conn, Address addr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addr.getAddressWriter());
			pstmt.setString(2, addr.getAddressLocal());
			pstmt.setString(3, addr.getAddressName());
			pstmt.setString(4, addr.getAddressAddress());
			pstmt.setString(5, addr.getAddressDetail());
			pstmt.setString(6, addr.getAddressPhone());
			pstmt.setString(7, addr.getAddressType());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	/**
	 * 마이페이지에서 사용자가 배송지수정 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param addr : 수정할 배송지정보가 담긴 배송지객체
	 * @return : 배송지수정 처리결과 행 수
	 */
	public int updateAddress(Connection conn, Address addr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addr.getAddressLocal());
			pstmt.setString(2, addr.getAddressName());
			pstmt.setString(3, addr.getAddressAddress());
			pstmt.setString(4, addr.getAddressDetail());
			pstmt.setString(5, addr.getAddressPhone());
			pstmt.setString(6, addr.getAddressType());
			pstmt.setInt(7, addr.getAddressNo());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	

}
