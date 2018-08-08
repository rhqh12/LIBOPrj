package com.libo.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.libo.web.entity.Course;
import com.libo.web.entity.Member;
import com.libo.web.entity.Notice;
import com.libo.web.service.member.CourseService;

import sun.rmi.server.Dispatcher;

@WebServlet("/member/course/detail")
public class CourseDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = "test";
		if (member != null)
			writerId = member.getId(); // 초기값

		String id_ = request.getParameter("id");
		long id = 0L;

		if (id_ != null && !id_.equals("")) {
			id = Long.parseLong(id_);
		}
		Course course = null;
		CourseService courseService = new CourseService();
		if (id == 0) { // 기본값
			course = new Course(0, "09:00", "Y", "쌍용강북교육센터", "서울특별시 마포구 서교동 447-5 풍성빌딩 2,3,4층", "18:00", "Y",
					"우리유앤미아파트", "서울특별시 구로구 구로동 1277", "월,화,수,목,금", writerId, "18/07/23");
		} else { // 변경값
			course = courseService.getCourse(id);
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

		Course course = new Course(id, startingTime, startingAlarm, workplace, workplaceAddress, endingTime,
				endingAlarm, home, homeAddress, week, writerId, null);

		request.setAttribute("c", course);
		request.setAttribute("type", type);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/course/detail.jsp");
		dispatcher.forward(request, response); // 참조 전달

	}
}