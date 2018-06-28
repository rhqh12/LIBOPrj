package com.libo.web.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.libo.web.member.Course;
import com.libo.web.util.DBConn;

public class CourseService {
	public static void main(String[] args) {

		CourseService courseService = new CourseService();
		Course course = new Course(1, "18/06/27", "Y", "홍대역", "홍대역 주소", "18/06/27", "Y", "구로역", "구로역 주소", "18/06/27",
				"test", "18/06/27");

		courseService.insertCourse(course);

		course = new Course(1, "18/06/27", "Y", "홍대역", "홍대역 주소", "18/06/27", "Y", "구로역", "구로역 주소", "18/06/27", "test",
				"18/06/27");
		courseService.updateCourse(course);

		course = new Course(1, "18/06/27", "N", "홍대역", "홍대역 주소", "18/06/27", "N", "구로역", "구로역 주소", "18/06/27", "test",
				"18/06/27");
		courseService.updateCourseAlarm(course);

		long[] deleteId = { 2, 3 };
		courseService.deleteCourse(deleteId);
		
		courseService.getCourse(1);
		
		courseService.getCourseList("test");

	}

	public Course getCourse(long courseId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Course course = new Course();
		String sql = "select * from course where id = ? order by id";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, courseId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			if(rs.next()) {
				course = new Course(
							rs.getInt("ID"),
							rs.getString("STARTING_TIME"),
							rs.getString("STARTING_ALARM"),
							rs.getString("WORKPLACE"),
							rs.getString("WORKPLACE_ADDRESS"),
							rs.getString("ENDING_TIME"),
							rs.getString("ENDING_ALARM"),
							rs.getString("HOME"),
							rs.getString("HOME_ADDRESS"),
							rs.getString("WEEK"),
							rs.getString("WRITER_ID"),
							rs.getString("DUE_DATE")
						);
			}
			// 데이터테스트
			System.out.println(course.toString());

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
		String sql = "select * from course where writer_id = ? order by id";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, writerId); // 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			while (rs.next()) {
				Course course = new Course();
				course = new Course(
						rs.getInt("ID"),
						rs.getString("STARTING_TIME"),
						rs.getString("STARTING_ALARM"),
						rs.getString("WORKPLACE"),
						rs.getString("WORKPLACE_ADDRESS"),
						rs.getString("ENDING_TIME"),
						rs.getString("ENDING_ALARM"),
						rs.getString("HOME"),
						rs.getString("HOME_ADDRESS"),
						rs.getString("WEEK"),
						rs.getString("WRITER_ID"),
						rs.getString("DUE_DATE")
					);
				list.add(course);
			}
			// 데이터테스트
			for (Course course : list) {
				System.out.println(course.toString());
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
		sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, course.getId()); // 매개변수 (순번, 넣을 값)
			ps.setString(2, course.getStartingTime());
			ps.setString(3, course.getStartingAlarm());
			ps.setString(4, course.getWorkplace());
			ps.setString(5, course.getWorkplaceAddress());
			ps.setString(6, course.getEndingTime());
			ps.setString(7, course.getEndingAlarm());
			ps.setString(8, course.getHome());
			ps.setString(9, course.getHomeAddress());
			ps.setString(10, course.getWeek());
			ps.setString(11, course.getWriterId());
			ps.setString(12, course.getDueDate());
			int cnt = ps.executeUpdate();
			if (cnt == 1)
				System.out.println("성공");
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
		sql += "STARTING_TIME = ?,STARTING_ALARM = ?,WORKPLACE = ?,WORKPLACE_ADDRESS = ?, \n";
		sql += "ENDING_TIME = ?, ENDING_ALARM = ?, HOME = ?, HOME_ADDRESS = ?, WEEK = ? \n";
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
			ps.setInt(10, course.getId());
			int cnt = ps.executeUpdate();
			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}

	}

	public void updateCourseAlarm(Course course) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		sql += "UPDATE COURSE SET \n";
		sql += "STARTING_ALARM = ?,ENDING_ALARM = ? \n";
		sql += "WHERE ID = ?";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, course.getStartingAlarm());
			ps.setString(2, course.getEndingAlarm());
			ps.setInt(3, course.getId());
			int cnt = ps.executeUpdate();
			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}

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
