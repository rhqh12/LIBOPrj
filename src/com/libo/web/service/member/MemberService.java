package com.libo.web.service.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.libo.web.entity.Member;
import com.libo.web.entity.Notice;
import com.libo.web.util.DBConn;

public class MemberService {
	//회원가입
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "INSERT INTO MEMBER(ID, PASSWORD, NICKNAME, BIRTHDAY, GENDER) VALUES(?, ?, ?, ?, ?)";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPassword());
			ps.setString(3, member.getNickname());
			ps.setString(4, member.getBirthday());
			ps.setString(5, member.getGender());
			
			int cnt = ps.executeUpdate();
			
			if(cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}	
	
	//회원정보 수정
	public void updateMember(Member member) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "UPDATE MEMBER SET \n";
			  sql += "PASSWORD = ?, NICKNAME = ? \n";
			  sql += "WHERE ID = ? \n";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getPassword());
			ps.setString(2, member.getNickname());
			ps.setString(3, member.getId());
			
			int cnt = ps.executeUpdate();
			
			if(cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}			
	}
	public void deleteMember(Member member) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String sql = "DELETE FROM MEMBER WHERE ID = ?";
		
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			
			int cnt = ps.executeUpdate();
			
			if(cnt == 1)
				System.out.println("성공");
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, ps);
		}
	}
	
	//로그인
	public boolean loginMember(Member member) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean chk = false;
		
		String sql = "SELECT COUNT(ID) COUNT FROM MEMBER WHERE ID = ? AND PASSWORD = ?";		
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPassword());
			
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getInt("COUNT") > 0) chk = true;
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, rs, ps);
		}
		
		
		return chk;		
	}
	
	//로그아웃
	public void logoutMember(Member member) {
		
	}
	
	//회원정보 가져오기
	public Member getMember(String id) {
		
		Member member = new Member();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT id, password, nickname,  to_char(birthday,'YYYY-MM-DD') birthday, gender FROM MEMBER WHERE ID = ?";		
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				member = new Member(
						rs.getString("id"),
						rs.getString("password"),
						rs.getString("nickname"),
						rs.getString("birthday"),
						rs.getString("gender")
					);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBConn.close(conn, rs, ps);
		}
		
		return member;
		
	}
	
	
}
