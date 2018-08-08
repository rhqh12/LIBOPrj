
package com.libo.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.libo.web.entity.Notice;
import com.libo.web.service.member.NoticeService;

@WebServlet("/member/menu/notice/list")
public class NoticeList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int pageNo = 1;
		String pageNo_ = request.getParameter("p");
		if (pageNo_ != null && !pageNo_.equals(""))
			pageNo = Integer.parseInt(pageNo_);
		NoticeService service = new NoticeService();
		List<Notice> list = service.getNoticeList(pageNo);
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/member/menu/notice/list.jsp");
		dispatcher.forward(request, response);



	}
}
