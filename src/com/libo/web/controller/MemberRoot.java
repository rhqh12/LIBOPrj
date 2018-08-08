package com.libo.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.libo.web.entity.Artical;
import com.libo.web.entity.Course;
import com.libo.web.entity.Member;
import com.libo.web.service.member.ArticalService;
import com.libo.web.service.member.CourseService;

@WebServlet("/member/")
public class MemberRoot extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNo = 1;
		
		String pageNo_ = request.getParameter("page");
		
		if(pageNo_!= null && !pageNo_.equals(""))
			pageNo = Integer.parseInt(pageNo_);
		
		
		ArticalService service = new ArticalService();
		CourseService courseService = new CourseService();
		
		List<Artical> list = service.getArticalList(pageNo);
		HttpSession session=request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		System.out.println(member);
		if(member == null) {
			response.sendRedirect("login");
		} else {
			List<Course> course = courseService.getCourseList(member.getId());
			
			request.setAttribute("list", list);
			request.setAttribute("course", course);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/index.jsp");
			dispatcher.forward(request, response);
			
		}
			
	}

	
}
