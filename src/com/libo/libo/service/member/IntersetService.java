package com.libo.libo.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.libo.libo.member.Interset;
import com.libo.libo.util.DBConn;

public class IntersetService {

	public static void main(String[] args) {
		IntersetService intersetService = new IntersetService();
		Interset interset = new Interset(1, 1, "test", 1);
		intersetService.insertInterset(interset);
	}

	public void insertInterset(Interset interset) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO INTEREST (ID, ARTICAL_ID, WRITER_ID, CLICKS) VALUES(?, ?, ?, ?)";
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, interset.getId()); // 매개변수 (순번, 넣을 값)
			ps.setInt(2, interset.getArticalId());
			ps.setString(3, interset.getWriterId());
			ps.setInt(4, interset.getClicks());
			int cnt = ps.executeUpdate();
			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}

	public List<Interset> getIntersetList(String memberId) {
		return null;
	}

}