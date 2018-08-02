package com.libo.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.libo.web.entity.Member;
import com.libo.web.service.member.MemberService;


@WebServlet("/member/login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		request.setAttribute("flag", flag);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/login.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		System.out.println(id);
		System.out.println(password);
//		String passwordCheck = request.getParameter("passwordCheck");
//		String nickname = request.getParameter("nickname");
//		String gender = request.getParameter("gender");
//		String birthday = request.getParameter("birthday");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		
		MemberService memberService = new MemberService();
		boolean FLAG = memberService.loginMember(member);
		if(FLAG) {
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		
		response.sendRedirect("./");
		}else {
			response.sendRedirect("?flag=fail");
		}
		
	}

}
