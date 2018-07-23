package com.libo.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/alert/delete")
public class AlertDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_ = request.getParameter("id");
		String id;
		
		if(id_!= null && !id_.equals("")) {
			//id = id_;
			
			id = "1,2,3,4";
			
		}
		
	}

}
