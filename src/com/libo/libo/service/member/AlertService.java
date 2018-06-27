package com.libo.libo.service.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import com.libo.libo.member.Alert;
import com.libo.libo.util.DBConn;

public class AlertService {	
	
	public static void main(String[] args) {
		AlertService alertService = new AlertService();
		Alert alert = new Alert();
		
		//ID, WEEK, TIME, SPECIFIC_DATE, DUE_DATE, WRITER_ID
		/*String week = alert.getWeek();
		String week = alert.getWeek();*/
		
		alert.setId(2);
		alert.setWeek("화");
		alert.setTime("18/06/27");
		alert.setSpecificDate("18/06/27");
		alert.setDueDate("18/06/27");
		alert.setWriterId("test");

		alertService.insertAlert(alert);
	}
	
	
	//보기
	/*public Alert getAlert(long id) {
		Alert alert = new alert(rs.getInt("id"), rs.getString("title"));
		return null;
	}*/
	
	//목록
	public  List<Alert> getAlertList(String memberId) {
		return null;
	}
	
	public void insertAlert(Alert alert) {	
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "INSERT INTO ALERT(ID, WEEK, TIME, SPECIFIC_DATE, DUE_DATE, WRITER_ID) VALUES(?, ?, ?, ?, ?, ?)";
				
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, alert.getId());	//매개변수 (순번, 넣을 값)
			ps.setString(2, alert.getWeek());
			ps.setString(3, alert.getTime());
			ps.setString(4, alert.getSpecificDate());
			ps.setString(5, alert.getDueDate());
			ps.setString(6, alert.getWriterId());
			int cnt = ps.executeUpdate();
			
			if(cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	
	}
	
	//수정
	public void updateAlert(Alert alert, long id) {
		
	}
	
	//삭제
	public void deleteAlert(long id) {
		
	}

}