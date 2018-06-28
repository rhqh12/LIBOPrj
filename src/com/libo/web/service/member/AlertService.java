package com.libo.web.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.libo.web.member.Alert;
import com.libo.web.util.DBConn;

public class AlertService {

	public static void main(String[] args) {
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

	}

	// 목록
	public List<Alert> getAlertList(String memberId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Alert> list = new ArrayList<Alert>();
		String sql = "select * from alert where writer_id = ? order by id";
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
						  rs.getString("WRITER_ID")
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

	// 목록
	public Alert getAlert(long alertId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Alert alert = new Alert();
		String sql = "select * from alert where id = ?";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, alertId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			if (rs.next()) {
				alert.setId(rs.getInt("ID"));
				alert.setDueDate(rs.getString("DUE_DATE"));
				alert.setSpecificDate(rs.getString("SPECIFIC_DATE"));
				alert.setTime(rs.getString("TIME"));
				alert.setWeek(rs.getString("WEEK"));
				alert.setWriterId(rs.getString("WRITER_ID"));
			}
			System.out.println(alert.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return alert;
	}

	public void insertAlert(Alert alert) {

		Connection conn = null;
		PreparedStatement ps = null;

		String sql = "INSERT INTO ALERT(ID, WEEK, TIME, SPECIFIC_DATE, DUE_DATE, WRITER_ID) VALUES(?, ?, ?, ?, ?, ?)";

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, alert.getId()); // 매개변수 (순번, 넣을 값)
			ps.setString(2, alert.getWeek());
			ps.setString(3, alert.getTime());
			ps.setString(4, alert.getSpecificDate());
			ps.setString(5, alert.getDueDate());
			ps.setString(6, alert.getWriterId());
			int cnt = ps.executeUpdate();

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
		sql += "WEEK = ? ,TIME = ? ,SPECIFIC_DATE = ? ,DUE_DATE = ? \n";
		sql += "WHERE ID = ? \n";

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, alert.getWeek());
			ps.setString(2, alert.getTime());
			ps.setString(3, alert.getSpecificDate());
			ps.setString(4, alert.getDueDate());
			ps.setInt(5, alert.getId());
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

}