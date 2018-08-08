package com.libo.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.api.APIExamSearchAddress;
import com.libo.web.entity.Course;

@WebServlet("/member/course/address")
public class CourseAddress extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=UTF-8");
		String address = "";
		String result = "";

		String address_ = request.getParameter("address");
		if (address_ != null && !address_.equals("")) {
			address = address_;
			result = APIExamSearchAddress.getAddress(address).toString();
		}
		
		PrintWriter out = response.getWriter();
		out.print(result);
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

		Course course = new Course(id, startingTime, startingAlarm, workplace, workplaceAddress, endingTime,
				endingAlarm, home, homeAddress, week, writerId, null);

		request.setAttribute("c", course);
		request.setAttribute("type", type);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/course/search.jsp");
		dispatcher.forward(request, response); // 참조 전달

	}

}
