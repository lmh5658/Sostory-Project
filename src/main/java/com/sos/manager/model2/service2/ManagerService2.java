package com.sos.manager.model2.service2;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.manager.model2.dao2.ManagerDao2;
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
	

}
