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

@WebServlet("/member/course/delete")
public class CourseDelete extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		CourseService courseService = new CourseService();
		String[] courseId_ = request.getParameterValues("delete-id");
		long[] courseId = new long[courseId_.length];
		
		if(courseId_!=null) {
			for (int i = 0; i < courseId_.length; i++) {
				courseId[i] = Long.parseLong(courseId_[i]);
			}
			courseService.deleteCourse(courseId);
		}
		
		response.sendRedirect("list");
		
	}

}