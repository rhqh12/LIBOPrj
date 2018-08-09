package com.libo.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.libo.web.entity.Member;
import com.libo.web.service.member.AlertService;

/**
 * Servlet implementation class Push
 */
@WebServlet("/push")
public class Push extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();

		Member member = (Member)session.getAttribute("member");
		
		AlertService alert = new AlertService();
		
		String alertCount = alert.getPushAlert(member.getId());
		
		PrintWriter out = response.getWriter();
		out.print(alertCount);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
