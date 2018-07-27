package com.libo.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Course;
import com.libo.web.entity.Notice;
import com.libo.web.service.member.CourseService;

import sun.rmi.server.Dispatcher;

@WebServlet("/member/course/detail")
public class CourseDetail extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String writerId = request.getParameter("writerId");
		String type = request.getParameter("type");

		// 기본값은 0
		long courseId = 0;

		String courseId_ = request.getParameter("id");

		if (courseId_ != null && !courseId_.equals("")) {
			courseId = Long.parseLong(courseId_);
		}

		Course course = null;
		CourseService courseService = new CourseService();
		
		
		// ==처음 들어오면===============================================================
		if(type.equals("list")) {
			if (courseId == 0) { // 기본값
				course = new Course(0, "09:00", "Y", "기본값일터", "기본값일터주소", 
						"18:00", "Y", "기본값홈", "기본값홈주소", "월,화,수,목,금",
						"test", "18/07/23");
			} else { // 변경값
				course = courseService.getCourse(courseId);
			}
		// ==update페이지에서 오면========================================================
		} else{
			course = new Course(id, startingTime, startingAlarm, workplace, workplaceAddress, endingTime,
					endingAlarm, home, homeAddress, week, writerId, null);
		}

		request.setAttribute("c", course);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/course/detail.jsp");
		dispatcher.forward(request, response); // 참조 전달

	}

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
		String writerId = request.getParameter("writerId");
		String type = request.getParameter("type");

		// 기본값은 0
		long courseId = 0;

		String courseId_ = request.getParameter("id");

		if (courseId_ != null && !courseId_.equals("")) {
			courseId = Long.parseLong(courseId_);
		}

		Course course = null;
		CourseService courseService = new CourseService();
		
		
		// ==처음 들어오면===============================================================
		if(type.equals("list")) {
			if (courseId == 0) { // 기본값
				course = new Course(0, "09:00", "Y", "기본값일터", "기본값일터주소", 
						"18:00", "Y", "기본값홈", "기본값홈주소", "월,화,수,목,금",
						"test", "18/07/23");
			} else { // 변경값
				course = courseService.getCourse(courseId);
			}
		// ==update페이지에서 오면========================================================
		} else{
			course = new Course(id, startingTime, startingAlarm, workplace, workplaceAddress, endingTime,
					endingAlarm, home, homeAddress, week, writerId, null);
		}

		request.setAttribute("c", course);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/course/detail.jsp");
		dispatcher.forward(request, response); // 참조 전달

	}

}