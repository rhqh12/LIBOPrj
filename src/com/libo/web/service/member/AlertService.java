package com.libo.web.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.libo.web.entity.Alert;
import com.libo.web.entity.Course;
import com.libo.web.util.DBConn;

public class AlertService {

	/*public static void main(String[] args) {
		AlertService alertService = new AlertService();
		// insert
		Alert alert = new Alert();
		alert.setId(2);
		alert.setWeek("화");
		alert.setTime("18/06/27");
		alert.setSpecificDate("18/06/27");
		alert.setDueDate("18/06/27");
		alert.setWriterId("test");
		alertService.insertAlert(alert);

		//리스트 select
		alert = new Alert();
		alert.setId(2);
		alert.setWeek("화");
		alert.setTime("18/06/27");
		alert.setSpecificDate("18/06/27");
		alert.setDueDate("18/06/27");
		alert.setWriterId("test");

		// update
		alertService.updateAlert(alert);

		// delete
		long[] deleteId = { 3, 4 };
		alertService.deleteAlert(deleteId);
		
		//1개만 select
		alertService.getAlert(1);

	}*/

	// 목록
	public List<Alert> getAlertList(String memberId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Alert> list = new ArrayList<Alert>();
		String sql = "";
	    sql += "SELECT ID, WEEK, TO_CHAR(TIME, 'HH24:MI') TIME, TO_CHAR(SPECIFIC_DATE,'YYYY-MM-DD') SPECIFIC_DATE, DUE_DATE, WRITER_ID, ALARM\n";
	    sql += "FROM ALERT WHERE WRITER_ID = ? \n";
	    sql += "ORDER BY ID DESC";
	    
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			while (rs.next()) {
				Alert alert = new Alert();				
				alert = new Alert(
						  rs.getInt("ID"),
						  rs.getString("WEEK"),
						  rs.getString("TIME"),
						  rs.getString("SPECIFIC_DATE"),
						  rs.getString("DUE_DATE"),
						  rs.getString("WRITER_ID"),
						  rs.getString("ALARM")
						);
				list.add(alert);
			}
			// 데이터테스트
			for (Alert alert : list) {
				System.out.println(alert.toString());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return list;
	}

	// 보기
	public Alert getAlert(long alertId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Alert alert = new Alert();
		String sql = "";
	    sql += "SELECT ID, WEEK, TO_CHAR(TIME, 'HH24:MI') TIME, TO_CHAR(SPECIFIC_DATE,'YYYY-MM-DD') SPECIFIC_DATE, DUE_DATE, WRITER_ID, ALARM\n";
	    sql += "FROM ALERT WHERE ID = ?";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, alertId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			if (rs.next()) {				
				alert = new Alert(
						  rs.getInt("ID"),
						  rs.getString("WEEK"),
						  rs.getString("TIME"),
						  rs.getString("SPECIFIC_DATE"),
						  rs.getString("DUE_DATE"),
						  rs.getString("WRITER_ID"),
						  rs.getString("ALARM")
						);				
			}
			//System.out.println(alert.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return alert;
	}
	
	public String getPushAlert(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Alert alert = new Alert();
		String sql = "";
	    sql += "SELECT count(ID) count \n";
	    sql += "FROM ALERT WHERE WRITER_ID = ? AND TO_CHAR(TIME,'HH24:MI') = ?";
	    
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		
		String userDate = format.format(date);
		
		String count = "0";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id); // 매개변수 (순번, 넣을 값)
			ps.setString(2, userDate);
			//ps.setString(2, date);
			rs = ps.executeQuery();
			if (rs.next()) {	
				count = rs.getString(count);			
			}
			//System.out.println(alert.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return count;
	}

	public void insertAlert(Alert alert) {

		Connection conn = null;
		PreparedStatement ps = null;
		
		
	    String sql = "";
	    sql += "INSERT INTO ALERT \n";
	    sql += "(ID, WEEK, TIME, SPECIFIC_DATE, WRITER_ID) \n";
	    sql += "VALUES((SELECT NVL((MAX(ID)+1),1) FROM ALERT), ?, TO_DATE(?,'HH24:MI"
	    		+ "'), TO_DATE(?,'YY/MM/DD HH24:MI'), ?)";	

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, alert.getWeek());
			ps.setString(2, alert.getTime());
			ps.setString(3, alert.getSpecificDate());
			ps.setString(4, alert.getWriterId());
			int cnt = ps.executeUpdate();
			
			alert.toString();
				
			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}

	}

	// 수정
	public void updateAlert(Alert alert) {

		Connection conn = null;
		PreparedStatement ps = null;

		String sql = "";
		sql += "UPDATE ALERT SET \n";
		sql += "WEEK = ? ,TIME = TO_DATE(?,'HH24:MI'), SPECIFIC_DATE = TO_DATE(?,'YY/MM/DD HH24:MI') \n";
		sql += "WHERE ID = ? AND WRITER_ID = ? \n";

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, alert.getWeek());
			ps.setString(2, alert.getTime());
			ps.setString(3, alert.getSpecificDate());
			ps.setLong(4, alert.getId());
			ps.setString(5, alert.getWriterId());
			int cnt = ps.executeUpdate();
			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}

	}

	// 삭제
	public void deleteAlert(long[] id) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		sql += "DELETE FROM ALERT \n";
		sql += "WHERE ID = ? \n";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < id.length; i++) {
				ps.setLong(1, id[i]);
				int cnt = ps.executeUpdate();
				if (cnt == 1)
					System.out.println("성공");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}
	
	public int updateAlertAlarm(Alert alert) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		int cnt = 0;
		sql += "UPDATE ALERT SET \n";
		sql += "ALARM = ? WHERE ID = ?";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, alert.getAlarm());
			ps.setLong(2, alert.getId());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
		return cnt;
	}

}