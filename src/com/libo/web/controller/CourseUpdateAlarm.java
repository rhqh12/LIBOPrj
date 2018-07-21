package com.libo.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Course;
import com.libo.web.service.member.CourseService;

@WebServlet("/member/course/updateAlarm")
public class CourseUpdateAlarm extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		CourseService service = new CourseService();
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
		
		int cnt = service.updateCourseAlarm(new Course(id, flag, flag));
		PrintWriter out = response.getWriter();
		if(cnt!=0) {
			out.print("success");
		} else {
			out.print("error");
		}

	}

}
