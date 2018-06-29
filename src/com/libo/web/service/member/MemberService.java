package com.libo.web.service.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.libo.web.entity.Member;
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
			  sql += "PASSWORD = ?, NICKNAME = ?, BIRTHDAY = ?, GENDER = ? \n";
			  sql += "WHERE ID = ? \n";
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getPassword());
			ps.setString(2, member.getNickname());
			ps.setString(3, member.getBirthday());
			ps.setString(4, member.getGender());
			ps.setString(5, member.getId());
			
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
		
		String sql = "SELECT count(ID) MEMBER WHERE ID = ? AND PASSWORD = ?";		
		
		try {
			conn = DBConn.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPassword());
			
			int cnt = ps.executeUpdate();			
			if(cnt == 1)
				chk = true;
			
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
	
	
}
