package com.libo.libo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
	//http://racoonlotty.tistory.com/41 참고
	//null reset
	private static Connection dbConn;	
	public static Connection getConnection() {
		if(dbConn == null) {
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
		}
		return dbConn;		
	}
	
	public static Connection getConnection(String url, String user, String pwd) {
		if (dbConn == null)	{
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				dbConn = DriverManager.getConnection(url, user, pwd);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}
	
	public static void close() {
		if(dbConn != null) {
			try {
				if(!dbConn.isClosed()) {
					dbConn.close();		
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		dbConn = null;
	}

}
