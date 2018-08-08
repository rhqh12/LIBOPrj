package com.libo.web.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.libo.web.entity.Course;
import com.libo.web.entity.PlaceFav;
import com.libo.web.util.DBConn;

public class CourseService {

	public Course getCourse(long courseId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Course course = new Course();
		String sql = "select\r\n"
				+ "ID, to_char(STARTING_TIME, 'HH24:MI') STARTING_TIME, STARTING_ALARM, WORKPLACE, \r\n"
				+ "WORKPLACE_ADDRESS, to_char(ENDING_TIME, 'HH24:MI') ENDING_TIME, ENDING_ALARM, HOME, \r\n"
				+ "HOME_ADDRESS, WEEK, WRITER_ID, DUE_DATE\r\n" + "from course\r\n" + "where id = ?";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, courseId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			if (rs.next()) {
				course = new Course(rs.getInt("ID"), rs.getString("STARTING_TIME"), rs.getString("STARTING_ALARM"),
						rs.getString("WORKPLACE"), rs.getString("WORKPLACE_ADDRESS"), rs.getString("ENDING_TIME"),
						rs.getString("ENDING_ALARM"), rs.getString("HOME"), rs.getString("HOME_ADDRESS"),
						rs.getString("WEEK"), rs.getString("WRITER_ID"), rs.getString("DUE_DATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return course;
	}

	public List<Course> getCourseList(String writerId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Course> list = new ArrayList<Course>();
		String sql = "select ID,  to_char(STARTING_TIME, 'HH24:MI') STARTING_TIME, STARTING_ALARM, WORKPLACE, WORKPLACE_ADDRESS, to_char(ENDING_TIME, 'HH24:MI') ENDING_TIME,\r\n"
				+ "ENDING_ALARM, HOME, HOME_ADDRESS, WEEK, WRITER_ID, DUE_DATE \r\n"
				+ "from course where WRITER_ID = ? order by id";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, writerId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			while (rs.next()) {
				Course course = new Course();
				course = new Course(rs.getInt("ID"), rs.getString("STARTING_TIME"), rs.getString("STARTING_ALARM"),
						rs.getString("WORKPLACE"), rs.getString("WORKPLACE_ADDRESS"), rs.getString("ENDING_TIME"),
						rs.getString("ENDING_ALARM"), rs.getString("HOME"), rs.getString("HOME_ADDRESS"),
						rs.getString("WEEK"), rs.getString("WRITER_ID"), rs.getString("DUE_DATE"));
				list.add(course);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return list;
	}

	public void insertCourse(Course course) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		sql += "INSERT INTO COURSE \n";
		sql += "(ID,STARTING_TIME,STARTING_ALARM,WORKPLACE,WORKPLACE_ADDRESS, \n";
		sql += "ENDING_TIME,ENDING_ALARM,HOME,HOME_ADDRESS,WEEK,WRITER_ID, DUE_DATE) \n";
		sql += "VALUES((SELECT NVL(MAX(ID),0)+1 FROM COURSE), TO_DATE(?,'HH24:MI'), ?, ?, ?, TO_DATE(?,'HH24:MI'), ?, ?, ?, ?, ?, sysdate)";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, course.getStartingTime());
			ps.setString(2, course.getStartingAlarm());
			ps.setString(3, course.getWorkplace());
			ps.setString(4, course.getWorkplaceAddress());
			ps.setString(5, course.getEndingTime());
			ps.setString(6, course.getEndingAlarm());
			ps.setString(7, course.getHome());
			ps.setString(8, course.getHomeAddress());
			ps.setString(9, course.getWeek());
			ps.setString(10, course.getWriterId());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}

	}

	public void updateCourse(Course course) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		sql += "UPDATE COURSE SET \n";
		sql += "STARTING_TIME = TO_DATE(?,'HH24:MI'),STARTING_ALARM = ?,WORKPLACE = ?,WORKPLACE_ADDRESS = ?, \n";
		sql += "ENDING_TIME = TO_DATE(?,'HH24:MI'), ENDING_ALARM = ?, HOME = ?, HOME_ADDRESS = ?, WEEK = ? \n";
		sql += "WHERE ID = ?";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, course.getStartingTime());
			ps.setString(2, course.getStartingAlarm());
			ps.setString(3, course.getWorkplace());
			ps.setString(4, course.getWorkplaceAddress());
			ps.setString(5, course.getEndingTime());
			ps.setString(6, course.getEndingAlarm());
			ps.setString(7, course.getHome());
			ps.setString(8, course.getHomeAddress());
			ps.setString(9, course.getWeek());
			ps.setLong(10, course.getId());
			int cnt = ps.executeUpdate();
			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}

	public int updateCourseAlarm(Course course) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		int cnt = 0;
		sql += "UPDATE COURSE SET \n";
		sql += "STARTING_ALARM = ?,ENDING_ALARM = ? \n";
		sql += "WHERE ID = ?";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, course.getStartingAlarm());
			ps.setString(2, course.getEndingAlarm());
			ps.setLong(3, course.getId());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
		return cnt;
	}

	public void deleteCourse(long[] id) {

		Connection conn = null;
		PreparedStatement ps = null;

		String sql = "";
		sql += "DELETE FROM COURSE \n";
		sql += "WHERE ID = ? \n";

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < id.length; i++) {
				ps.setLong(1, id[i]);
				ps.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}

/*	public List<PlaceFav> getFavorite(String writerId) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PlaceFav> list = new ArrayList<PlaceFav>();

		String sql = "SELECT LOCATION, ADDRESS FROM PLACE_FAV \n";
		sql += "WHERE WRITER_ID = ? ORDER BY LOCATION";

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, writerId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			while (rs.next()) {
				PlaceFav placeFav = new PlaceFav(rs.getString("LOCATION"), rs.getString("ADDRESS"));
				list.add(placeFav);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return list;
	}

	public void insertFavorite(PlaceFav placeFav) {

		
		ID
		WRITER_ID
		LOCATION
		ADDRESS
		DUE_DATE
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		sql += "INSERT INTO PLACE_FAV (ID, WRITER_ID, LOCATION, ADDRESS, DUE_DATE) \n"; 
		sql += "SELECT ((SELECT NVL(MAX(ID),0)+1 FROM PLACE_FAV)), ?, ?, ?, sysdate \n";
		sql += "FROM DUAL \n";
		sql += "WHERE 1 = 1 \n";
		sql += "AND NOT EXISTS ( \n";
		sql += "SELECT * FROM PLACE_FAV \n";
		sql += "WHERE 1 = 1 \n";
		sql += "AND WRITER_ID = ? \n";
		sql += "AND LOCATION = ? \n";
		sql += "AND ADDRESS = ?) ";
		try { 
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, placeFav.getWriterId());
			ps.setString(2, placeFav.getLocation());
			ps.setString(3, placeFav.getAddress());
			ps.setString(4, placeFav.getWriterId());
			ps.setString(5, placeFav.getLocation());
			ps.setString(6, placeFav.getAddress());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}

	}

	public void deleteFavorite(PlaceFav placeFav) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		sql += "DELETE FROM PLACE_FAV \n";
		sql += "WHERE WRITER_ID = ? AND LOCATION = ? AND ADDRESS = ? ";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, placeFav.getWriterId());
			ps.setString(2, placeFav.getLocation());
			ps.setString(3, placeFav.getAddress());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}*/
}
