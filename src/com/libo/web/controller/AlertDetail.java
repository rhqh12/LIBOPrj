
package com.libo.web.controller;

import java.io.IOException;
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

@WebServlet("/member/alert/detail")
public class AlertDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		long id =  Long.parseLong(request.getParameter("id"));
		
		AlertService service = new AlertService();
		Alert alert = null;
		
		String[] week = {"일","월","화","수","목","금","토"};
	
		// 기본값은 0
		long alertId = 0;

		String alertId_ = request.getParameter("id");

		if (alertId_ != null && !alertId_.equals("")) {
			alertId = Long.parseLong(alertId_);
		}
		
		if(alertId == 0) {
			
		} else {
			alert = service.getAlert(id);
		}	
		
		request.setAttribute("alert", alert);
		request.setAttribute("week", week);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/alert/detail.jsp");
		dispatcher.forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String memberId = "test";
		
		long id = Long.parseLong(request.getParameter("id"));
	
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
		Alert alert =  new Alert( id, week, time, newDate, memberId );
		as.updateAlert(alert);			 
		
		response.sendRedirect("list");
	}
}

