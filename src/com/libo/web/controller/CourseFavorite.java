package com.libo.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.libo.web.entity.Course;
import com.libo.web.entity.PlaceFav;
import com.libo.web.service.member.CourseService;

@WebServlet("/member/course/favorite")
public class CourseFavorite extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain;charset=UTF-8");
		String writerId = "test";
		CourseService service = new CourseService();
		
		List<PlaceFav> list = service.getFavorite(writerId);
		
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();
		
		for(PlaceFav p : list) {
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
		
		CourseService service = new CourseService();
		
		String title = request.getParameter("title");
		String address = request.getParameter("address");
		String type = request.getParameter("type");
		PlaceFav placeFav = new PlaceFav(title, address);
		if(type.equals("insert")) {
			service.insertFavorite(placeFav);
		} else {
			service.deleteFavorite(placeFav);
		}

		PrintWriter out = response.getWriter();
		out.print("success");
	}

}
