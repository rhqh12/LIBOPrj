package com.libo.web.service.member;

import com.libo.web.entity.PlaceFav;
import com.libo.web.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlaceFavService {

	public List<PlaceFav> getFavorite(String writerId) {

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
	}

}
