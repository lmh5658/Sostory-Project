/**
 * 
 */
package com.sos.common.template;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * @author GD
 *
 */
public class JDBCTemplate {
	
	// 1. Connection 객체(DB와 접속된) 생성 후 해당 생성된 객체를 반환시켜주는 메소드 
			public static Connection getConnection() {
				
				Connection conn = null;
				Properties prop = new Properties();
				
				// 읽어들이고자 하는 파일 : driver.properties (src/main/java 안에 있는 파일 x, src/main/webapp/WEB-INF/classes 안의 파일)
				String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
				
//				System.out.println(filePath);
				
				try {
					prop.load(new FileInputStream(filePath));
					
					Class.forName(prop.getProperty("driver"));
					conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password"));
					conn.setAutoCommit(false);			
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return conn;
				
			}
	
			// 2. Statement 관련 객체 반납
			public static void close(Statement stmt) { // 다형성 적용되서 Statement객체도 받을 수 있고 PreparedStatement객체도 받을 수 있음
				try {
					if (stmt != null && !stmt.isClosed()) {
						stmt.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			// 3. Connection 객체 반납 
			public static void close(Connection conn) {
				try {
					if(conn != null && !conn.isClosed()) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			// 4. ResultSet 객체 반납 
			public static void close(ResultSet rset) {
				try {
					if(rset != null && !rset.isClosed()) {
						rset.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			// 5. commit 처리 해주는 코드
			public static void commit(Connection conn) {
				try {
					if(conn != null && !conn.isClosed()) {
						conn.commit();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			// 6. rollback 처리 해주는 코드
			public static void rollback(Connection conn) {
				try {
					if(conn != null && !conn.isClosed()) {
						conn.rollback();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			
			
			
			
			
			
			
			
}

