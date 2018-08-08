package com.libo.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.libo.web.entity.Member;
import com.libo.web.entity.PlaceFav;
import com.libo.web.service.member.CourseService;
import com.libo.web.service.member.PlaceFavService;

@WebServlet("/member/course/favorite")
public class CourseFavorite extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=UTF-8");

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = "test";
		if(member != null)
			writerId = member.getId(); // 초기값

		PlaceFavService service = new PlaceFavService();
		List<PlaceFav> list = service.getFavorite(writerId);
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();

		for (PlaceFav p : list) {
			JSONObject item = new JSONObject();
			item.put("title", p.getLocation());
			item.put("address", p.getAddress());
			array.add(item);
		}

		object.put("items", array);
		PrintWriter out = response.getWriter();
		out.print(object.toJSONString());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = "test";
		if(member != null)
			writerId = member.getId();

		PlaceFavService service = new PlaceFavService();

		String title = request.getParameter("title");
		String address = request.getParameter("address");
		String flag = request.getParameter("flag");
		PlaceFav placeFav = new PlaceFav(title, address, writerId);

		if (flag.equals("insert"))
			service.insertFavorite(placeFav);
		else
			service.deleteFavorite(placeFav);

		PrintWriter out = response.getWriter();
		out.print("success");
	}

}
