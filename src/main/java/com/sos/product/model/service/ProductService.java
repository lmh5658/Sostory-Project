package com.sos.product.model.service;

import static com.sos.common.template.JDBCTemplate.close;
import static com.sos.common.template.JDBCTemplate.commit;
import static com.sos.common.template.JDBCTemplate.getConnection;
import static com.sos.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.sos.common.model.vo.PageInfo;
import com.sos.member.model.vo.Member;
import com.sos.product.model.dao.ProductDao;
import com.sos.product.model.vo.AttachmentProduct;
import com.sos.product.model.vo.Product;
import com.sos.product.model.vo.ProductLike;
import com.sos.product.model.vo.ProductRecipe;
import com.sos.product.model.vo.ProductReview;
import com.sos.product.model.vo.Qna;

public class ProductService {
	
	private ProductDao pDao = new ProductDao();
	
	public List<Product> selectProductList(PageInfo pi){
		Connection conn = getConnection();
		
		List<Product> list = pDao.selectProductList(conn, pi);
		
		close(conn);
		
		return list;	
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		int count = pDao.selectListCount(conn);
		close(conn);
		return count;
	}
	
	public Product selectProduct(int productNo) {
		Connection conn = getConnection();
		Product pro = pDao.selectProduct(conn, productNo);
		close(conn);
		return pro;
	}
	
	public List<Member> selectPaymentUser() {
		Connection conn = getConnection();
		List<Member> list = pDao.selectPaymentUser(conn);
		close(conn);
		return list;
	}
	
	public int selectQnaCount(int productNo) {
		Connection conn = getConnection();
		int countList = pDao.selectQnaCount(conn, productNo);
		close(conn);
		return countList;
	}
	
	public List<Qna> selectQnaAllList(PageInfo pi) {
		Connection conn = getConnection();
		List<Qna> list = pDao.selectQnaAllList(conn,pi);
		close(conn);
		return list;
	}
	
	public List<Qna> selectQnaAllListaNo() {
		Connection conn = getConnection();
		List<Qna> list = pDao.selectQnaAllListaNo(conn);
		close(conn);
		return list;
	}
	
	public int selectQnaAllCount() {
		Connection conn = getConnection();
		int countList = pDao.selectQnaAllCount(conn);
		close(conn);
		return countList;
	}
	
	public List<Qna> selectQnaList(int productNo, PageInfo pi){
		Connection conn = getConnection();
		List<Qna> list = pDao.selectQnaList(conn, productNo, pi);
		close(conn);
		return list;
	}
	
	public List<ProductRecipe> selectRecipeList(int productNo){
		Connection conn = getConnection();
		List<ProductRecipe> rlist = pDao.selectRecipeList(conn, productNo);
		close(conn);
		return rlist;
	}
	
	public int selectReviewCount(int productNo) {
		Connection conn = getConnection();
		int count = pDao.selectReviewCount(conn, productNo);
		close(conn);
		return count;
	}
	
	public List<ProductReview> selectReviewList(int productNo, PageInfo pi){
		Connection conn = getConnection();
		List<ProductReview> list = pDao.selectReviewList(conn, productNo, pi);
		close(conn);
		return list;
	}
	
	public int insertReview(ProductReview pr) {
		Connection conn = getConnection();
		int result = pDao.insertReview(conn, pr);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int searchCountList(String search) {
		Connection conn = getConnection();
		int count = pDao.searchCountList(conn, search);
		close(conn);
		return count;
	}
	
	public List<Product> selectSearchList(String search, PageInfo pi){
		Connection conn = getConnection();
		List<Product> list = pDao.selectSearchList(conn, search, pi);
		close(conn);
		return list;
	}
	
	public int insertQna(String title, String content, int userNo, int productNo, AttachmentProduct ap) {
		Connection conn = getConnection();
		
		int result1 = pDao.insertQna(conn, title, content, userNo, productNo);
		
		int result2 = 1;
		if(result1 > 0 && ap !=null) {
			result2 = pDao.insertQnaFiles(conn, ap);	
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	public int selectJangListCount() {
		Connection conn = getConnection();
		int count = pDao.selectJangListCount(conn);
		close(conn);
		return count;
	}
	
	public List<Product> selectProductJang(PageInfo pi){
		Connection conn = getConnection();
		List<Product> list = pDao.selectProductJang(conn, pi);
		close(conn);
		return list;
	}
	
	public int countListJang(String search) {
		Connection conn = getConnection();
		int count = pDao.countListJang(conn, search);
		close(conn);
		return count;
	}
	
	public List<Product> searchProductJangList(PageInfo pi, String search){
		Connection conn = getConnection();
		List<Product> list = pDao.searchProductJangList(conn, pi, search);
		close(conn);
		return list;
	}
	
	public int countListDressing() {
		Connection conn = getConnection();
		int count = pDao.countListDressing(conn);
		close(conn);
		return count;
	}
	
	public List<Product> selectDressingList(PageInfo pi){
		Connection conn = getConnection();
		List<Product> list = pDao.selectDressingList(conn, pi);
		close(conn);
		return list;
	}
	
	public int countSearchList(String search) {
		Connection conn = getConnection();
		int count = pDao.countSearchList(conn, search);
		close(conn);
		return count;
	}
	
	public List<Product> searchProductDressingList(PageInfo pi, String search){
		Connection conn = getConnection();
		List<Product> list = pDao.searchProductDressingList(conn, pi, search);
		close(conn);
		return list;
	}
	
	public int countListEtc() {
		Connection conn = getConnection();
		int count = pDao.countListEtc(conn);
		close(conn);
		return count;
	}
	
	public List<Product> selectEtcProductList(PageInfo pi){
		Connection conn = getConnection();
		List<Product> list = pDao.selectEtcProductList(conn, pi);
		close(conn);
		return list;
	}
	
	public int countEtcProduct(String search) {
		Connection conn = getConnection();
		int count = pDao.countEtcProduct(conn, search);
		close(conn);
		return count;
		
	}
	
	public List<Product> sortAllList(String select, PageInfo pi){
		
		Connection conn = getConnection();
		List<Product> list = new ArrayList<>();
		if(select.equals("like")) {
			list = pDao.sortLikeAllList(conn, pi);
		}else if(select.equals("sale")) {
			list = pDao.sortSaleAllList(conn, pi);
		}else if(select.equals("rowPrice")){
			list = pDao.sortrowPriceAllList(conn, pi);
		}
		close(conn);
		return list;
	}
	
	public List<Product> sortJangList(String select, PageInfo pi){
		
		Connection conn = getConnection();
		List<Product> list = new ArrayList<>();
		if(select.equals("like")) {
			list = pDao.sortLikeJangList(conn, pi);
		}else if(select.equals("sale")) {
			list = pDao.sortSaleJangList(conn, pi);
		}else if(select.equals("rowPrice")){
			list = pDao.sortrowPriceJangList(conn, pi);
		}
		close(conn);
		return list;
	}	
	
	public List<Product> sortDressingList(String select, PageInfo pi){
		
		Connection conn = getConnection();
		List<Product> list = new ArrayList<>();
		if(select.equals("like")) {
			list = pDao.sortLikeDressingList(conn, pi);
		}else if(select.equals("sale")) {
			list = pDao.sortSaleDressingList(conn, pi);
		}else if(select.equals("rowPrice")){
			list = pDao.sortrowPriceDressingList(conn, pi);
		}
		close(conn);
		return list;
	}
	
	public List<Product> searchProductEtcList(String search, PageInfo pi){
		Connection conn = getConnection();
		List<Product> list = pDao.searchProductEtcList(conn, pi, search);
		close(conn);
		return list;
	}
	
	
	
	public List<Product> sortEtcList(String select, PageInfo pi){
		
		Connection conn = getConnection();
		List<Product> list = new ArrayList<>();
		if(select.equals("like")) {
			list = pDao.sortLikeEtcList(conn, pi);
		}else if(select.equals("sale")) {
			list = pDao.sortSaleEtcList(conn, pi);
		}else if(select.equals("rowPrice")){
			list = pDao.sortrowPriceEtcList(conn, pi);
		}
		close(conn);
		return list;
	}
	
	public int insertLikeProduct(int productNo, int userNo) {
		Connection conn = getConnection();
		int result = pDao.insertLikeProduct(conn, productNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;	
	}
	
	
	public int deleteLikeProduct(int productNo, int userNo) {
		Connection conn = getConnection();
		int result = pDao.deleteLikeProduct(conn, productNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;	
	}

	
	public List<ProductLike> likeUserNo(int userNo) {
		Connection conn = getConnection();
		List<ProductLike> list = pDao.likeUserNo(conn, userNo);
		close(conn);
		return list;
	}
	
	public List<Integer> likeProductAll(int userNo){
		Connection conn = getConnection();
		List<Integer> list = pDao.likeProductAll(conn, userNo);
		close(conn);
		return list;
	}
	
	public int countBestList() {
		Connection conn = getConnection();
		int count = pDao.countBestList(conn);
		close(conn);
		return count;
	}
	
	public List<Product> productBestList(PageInfo pi){
		Connection conn = getConnection();
		List<Product> list = pDao.productBestList(conn, pi);
		close(conn);
		return list;
	}
	
	public List<Product> productBestSearchList(PageInfo pi, String search){
		Connection conn = getConnection();
		List<Product> list = pDao.productBestSearchList(conn, pi, search);
		close(conn);
		return list;
	}
	
	public int countBestSearchList(String search) {
		Connection conn = getConnection();
		int count = pDao.countBestSearchList(conn, search);
		close(conn);
		return count;
		
	}
}
