
package com.libo.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.libo.web.entity.Alert;
import com.libo.web.service.member.AlertService;


@WebServlet("/member/alert/detail")
public class AlertDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		long id =  Long.parseLong(request.getParameter("id"));
		
		AlertService service = new AlertService();
		Alert alert = service.getAlert(id);
		
		String[] week = {"일","월","화","수","목","금","토"};
		
		
		request.setAttribute("alert", alert);
		request.setAttribute("week", week);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/alert/detail.jsp");
		dispatcher.forward(request, response);
	}

}

