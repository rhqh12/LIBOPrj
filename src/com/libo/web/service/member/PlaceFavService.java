package com.libo.web.service.member;
import com.libo.web.entity.PlaceFav;
import com.libo.web.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PlaceFavService {
	
	public List<PlaceFav> getPlaceFavList(String memberId) {
		String sortKey = "DUE_DATE DESC";		
		getPlaceFavList(memberId, sortKey);
		return null;
	}
	
	public List<PlaceFav> getPlaceFavList(String memberId, String sortKey) {
		
		List<PlaceFav> list = new ArrayList<PlaceFav>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT LOCATION, ADDRESS, DUE_DATE WHERE = ? ORDER BY ?";
		
		try {
			conn = DBConn.getConnection();			
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberId);
			ps.setString(2, sortKey);
			
			rs = ps.executeQuery(sql);

			while (rs.next()) {
				PlaceFav placeFav = new PlaceFav();
				placeFav = new PlaceFav(
							rs.getString("LOCATION"),
							rs.getString("ADDRESS"),
							rs.getString("DUE_DATE")
						);
				list.add(placeFav);				 
			}			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, rs, ps);
		}
		
		return list;
	}
	public int getPlaceFavCount(String memberId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) as cnt FROM PLACE_FAV WHERE ID = ?";
		
		int cnt = 0;
		try {
			conn = DBConn.getConnection();			
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberId);
			
			rs = ps.executeQuery(sql);
			cnt = rs.getInt(cnt);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, rs, ps);
		}
		
		return cnt;
	}
	
	public void insertPlaceFav(PlaceFav placeFav) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "INSERT INTO PLACE_FAV(ID, WRITER_ID, LOCATION, ADDRESS, DUE_DATE) VALUES(?, ?, ?, ?, ?)";
				
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, placeFav.getId());	//매개변수 (순번, 넣을 값)
			ps.setString(2, placeFav.getWriterId());
			ps.setString(3, placeFav.getLocation());
			ps.setString(4, placeFav.getAddress());
			ps.setString(5, placeFav.getDueDate());
			int cnt = ps.executeUpdate();
			
			if(cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}
	public void deletePlaceFav(long[] id) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "DELETE FROM MEMBER WHERE ID = ?";
		
		
		try {			
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < id.length; i++) {
				ps.setLong(1, id[i]);
				
				int cnt = ps.executeUpdate();
				
				if(cnt == 1)
					System.out.println("성공");				
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}
	
}
