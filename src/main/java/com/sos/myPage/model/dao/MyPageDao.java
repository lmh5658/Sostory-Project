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

import com.sos.cart.model.vo.Order;
import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.myPage.model.vo.Address;
import com.sos.myPage.model.vo.Liked;
import com.sos.product.model.vo.AttachmentProduct;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.Qna;
import com.sos.recipe.model.vo.Recipe;

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
	 * 마이페이지에서 사용자가 회원탈퇴 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param userNo : 탈퇴할 회원번호
	 * @return : 회원탈퇴(USER_STATUS = 'N') 요청처리 결과 행 수
	 */
	public int deleteMember(Connection conn, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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
	
	/**
	 * 사용자가 마이페이지에서 배송지 삭제요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param addressNo : 삭제할 배송지번호
	 * @return : 배송지 삭제요청 처리결과 행 수
	 */
	public int deleteAddress(Connection conn, int addressNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, addressNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 사용자가 지정한 상품 or 1:1문의 총문의수 조회요청시 실행될 메소드
	 * 
	 * case 01) 1:1문의 총문의수 조회요청 ==> ANSWER_TYPE = "2"
	 *          case 01-1)  전체 1:1문의수 조회 ==> ANSWER_STATUS = "전체"
	 *          case 01-2) 처리된 1:1문의수 조회 ==> ANSWER_STATUS = "처리"
	 *          case 01-3) 미처리 1:1문의수 조회 ==> ANSWER_STATUS = "미처리"
	 *          
	 * case 02) 상품문의 총문의수 조회요청 : ANSWER_TYPE ="1"
	 *          case 02-1)  전체 상품문의수 조회 ==> ANSWER_STATUS = "전체"
	 *          case 02-2) 처리된 상품문의수 조회 ==> ANSWER_STATUS = "처리"
	 *          case 02-3) 미처리 상품문의수 조회 ==> ANSWER_STATUS = "미처리"
	 * 
	 * @param conn
	 * @param q : 문의유형(상품 | 1:1), 문의진행상태(처리 | 미처리), 회원번호 정보가담긴 문의객체
	 * @return : 조회된 해당조건의 총문의수
	 */
	public int totalQna(Connection conn, Qna q) {
		
		int total = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("totalQna");
		
		/* 
		 * case 01)  null : 전체총문의수 (처리 + 미처리)
		 * case 02)  "처리" : 처리상태의 총문의수
		 * case 02) "미처리" : 미처리상태의 총문의수
		 * 
		 */
		String status = q.getAnswerStatus();
		
		if(!status.equals("전체")) { sql += " AND ANSWER_STATUS = ?"; }
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getAnswerType());
			pstmt.setString(2, q.getUserNo());
			
			if(!status.equals("전체")) { pstmt.setString(3, status); }
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				total = rset.getInt("total");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return total;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 1:1문의 or 상품문의 전체목록페이지 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param info : 페이징바객체(페이징정보), 문의객체(회원번호, 문의유형) 정보가 담긴 객체
	 * @return : 조회된 문의객체 리스트
	 */
	public List<Qna> selectAllQnaList(Connection conn, HashMap<String, Object> info){

		List<Qna> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllQnaList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			Qna qa = (Qna)info.get("qna");
			pstmt.setString(1, qa.getUserNo());
			pstmt.setString(2, qa.getAnswerType());
			
			PageInfo pi = (PageInfo)info.get("pageInfo");
			int lastNo = pi.getCurrentPage() * pi.getBoardLimit();
			int firstNo = lastNo - (pi.getBoardLimit() - 1);
			
			pstmt.setInt(3, firstNo);
			pstmt.setInt(4, lastNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Qna q = new Qna();
				
				q.setAnswerNo(rset.getInt("answer_no"));
				q.setProductNo(String.valueOf(rset.getInt("product_no")));
				q.setProductName(rset.getString("product_name"));
				q.setAnswerDate(rset.getString("answer_date"));
				q.setAnswerTitle(rset.getString("answer_title"));
				q.setAnswerStatus(rset.getString("answer_status"));
				
				list.add(q);
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
	 * 마이페이지에서 사용자가 답변상태별 1:1문의 or 상품문의 목록페이지 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param info : 페이징바객체(페이징정보), 문의객체(회원번호, 문의유형, 문의상태) 정보가 담긴 객체
	 * @return : 조회된 문의객체 리스트
	 */
	public List<Qna> selectQnaList(Connection conn, HashMap<String, Object> info){
		
		List<Qna> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnaList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			Qna qa = (Qna)info.get("qna");
			pstmt.setString(1, qa.getUserNo());
			pstmt.setString(2, qa.getAnswerType());
			pstmt.setString(3, qa.getAnswerStatus());
			
			PageInfo pi = (PageInfo)info.get("pageInfo");
			int lastNo = pi.getCurrentPage() * pi.getBoardLimit();
			int firstNo = lastNo - (pi.getBoardLimit() - 1);
			
			pstmt.setInt(4, firstNo);
			pstmt.setInt(5, lastNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Qna q = new Qna();
				
				q.setAnswerNo(rset.getInt("answer_no"));
				q.setProductNo(String.valueOf(rset.getInt("product_no")));
				q.setProductName(rset.getString("product_name"));
				q.setAnswerDate(rset.getString("answer_date"));
				q.setAnswerTitle(rset.getString("answer_title"));
				q.setAnswerStatus(rset.getString("answer_status"));
				
				list.add(q);
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
	 * 마이페이지에서 사용자가 특정 1:1문의 상세조회 요청시 문의정보 조회 메소드
	 * 
	 * @param conn
	 * @param answerNo : 조회할 1:1문의번호
	 * @return : 조회된 문의정보를 담은 문의객체
	 */
	public Qna selectQna(Connection conn, String answerNo) {
		
		Qna q = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answerNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna();
				q.setAnswerNo(rset.getInt("answer_no"));
				q.setAnswerTitle(rset.getString("answer_title"));
				q.setAnswerContent(rset.getString("answer_content"));
				q.setAnswerDate(rset.getString("answer_date"));
				q.setReply(rset.getString("reply"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 요청한 1:1문의글의 첨부파일이 있을경우 첨부파일 정보조회 메소드
	 * 
	 * @param conn
	 * @param answerNo : 조회할 첨부파일의 참조게시글 번호
	 * @return : 조회된 첨부파일 정보를 담은 첨부파일객체
	 */
	public AttachmentProduct selectAttachment(Connection conn, String answerNo) {
	
		AttachmentProduct ap = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answerNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ap = new AttachmentProduct();
				ap.setProFileNo(rset.getInt("pro_file_no"));
				ap.setFileName(rset.getString("file_name"));
				ap.setFileUrl(rset.getString("file_url"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return ap;
		
	}

	/**
	 * 마이페이지에서 사용자가 1:1문의 등록요청시 문의글 등록요청 메소드
	 * 
	 * @param conn
	 * @param q : 등록할 문의글 정보가 담긴 문의객체
	 * @return : 문의글 등록처리 결과행 수
	 */
	public int insertQna(Connection conn, Qna q) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getUserNo());
			pstmt.setString(2, q.getAnswerTitle());
			pstmt.setString(3, q.getAnswerContent());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		

		return result;
		
	}
	
	/**
	 * 사용자가 마이페이지에서 1:1문의 등록시 첨부파일 있을경우 첨부파일 등록요청시 실행될 메소드
	 * 
	 * @param con
	 * @param ap : 등록할 첨부파일 정보가 담긴 첨부파일객체
	 * @return : 첨부파일 등록요청 처리결과 행 수
	 */
	public int insertAttachment(Connection conn, AttachmentProduct ap) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ap.getFileName());
			pstmt.setString(2, ap.getFileChangeName());
			pstmt.setString(3, ap.getFileRoute());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
		
	}
	
	/**
	 * 사용자가 마이페이지에서 문의삭제 요청시 문의글의 첨부파일 유무확인시 실행될 메소드
	 * 
	 * @param conn
	 * @param answerNo : 첨부파일이 참조하는 문의글번호
	 * @return : 삭제할 첨부파일 수정명파일명 (문자열 | null)
	 */
	public String attachmentYn(Connection conn, int answerNo) {
		
		String file = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("attachmentYn");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, answerNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				file = rset.getString("file_changename");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return file;
		
	}
	
	/**
	 * 사용자가 마이페이지에서 문의삭제 요청시 해당문의 첨부파일이 있을경우 실행될 메소드
	 * 
	 * @param conn
	 * @param answerNo : 삭제할 첨부파일의 참조글번호
	 * @return : 첨부파일삭제 요청처리 결과행 수
	 */
	public int deleteAttachment(Connection conn, int answerNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, answerNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 사용자가 마이페이지에서 문의삭제 요청시 문의글삭제 요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param answerNo : 삭제할 문의번호
	 * @return : 해당번호 문의삭제 요청처리 결과행 수
	 */
	public int deleteQna(Connection conn, int answerNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, answerNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 사용자가 찜목록 조회요청시 찜한상품 or 찜한레시피 갯수조회시 실행될 메소드
	 * 
	 * @param info : 찜유형(상품|레시피), 서비스요청 회원번호 정보가 담긴 객체
	 * case 01) 찜한상품 갯수조회
	 *            "type" == "p"
	 *          "userNo" == xx
	 * 
	 * case 02) 찜한레시피 갯수조회
	 *            "type" == "r"
	 *          "userNo" == xx
	 * 
	 * @param conn
	 * @return : 조회된 찜한상품 or 찜한레시피 총수
	 */
	public int selectTotalLiked(Connection conn, HashMap<String, Object> info) {
		
		int total = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;	// 찜유형별 다른쿼리
		
		if(info.get("type").toString().equals("p")) {
			// 찜유형 == "p" : 찜상품 갯수 조회쿼리
			sql = prop.getProperty("selectTotalLikedProduct");
		}else { 
			// 찜유형 == "r" : 찜레시피 갯수 조회쿼리
			sql = prop.getProperty("selectTotalLikedRecipe");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(info.get("userNo").toString()));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				total = rset.getInt("total");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return total;
	}
	
	/**
	 * 사용자가 마이페이지에서 찜목록 조회요청시 찜한상품 or 찜한레시피 목록조회 요청시 실행될 메소드
	 * 
	 * @param info : 찜유형(상품|레시피), 서비스요청 회원번호, 페이징바 정보가 담긴 객체
	 * case 01) 찜한상품 갯수조회
	 *              "type" == "p"
	 *            "userNo" == xx
	 *          "pageInfo" == pi
	 * 
	 * case 02) 찜한레시피 갯수조회
	 *              "type" == "r"
	 *            "userNo" == xx
	 *          "pageInfo" == pi
	 * 
	 * @param conn
	 * @return : 조회된 찜한상품 or 찜한레시피 찜객체 리스트
	 */
	public List<Liked> selectLikedList(Connection conn, HashMap<String, Object> info) {
		
		List<Liked> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null; 	// 찜유형별 다른쿼리
		
		String type = info.get("type").toString();	// 찜유형
		
		if(type.equals("p")) {
			// case 01) 찜유형 == "p" : 찜상품 목록 조회쿼리
			sql = prop.getProperty("selectLikedProductList");
		}else { 
			// case 02) 찜유형 == "r" : 찜레시피 목록 조회쿼리
			sql = prop.getProperty("selectLikedRecipeList");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(info.get("userNo").toString()));
			
			PageInfo pi = (PageInfo)info.get("pageInfo");
			int endNo = pi.getCurrentPage() * pi.getBoardLimit();
			int startNo = endNo - (pi.getBoardLimit() - 1);
			
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Liked li = new Liked();
				
				if(type.equals("p")) {
					// case 01) 찜유형 == "p" : 찜상품 목록
					li.setLikedNo(rset.getInt("like_no"));
					li.setProductNo(rset.getInt("product_no"));
					li.setCategoryName(rset.getString("category_name"));
					li.setProductName(rset.getString("product_name"));
					li.setPrice(rset.getInt("price"));
					li.setDiscountPrice(rset.getInt("discount_price"));
					li.setProductThumbnailUrl(rset.getString("product_url"));
				}else {
					// case 01) 찜유형 == "r" : 찜레시피 목록
					li.setLikedNo(rset.getInt("like_no"));
					li.setRecipeNo(rset.getInt("recipe_no"));
					li.setCategoryName(rset.getString("category_name"));
					li.setRecipeWriter(rset.getString("user_id"));
					li.setUserProfileUrl(rset.getString("user_profile_url"));
					li.setRecipeTitle(rset.getString("recipe_title"));
					li.setRecipeIntro(rset.getString("recipe_intro"));
					li.setRecipeThumbnailUrl(rset.getString("thumbnail_url"));
					li.setLikedTotal(rset.getInt("liked_total"));
					li.setProductNo(rset.getInt("product_no"));
					li.setProductName(rset.getString("product_name"));
					li.setPrice(rset.getInt("price"));
					li.setDiscountPrice(rset.getInt("discount_price"));
					li.setRating(rset.getDouble("rating"));
					li.setProductThumbnailUrl(rset.getString("product_url"));
				}
				
				list.add(li);
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
	 * 사용자의 총주문 횟수조회시 실행될 메소드
	 * 
	 * @param conn
	 * @param info : 쿼리실행시 필요한 데이터가 담긴객체 (회원번호, 조회시작날짜, 조회끝날짜)                  
	 * @return : 조회된 해당회원의 총주문 횟수
	 */
	public int totalOrders(Connection conn, HashMap<String, Object> info) {
		
		int total = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("totalOrders");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.get("userNo").toString());
			pstmt.setString(2, info.get("from").toString());
			pstmt.setString(3, info.get("to").toString());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				total = rset.getInt("total");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return total;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 주문목록 조회요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param info : 회원번호, 조회시작날짜, 조회마지막날짜, 페이징객체 데이터가 담긴객체
	 * @return : 조회된 해당사용자의 주문객체 리스트
	 */
	public List<Order> selectOrderList(Connection conn, HashMap<String, Object> info){
		
		List<Order> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.get("userNo").toString());
			pstmt.setString(2, info.get("from").toString());
			pstmt.setString(3, info.get("to").toString());
			
			PageInfo pi = (PageInfo)info.get("pageInfo");
			int endNo = pi.getCurrentPage() * pi.getBoardLimit();
			int startNo = endNo - (pi.getBoardLimit() - 1);
			
			pstmt.setInt(4, startNo);
			pstmt.setInt(5, endNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order o = new Order();
				
				o.setOrderNo(rset.getInt("order_no"));
				o.setTitleProductName(rset.getString("title_product_name"));
				o.setTotalOrder(rset.getInt("total_order"));
				o.setOrderDate(rset.getString("order_date"));
				o.setOrderStatus(rset.getString("order_status"));
				
				list.add(o);
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
	 * 마이페이지에서 사용자가 주문내역 삭제요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param orderNo : 삭제할 주문 주문번호
	 * @return : 주문내역 삭제요청 처리결과 행 수
	 */
	public int deleteOrder(Connection conn, int orderNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 주문상세조회 요청시 주문정보 조회시 실행될 메소드
	 * 
	 * @param conn
	 * @param orderNo : 상세조회 요청한 주문번호
	 * @return : 조회된 주문상세정보를 담은 주문객체
	 */
	public Order selectOrderInfo(Connection conn, int orderNo) {
		
		Order od = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				od = new Order();
				
				od.setOrderNo(rset.getInt("order_no"));
				od.setOrderDate(rset.getString("order_date"));
				od.setAddressName(rset.getString("address_name"));
				od.setAddress(rset.getString("address"));
				od.setAddressDetail(rset.getString("adrress_detail"));
				od.setName(rset.getString("orderer"));
				od.setPhone(rset.getString("order_phone"));
				od.setPayMethod(rset.getString("pay_method"));
				od.setPayDate(rset.getString("pay_date"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return od;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 주문상세조회 요청시 주문상품 상세조회용 메소드
	 * 
	 * @param conn
	 * @param orderNo : 상세조회 요청한 주문번호
	 * @return : 조회된 주문상품 객체를 담은 리스트객체
	 */
	public List<Product> selectOrderProducts(Connection conn, int orderNo){
	
		List<Product> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderProducts");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setProductNo(rset.getInt("product_no"));
				p.setProductName(rset.getString("product_name"));
				p.setPrice(rset.getInt("price"));
				p.setDiscountPrice(rset.getInt("discount_price"));
				p.setRowNum(rset.getInt("order_product_amount"));
				p.setPath(rset.getString("path"));
				
				list.add(p);
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
	 * 마이페이지에서 사용자가 작성한레시피 총갯수 조회시 실행될 메소드
	 * 
	 * @param conn
	 * @param userNo : 서비스요청 회원번호
	 * @return : 조회된 총작성레시피수
	 */
	public int totalRecipe(Connection conn, int userNo) {
		
		int total = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("totalRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				total = rset.getInt("total");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return total;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 작성한 레시피목록 조회요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param info : 레시피목록조회시 필요한데이터가 담긴 객체(회원번호, 페이징바)
	 * @return : 조회된 레시피객체 리스트객체
	 */
	public List<Recipe> selectRecipeList(Connection conn, HashMap<String, Object> info){
		
		List<Recipe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int userNo = Integer.parseInt(info.get("userNo").toString());
			PageInfo pi = (PageInfo)info.get("pageInfo");
			
			int endNo = pi.getCurrentPage() * pi.getBoardLimit();
			int startNo = endNo - (pi.getBoardLimit() - 1);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Recipe r = new Recipe();
				
				r.setRecipeNo(rset.getInt("recipe_no"));
				r.setRecipeTitle(rset.getString("recipe_title"));
				r.setPostDate(rset.getDate("post_date"));
				r.setLikeCount(rset.getInt("total_liked"));
				r.setThumbnailUrl(rset.getString("thumbnail_url"));
				
				list.add(r);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * 마이페이지에서 사용자가 작성한레시피 삭제요청시 실행될 메소드
	 * 
	 * @param conn
	 * @param recipeNo : 삭제할 레시피번호
	 * @return : 레시피 삭제요청 처리결과 행 수
	 */
	public int deleteRecipe(Connection conn, int recipeNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
