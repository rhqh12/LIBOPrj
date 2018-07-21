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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//기본값은 0
		long courseId = 0;
		
		String courseId_ = request.getParameter("id");
		
		if(courseId_ != null && !courseId_.equals("")){
			courseId = Long.parseLong(courseId_);
		}

		CourseService courseService = new CourseService();
		Course course = courseService.getCourse(courseId);
		
		request.setAttribute("c", course);

		RequestDispatcher dispatcher = request.getRequestDispatcher("detail.jsp");
		dispatcher.forward(request, response); // 참조 전달
		
	}

}