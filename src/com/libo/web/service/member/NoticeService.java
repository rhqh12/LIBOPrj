package com.libo.web.service.member;
import com.libo.web.entity.Notice;
import com.libo.web.entity.PlaceFav;
import com.libo.web.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
				notice = new Notice(
								rs.getInt("ID"),
								rs.getString("SUBJECT"),
								rs.getString("CONSTANT"),
								rs.getString("WRITER_ID"),
								rs.getString("DUE_DATE")
							);
			}
		
			System.out.println(notice.toString());
	}catch(SQLException e) {
			e.printStackTrace();
	}finally {
		DBConn.close(conn, rs, ps);
	}
	return notice;
}
	public List<Notice> getNoticeList(int page) {
		List<Notice> list = new ArrayList<Notice>();
		
		Connection conn = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		String sql = "select * from \n" + "(select rownum num, n.* from \n"+
		"(select * from notice_board order by due_date desc) n) \n"+"where num between ? and ?";
		System.out.println(sql);
		try {
			
			conn = DBConn.getConnection();			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page-1)*10+1);
			ps.setInt(2, page*10);
			rs = ps.executeQuery();

			while (rs.next()) {
				Notice notice = new Notice(rs.getInt("ID"), rs.getString("SUBJECT"), rs.getString("CONSTANT"),rs.getString("WRITER_ID"),rs.getString("DUE_DATE"));				 
				list.add(notice);			 
			}			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, rs, ps);
		}
		
		return list;
	}
}
