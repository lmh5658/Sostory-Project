package com.sos.manager.model2.service2;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model2.dao2.ManagerDao2;
import com.sos.product.model.vo.AttachmentProduct;
import com.sos.product.model.vo.ProductQnaReply;

public class ManagerService2 {
	
	private ManagerDao2 mDao = new ManagerDao2();
	
	public List<ProductQnaReply> managerQnalist(PageInfo pi){
		Connection conn = getConnection();
		List<ProductQnaReply> list = mDao.managerQnalist(conn, pi);
		close(conn);
		return list;
		
	}
	
	public int managerQnalistCount() {
		Connection conn = getConnection();
		int count = mDao.managerQnalistCount(conn);
		close(conn);
		return count;
	}
	
	public List<ProductQnaReply> selectQnaList(String select, PageInfo pi){
		Connection conn = getConnection();
		List<ProductQnaReply> list = new ArrayList<>();
		if(select.equals("all")) {
			list = mDao.managerQnalist(conn, pi);			
		}else if(select.equals("processed")) {
			list = mDao.managerProQnalist(conn, pi);
		}else if(select.equals("unprocessed")) {
			list = mDao.managerUnproQnalist(conn, pi);
		}
		close(conn);
		return list;
	}
	
	public int managerProQnalistCount() {
		Connection conn = getConnection();
		int count = mDao.managerProQnalistCount(conn);
		close(conn);
		return count;
	}
	
	public int managerUnproQnalistCount() {
		Connection conn = getConnection();
		int count = mDao.managerUnproQnalistCount(conn);
		close(conn);
		return count;
	}
	
	public int deleteAnswerManager(int answerNo) {
		Connection conn = getConnection();
		int result = mDao.deleteAnswerManager(conn, answerNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int searchMemCount(String search) {
		Connection conn = getConnection();
		int count = mDao.searchMemCount(conn, search);
		close(conn);
		return count;
	}
	
	public List<ProductQnaReply> searchMemList(String search, PageInfo pi){
		Connection conn = getConnection();
		List<ProductQnaReply> list = mDao.searchMemList(conn, search, pi);
		close(conn);
		return list;
		
	}

	public int managerQnalistCountp() {
		Connection conn = getConnection();
		int count = mDao.managerQnalistCountp(conn);
		close(conn);
		return count;
	}

	public int managerProQnalistCountp() {
		Connection conn = getConnection();
		int count = mDao.managerProQnalistCountp(conn);
		close(conn);
		return count;
	}

	public int managerUnproQnalistCountp() {
		Connection conn = getConnection();
		int count = mDao.managerUnproQnalistCountp(conn);
		close(conn);
		return count;
	}
	
	public ProductQnaReply managerQnaReply(int answerNo) {
		Connection conn = getConnection();
		ProductQnaReply pq = mDao.managerQnaReply(conn, answerNo);
		close(conn);
		return pq;
	}
	
	public AttachmentProduct managerQnaReplyFile(int answerNo) {
		Connection conn = getConnection();
		AttachmentProduct ap = mDao.managerQnaReplyFile(conn, answerNo);
		close(conn);
		return ap;
		
	}
	
	public int insertQnaReply(int answerNo, String replyContent, int adminNo) {
		Connection conn = getConnection();
		int result = mDao.insertQnaReplyContent(conn, answerNo, replyContent, adminNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
		
	}
	
	
}
