package com.libo.libo.service.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.libo.libo.admin.Notice;
import com.libo.libo.util.DBConn;

public class NoticeService {

	public static void main(String[] args) {
		NoticeService noticeService = new NoticeService();
		Notice notice = new Notice();
		/*
		 * Notice Service service = new NoticeService(); Notice notice = new
		 * Notice("aa", "newlec"); ; notice.setTitle("aaa"); service.insert
		 */
		notice.setId(1);
		notice.setSubject("공지사항");
		notice.setConstant("관리자입니다.");
		notice.setWriterID("admin");
		notice.setDate("18/06/27");

		noticeService.insertNotice(notice);

	}

	public void insertNotice(Notice notice) {
		Connection conn = null;
		PreparedStatement ps = null;

		String sql = "INSERT INTO NOTICE(ID, SUBJECT, CONSTANT, WRITER_ID, DUE_DATE) VALUES(?, ?, ?, ?, ?)";

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, notice.getId());
			ps.setString(2, notice.getSubject());
			ps.setString(3, notice.getConstant());
			ps.setString(4, notice.getWriterId());
			ps.setString(5, notice.getDate());
			int cnt = ps.executeUpdate();

			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}

	public void updateNotice(Notice notice) {
		Connection conn = null;
		PreparedStatement ps = null;

		String sql = "UPDATE NOTICE SET SUBJECT = ?, CONSTANT = ?, WRITER_ID = ? WHERE ID = ?";

		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, notice.getSubject());
			ps.setString(2, notice.getConstant());
			ps.setString(3, notice.getWriterId());
			ps.setInt(4, notice.getId());
			int cnt = ps.executeUpdate();

			if (cnt == 1)
				System.out.println("성공");

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}

	}
}