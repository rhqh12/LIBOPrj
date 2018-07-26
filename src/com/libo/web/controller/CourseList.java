package com.libo.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Course;
import com.libo.web.service.member.CourseService;

@WebServlet("/member/course/list")
public class CourseList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String writeId = "test"; // 초기값
		String writeId_ = request.getParameter("writeId");

		if (writeId_ != null && !writeId_.equals(""))
			writeId = writeId_;

		CourseService courseService = new CourseService();
		List<Course> list = courseService.getCourseList(writeId);

		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/course/list.jsp");
		dispatcher.forward(request, response); // 참조 전달
	}

}
