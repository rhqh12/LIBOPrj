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


@WebServlet("/member/update-detail")
public class UpdateDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("join.jsp");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		MemberService memberService = new MemberService();
		member = memberService.getMember(member.getId());
		request.setAttribute("member", member);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/update-detail.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String id = member.getId();
		
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String nickname = request.getParameter("nickname");

		
		member.setPassword(password);
		member.setNickname(nickname);
	
		MemberService memberService = new MemberService();
		memberService.updateMember(member);
		
		
		boolean FLAG = memberService.loginMember(member);
		if(FLAG) {
		response.sendRedirect("./update-detail");
	}else {
		response.sendRedirect("?flag=fail");
	}

}
}
