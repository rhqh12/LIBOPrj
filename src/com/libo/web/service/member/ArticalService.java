package com.libo.web.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.libo.web.entity.Alert;
import com.libo.web.entity.Artical;
import com.libo.web.entity.Keyword;
import com.libo.web.util.DBConn;

public class ArticalService {
	// 목록
	public List<Artical> getArticalList() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Artical> list = new ArrayList<>();
		DateFormat formatter = new SimpleDateFormat("yy/MM/dd");
		
		
		String sql = "select * from artical order by DBMS_RANDOM.RANDOM ";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			//due_date
			
			//ps.setDate(1, "YY/MM/DD");// 매개변수 (순번, 넣을 값)
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Artical artical = new Artical();
				artical = new Artical(
							rs.getInt("id"),
							rs.getString("subject"),
							rs.getString("link"),
							rs.getString("content"),
							rs.getString("img_src"),
							rs.getInt("clicks"),
							rs.getInt("keyword_id")
						);
				list.add(artical);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, rs, ps);
		}
		return list;
	}
	
	
	private void getArtical() {
		
	}
	
	public void insertArtical(Artical artical) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "INSERT INTO Artical(ID, SUBJECT, LINK, KEYWORD_ID, CONTENT, IMG_SRC) VALUES(NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, artical.getSubject());
			ps.setString(2, artical.getLink());
			ps.setLong(3, artical.getKeywordId());
			ps.setString(4, artical.getContent());
			ps.setString(5, artical.getImgSrc());
			int cnt = ps.executeUpdate();
			if (cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}		
	}
	public Keyword getArticalKeyword(String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Keyword keyword = null;
		
		String sql = "SELECT id, name FROM KEYWORD WHERE name = ?";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			if (rs.next()) {				
				keyword = new Keyword(
						rs.getString("name"),
						rs.getInt("id")
						);				
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
		return keyword;			
	}
	
	public void insertArticalKeyword(Keyword keyword) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "INSERT INTO KEYWORD(ID, NAME) VALUES(NO_SEQ.NEXTVAL, ?)";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, keyword.getName());
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
