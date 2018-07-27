package com.libo.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Alert;
import com.libo.web.entity.Course;
import com.libo.web.service.member.AlertService;
import com.libo.web.service.member.CourseService;

@WebServlet("/member/alert/updateAlarm")
public class AlertUpdateAlarm extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		AlertService service = new AlertService();
		long id = 0L;
		String flag = "";
		
		String id_ = request.getParameter("id");
		String flag_ = request.getParameter("flag");
		if(id_ != null && !flag_.equals("")) {
			id = Long.parseLong(id_);
		}
		if(flag_ != null && !flag_.equals("")) {
			flag = flag_;
		}
		
		int cnt = service.updateAlertAlarm(new Alert(id, flag));
		PrintWriter out = response.getWriter();
		
		if(cnt!=0) {
			out.print("success");
		} else {
			out.print("error");
		}

	}
}
