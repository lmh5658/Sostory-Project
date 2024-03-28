package com.sos.newProduct.model.dao;

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

import com.sos.cart.model.vo.Cart;
import com.sos.common.model.vo.PageInfo;
import com.sos.newProduct.model.vo.ProductNew;
import com.sos.product.model.dao.ProductDao;
import com.sos.product.model.vo.AttachmentProduct;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.Qna;

public class ProductNewDao {
	
	private Properties prop = new Properties();
	
	public ProductNewDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/mappers/productNew-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Product> selectNewProductList(Connection conn, PageInfo pi) {
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewProductList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
		
			
			
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductNo(rset.getInt("PRODUCT_NO"));
				pro.setCategoryNo(rset.getString("CATEGORY_NAME"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				pro.setPrice(rset.getInt("PRICE"));
				pro.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
				pro.setPath(rset.getString("PATH"));
				list.add(pro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		
		return list;
	}

	public int selectNewProductListCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewProductListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}

	public List<Product> selectjlist(Connection conn) {
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectjlist");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product pro = new Product();
				pro.setProductNo(rset.getInt("PRODUCT_NO"));
				pro.setCategoryNo(rset.getString("CATEGORY_NAME"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));				
				pro.setPrice(rset.getInt("PRICE"));
				pro.setDiscountPrice(rset.getInt("DISCOUNT_PRICE"));
				pro.setPath(rset.getString("PATH"));
				list.add(pro);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		return list;
		
		
	}

	public int insertLike(Connection conn, ProductNew p) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getType());
			pstmt.setInt(3, p.getProductNo());
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	public int countLike(Connection conn, ProductNew p) {
		int result=0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getType());
			pstmt.setInt(3, p.getProductNo());
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteLike(Connection conn, ProductNew p) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getType());
			pstmt.setInt(3, p.getProductNo());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	public List<ProductNew> selectLike(Connection conn, int userNo) {
		
			List<ProductNew> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectLike");
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				
				rset=pstmt.executeQuery();
				
				while(rset.next()) {
					ProductNew p = new ProductNew();
					p.setProductNo(rset.getInt("LIKE_REFNO"));
					list.add(p);
									
				}
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		
		
		
	}

	public int deleteQna(Connection conn, int answerNo) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQna");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, answerNo);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Qna> selectCategoryJang(Connection conn, PageInfo pi) {
		
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryJang");
		
		try {
			
			pstmt = conn.prepareStatement(sql);	
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setProductNo(rset.getString("PRODUCT_NAME"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setUserNo(rset.getString("USER_ID"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerType(rset.getString("ANSWER_STATUS"));
				q.setReply(rset.getString("REPLY"));
				q.setReplyDate(rset.getString("REPLY_DATE"));
				
				list.add(q);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public List<Qna> selectCategoryDress(Connection conn, PageInfo pi) {
			List<Qna> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCategoryDress");
			
			try {
				
				pstmt = conn.prepareStatement(sql);	
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Qna q = new Qna();
					q.setAnswerNo(rset.getInt("ANSWER_NO"));
					q.setProductNo(rset.getString("PRODUCT_NAME"));
					q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
					q.setUserNo(rset.getString("USER_ID"));
					q.setAnswerDate(rset.getString("ANSWER_DATE"));
					q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
					q.setAnswerType(rset.getString("ANSWER_STATUS"));
					q.setReply(rset.getString("REPLY"));
					q.setReplyDate(rset.getString("REPLY_DATE"));
					
					list.add(q);
				}
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		
		
		
	}

	public List<Qna> selectCategoryEtc(Connection conn, PageInfo pi) {
			List<Qna> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCategoryEtc");
			
			try {
				
				pstmt = conn.prepareStatement(sql);	
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Qna q = new Qna();
					q.setAnswerNo(rset.getInt("ANSWER_NO"));
					q.setProductNo(rset.getString("PRODUCT_NAME"));
					q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
					q.setUserNo(rset.getString("USER_ID"));
					q.setAnswerDate(rset.getString("ANSWER_DATE"));
					q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
					q.setAnswerType(rset.getString("ANSWER_STATUS"));
					q.setReply(rset.getString("REPLY"));
					q.setReplyDate(rset.getString("REPLY_DATE"));
					
					list.add(q);
				}
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		
	}
	
	
	public List<Qna> selectCategoryAll(Connection conn, PageInfo pi) {
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryAll");
		
		try {
			
			pstmt = conn.prepareStatement(sql);	
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setProductNo(rset.getString("PRODUCT_NAME"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setUserNo(rset.getString("USER_ID"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerType(rset.getString("ANSWER_STATUS"));
				q.setReply(rset.getString("REPLY"));
				q.setReplyDate(rset.getString("REPLY_DATE"));
				
				list.add(q);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
}
	
	
	
	
	public int countCategoryJang(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countCategoryJang");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int countCategoryDress(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countCategoryDress");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public AttachmentProduct selectReplyListFile(Connection conn, int answerNo) {
		AttachmentProduct ap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyListFile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, answerNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ap = new AttachmentProduct();
				ap.setProFileNo(rset.getInt("PRO_FILE_NO"));
				ap.setFileName(rset.getString("FILE_NAME"));
				ap.setFileChangeName(rset.getString("FILE_CHANGENAME"));
				ap.setFileRoute(rset.getString("FILE_ROUTE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ap;
	}
	
	

	public int countCategoryEtc(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countCategoryEtc");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int countCategoryAll(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countCategoryAll");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
	}

	public List<Qna> managerQnalist(Connection conn, PageInfo pi) {
		
		List<Qna> list = new ArrayList<>();
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
				Qna q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setProductNo(rset.getString("PRODUCT_NAME"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setUserNo(rset.getString("USER_ID"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerType(rset.getString("ANSWER_STATUS"));
				q.setReply(rset.getString("REPLY"));
				q.setReplyDate(rset.getString("REPLY_DATE"));
				
				list.add(q);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
		
		
	}

	public List<Qna> managerProQnalist(Connection conn, PageInfo pi) {
		
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("managerProQnalist");
		
		try {
			
			pstmt = conn.prepareStatement(sql);	
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setProductNo(rset.getString("PRODUCT_NAME"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setUserNo(rset.getString("USER_ID"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerType(rset.getString("ANSWER_STATUS"));
				q.setReply(rset.getString("REPLY"));
				q.setReplyDate(rset.getString("REPLY_DATE"));
				
				list.add(q);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;

	}

	public List<Qna> managerUnproQnalist(Connection conn, PageInfo pi) {
		
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("managerUnproQnalist");
		
		try {
			
			pstmt = conn.prepareStatement(sql);	
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setProductNo(rset.getString("PRODUCT_NAME"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setUserNo(rset.getString("USER_ID"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerType(rset.getString("ANSWER_STATUS"));
				q.setReply(rset.getString("REPLY"));
				q.setReplyDate(rset.getString("REPLY_DATE"));
				
				list.add(q);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}

	public Qna selectReplyList(Connection conn, int no) {
		
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setReply(rset.getString("REPLY"));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
		
	}

	public int updateReply(Connection conn, int no, String content, int adminNo) {
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, adminNo);
			pstmt.setInt(3, no);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public List<Qna> selectSearchList(Connection conn, String search, PageInfo pi) {
		
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);	
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				q.setAnswerNo(rset.getInt("ANSWER_NO"));
				q.setProductNo(rset.getString("PRODUCT_NAME"));
				q.setAnswerTitle(rset.getString("ANSWER_TITLE"));
				q.setUserNo(rset.getString("USER_ID"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerType(rset.getString("ANSWER_STATUS"));
				q.setReply(rset.getString("REPLY"));
				q.setReplyDate(rset.getString("REPLY_DATE"));
				
				list.add(q);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
		
	}

	public int countSearch(Connection conn, String search) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countSearch");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
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
