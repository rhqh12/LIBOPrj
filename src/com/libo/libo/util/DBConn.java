package com.libo.libo.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConn {
	//http://racoonlotty.tistory.com/41 참고
	//null reset
	public static Connection getConnection() {
		Connection dbConn = null;
		try {
			
			//연결 설정
			String url ="jdbc:oracle:thin:@211.238.142.251:1521:orcl";
			String user = "c##libo";
			String pwd = "lifebot123";				
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//연결
			dbConn = DriverManager.getConnection(url, user, pwd);
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dbConn;		
	}
	
	public static void close(Connection conn,  PreparedStatement ps) {
		close(conn, null, ps);	
	}
	
	public static void close(Connection conn, ResultSet rs, PreparedStatement ps) {
		
		if(rs != null) {
			try {
				rs.close();				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		if(ps != null) {
			try {
				ps.close();				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		if(conn != null) {
			try {
				conn.close();				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
	}
	
	public static void close(Connection conn,  Statement st) {
		close(conn, null, st);
	}
	
	public static void close(Connection conn, ResultSet rs, Statement st) {
		if(rs != null) {
			try {
				rs.close();				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
				
		if(st != null) {
			try {
				st.close();				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		if(conn != null) {
			try {
				conn.close();				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}	
	}
	

}
