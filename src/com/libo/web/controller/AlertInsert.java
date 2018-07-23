package com.libo.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Alert;
import com.libo.web.service.member.AlertService;


@WebServlet("/member/alert/edit")
public class AlertInsert extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		AlertService as = new AlertService();
		Alert alert =  new Alert(
				 request.getParameter("week"),
				 request.getParameter("time"),
				 request.getParameter("sDate"),
				 request.getParameter("dDate"),
				 request.getParameter("id")
			);
		as.insertAlert(alert);
	}

}
