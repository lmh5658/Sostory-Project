package com.sos.myPage.model.service;

import static com.sos.common.template.JDBCTemplate.*;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import com.sos.member.model.vo.Member;
import com.sos.myPage.model.dao.MyPageDao;
import com.sos.myPage.model.vo.Address;

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
	
	/**
	 * 마이페이지에서 사용자가 배송지관리페이지 요청시 실행될 메소드 (배송지리스트 조회)
	 * 
	 * @param userNo : 서비스요청 사용자의 회원번호
	 * @return : 조회된 해당회원의 배송지객체 리스트 (null | 리스트)
	 */
	public List<Address> selectAddressList(int userNo){
		
		Connection conn = getConnection();
		
		List<Address> list = mpDao.selectAddressList(conn, userNo);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 기존배송지 정보조회 요청시 실행될 메소드
	 * 
	 * @param addressNo : 조회할 배송지의 배송지번호
	 * @return : 조회된 배송지정보를 담은 배송지객체
	 */
	public Address selectAddress(int addressNo) {
		
		Connection conn = getConnection();
		
		Address addr = mpDao.selectAddress(conn, addressNo);
		
		close(conn);
		
		return addr;
		
	}
	
	/**
	 * 배송지등록 | 배송지수정 요청시 해당 사용자의 기본배송지 유무조회시 실행될 메소드
	 * 
	 * @param conn
	 * @param userNo : 배송지 추가 | 수정 요청 사용자의 회원번호
	 * @return : 조회된 해당사용자의 기본배송지 갯수
	 */
	public int selectDefaultAddress(int userNo) {
		
		Connection conn = getConnection();
		
		int count = mpDao.selectDefaultAddress(conn, userNo);
		
		close(conn);
		
		return count;
		
	}
	
	/**
	 * 배송지등록 | 배송지수정시 새로운 배송지를 기본배송지로 지정할 경우 실행될 메소드 (기존 기본배송지 ADDRESS_TYPE = 'N')
	 * 
	 * @param conn
	 * @param userNo : 배송지등록 | 배송지수정 요청한 사용자의 회원번호
	 * @return : 배송지유형(ADDRESS_TYPE) 수정요청 처리결과 행 수
	 */
	public int updateAddressType(int userNo) {
		
		Connection conn = getConnection();
		
		int result = mpDao.updateAddressType(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 마이페이지에서 배송지관리페이지에서 배송지등록 요청시 실행될 메소드
	 * 
	 * @param addr : 등록할 배송지정보가 담긴 배송지객체
	 * @return : 신규 배송지등록 처리결과 행 수
	 */
	public int insertAddress(Address addr) {
		
		Connection conn = getConnection();
		
		int resultAddr = mpDao.insertAddress(conn, addr);	// 신규배송지 추가등록 처리결과
		
		int resultMem = 0;		// 회원정보 수정요청 처리결과를 담을 변수
		
		if(resultAddr > 0) {
			
			// 신규배송지 추가성공시 : 회원정보 수정일(MODIFY_DATE) 수정요청
			resultMem = mpDao.updateMemberModifyDate(conn, addr.getAddressWriter());
			
			if(resultMem > 0) { // 회원정보 수정일(MODIFY_DATE) 수정성공시
				commit(conn);				
			}
		}else {
			rollback(conn);
		}
		
		return resultAddr * resultMem;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 배송지수정 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param addr : 수정할 배송지정보가 담긴 배송지객체
	 * @return : 배송지수정 처리결과 행 수
	 */
	public int updateAddress(Address addr) {
		
		Connection conn = getConnection();
		
		int resultAddr = mpDao.updateAddress(conn, addr);	// 배송지 수정요청 처리결과
		
		int resultMem = 0;		// 회원정보 수정일(MODIFY_DATE) 수정요청 처리결과를 담을 변수
		
		if(resultAddr > 0) {
			
			// 배송지 수정성공시 : 회원정보 수정일(MODICY_DATE) 수정요청
			resultMem = mpDao.updateMemberModifyDate(conn, addr.getAddressWriter());
			
			if(resultMem > 0) { // 회원정보 수정일(MODIFY_DATE) 수정성공시
				commit(conn);				
			}
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return resultAddr * resultMem;
	}
	
}
