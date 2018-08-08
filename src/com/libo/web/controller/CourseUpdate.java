package com.libo.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.libo.web.entity.Course;
import com.libo.web.entity.Member;
import com.libo.web.service.member.CourseService;

@WebServlet("/member/course/update")
public class CourseUpdate extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		long id = Long.parseLong(request.getParameter("id"));
		String startingTime = request.getParameter("startingTime");
		String startingAlarm = request.getParameter("startingAlarm");
		String workplace = request.getParameter("workplace");
		String workplaceAddress = request.getParameter("workplaceAddress");
		String endingTime = request.getParameter("endingTime");
		String endingAlarm = request.getParameter("endingAlarm");
		String home = request.getParameter("home");
		String homeAddress = request.getParameter("homeAddress");
		String week = request.getParameter("week");
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = "test";
		if(member != null)
			writerId = member.getId();

		Course course = new Course(id, startingTime, startingAlarm, workplace, workplaceAddress, endingTime,
				endingAlarm, home, homeAddress, week, writerId, null);
		
		CourseService service = new CourseService();
		if(id == 0) 
			service.insertCourse(course);
		else 
			service.updateCourse(course);
		
		response.sendRedirect("list");
		
	}

}