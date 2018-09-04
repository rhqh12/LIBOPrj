package com.libo.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
		Alert alert = null;
		
		
		String memberId = "test";
		String[] week = {"일","월","화","수","목","금","토"};
		
		SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd");
		
		
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.add(Calendar.DATE, 1);
		
		Date tomorrow = c.getTime();
		
		String stDate = f1.format(tomorrow);
		
		alert = new Alert("","12:00",stDate,memberId);
		
		request.setAttribute("alert", alert);
		request.setAttribute("week", week);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/alert/reg.jsp");
		dispatcher.forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//2018-07-15
		
		SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat f3 = new SimpleDateFormat("yy/mm/dd HH:mm");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = "test";
	
		String time_ = request.getParameter("time");
		String date_ = request.getParameter("datepicker");
		
		String time = null;
		String date = f1.format(new Date());
		
		
		String week = request.getParameter("week");
		
		if(time_!= null && !time_.equals("") ) {
			time = time_;
		}		
		
		if(date_!= null && !date_.equals("")) {
			date = date_;
		}
		
		String newDate = date+" "+time;
		
		AlertService as = new AlertService(); 
		Alert alert =  new Alert( week, time, newDate, id );
		as.insertAlert(alert);			 
		
		response.sendRedirect("list");
	}
	
}
