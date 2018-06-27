package com.libo.libo.service.member;
import com.libo.libo.member.Notice;
import com.libo.libo.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


public class NoticeService {
	public Notice getNotice(long id) {
		NoticeService noticeService = new NoticeService();
		Notice notice = new Notice();
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "SELECT * FROM NOTICE_BOARD WHERE = ?";
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				notice.setId(rs.getInt("ID"));
				notice.setSubject(rs.getString("SUBJECT"));
				notice.setConstant(rs.getString("CONSTANT"));
				notice.setWriterID(rs.getString("WRITER_ID"));
				notice.setDate(rs.getString("DUE_DATE"));
			}
		
			System.out.println(notice.toString());
	}catch(SQLException e) {
			e.printStackTrace();
	}finally {
		DBConn.close(conn, rs, ps);
	}
	return notice;
}
	public List<Notice> getNoticeList() {
		Connection conn = null;
		PreparedStatement ps =null;
		
		String sql = "SELECT * FROM NOTICE_BOARD";
		
		return null;
	}
}
