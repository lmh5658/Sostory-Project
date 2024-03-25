package com.sos.manager.model2.dao2;

import static com.sos.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sos.common.model.vo.PageInfo;
import com.sos.product.model.vo.ProductQnaReply;

public class ManagerDao2 {
	
	private Properties prop = new Properties();
	
	public ManagerDao2(){
		
		try {
			prop.loadFromXML(new FileInputStream(ManagerDao2.class.getResource("/db/mappers/manager2-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<ProductQnaReply> managerQnalist(Connection conn, PageInfo pi){
		List<ProductQnaReply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("managerQnalist");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ProductQnaReply pQna = new ProductQnaReply();
				pQna.setAnswerNo(rset.getInt("ANSWER_NO"));
				pQna.setProductNo(rset.getInt("PRODUCT_NO"));
				pQna.setUserNo(rset.getString("USER_ID"));
				pQna.setAnswerDate(rset.getString("ANSWER_DATE"));
				pQna.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				pQna.setAnswerStatus(rset.getString("ANSWER_STATUS"));
				list.add(pQna);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public int managerQnalistCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("managerQnalistCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	
	
	
	

}
