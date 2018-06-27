package com.libo.libo.service.member;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;
import com.libo.libo.member.Alert;
import com.libo.libo.util.DBConn;

public class AlertService {	
	//보기
	public Alert getAlert(long id) {
		Alert alert = new alert(rs.getInt("id"), rs.getString("title"));
		return null;
	}
	
	//목록
	public  List<Alert> getAlertList(String memberId) {
		return null;
	}
	
	public void insertAlert(Alert alert) {
		//Resultset rs = st.executeQuery(sql); //select
		//int result = st.executeUpdate(sql); //update, insert, delete
		Connection conn = DBConn.getConnection();
		
		if (conn == null) {
			System.out.println("DB 연결 실패!!!");
			//메인메소드를  0을 넘겨주고 죽음.
			System.exit(0);
		}
		
		try {
			Statement st = conn.createStatement();
			String sql = String.format("INSERT INTO ALERT(WEEK, TIME, SPECIFIC_DATE, DUE_DATE, WRITER_ID) VALUES(%s, %s, %s %s %s)", alert.getWeek(), alert.getTime(), );
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
				
	
	}
	
	//수정
	public void updateAlert(Alert alert, long id) {
		
	}
	
	//삭제
	public void deleteAlert(long id) {
		
	}

}