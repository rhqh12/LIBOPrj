package com.libo.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Artical;
import com.libo.web.service.member.ArticalService;

@WebServlet("/member/")
public class MemberRoot extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArticalService service = new ArticalService();
		
		List<Artical> list = service.getArticalList();
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/index.jsp");
		dispatcher.forward(request, response);
	}

	
}
