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


@WebServlet("/member/update")
public class Update extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("join.jsp");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		request.setAttribute("member", member);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/update.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		
		
		String id = member.getId();
		String password = request.getParameter("password");
		member.setPassword(password);
		
		MemberService memberService = new MemberService();
		memberService.loginMember(member);
		boolean FLAG = memberService.loginMember(member);
		if(FLAG) {
		response.sendRedirect("./update-detail");
	}else {
		response.sendRedirect("?flag=fail");
	}

}
}
