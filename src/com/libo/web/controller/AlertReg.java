
package com.libo.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Alert;
import com.libo.web.entity.Course;
import com.libo.web.service.member.AlertService;
import com.libo.web.service.member.CourseService;

@WebServlet("/member/alert/reg")
public class AlertReg extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] week = {"일","월","화","수","목","금","토"};
		
		request.setAttribute("week", week);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/alert/reg.jsp");
		dispatcher.forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("?");
//		/Alert [id=4, week=월,화,수,목,금, time=2018-06-27 00:00:00.0, specificDate=2018-06-27 00:00:00.0, writerId=test]
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = "test";
	
		String time_ = request.getParameter("time");
		String date_ = request.getParameter("datepicker");
		
		String time = null;
		String date = "2018-01-01";
		String week = request.getParameter("week");
		
		if(time_!= null && !time_.equals(""))
			time = time_;

		if(date_!= null && !date_.equals(""))
			date = date_;
		
		if(time!= null && !time.equals("")) {
			try {
				time =  new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("hh:mm a").parse(time));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		String oldDate = date+" "+time;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(oldDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		AlertService as = new AlertService();
//		Alert alert =  new Alert(
//				 request.getParameter("week"),
//				 request.getParameter("time"),
//				 request.getParameter("sDate"),
//				 request.getParameter("dDate"),
//				 request.getParameter("id"),
//				 request.getParameter("flag")
//			);
//		as.insertAlert(alert);
		
		response.sendRedirect("list");
	}
	
}
