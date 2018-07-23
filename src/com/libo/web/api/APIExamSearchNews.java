package com.libo.web.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class APIExamSearchNews {
	String clientId = "";
	String clientSecret = "";
	public APIExamSearchNews() {
        clientId = "A96TZsmCG2zNO64FRctj";//애플리케이션 클라이언트 아이디값";
        clientSecret = "gAEW_YLfsS";//애플리케이션 클라이언트 시크릿값";		
	}
	//http://www.weather.go.kr/weather/lifenindustry/sevice_rss.jsp
	//https://javaking75.blog.me/220091928699
	//http://yoo-hyeok.tistory.com/36
	
	public static void main(String[] args) throws ParseException {
		APIExamSearchNews api = new APIExamSearchNews();
		StringBuilder list = new StringBuilder();
		
		list = api.getNews("JAVA");
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = new JSONObject();
		//list.toString()
		//jsonObject = (JSONObject) parser.parse(String.valueOf(list));
		jsonObject = (JSONObject) parser.parse(list.toString());
		
		/*JSONObject jsonObj = new JSONObject(list.toString());*/
		
		/*
		 * originallink  오리지널 링크
		 * link 네이버 링크
		 * description 내용
		 * title 타이틀
		 * pubDate 등록일
		 */
		System.out.println(jsonObject);
		JSONArray returnTitle = (JSONArray)jsonObject.get("title");
		System.out.println(returnTitle);
		
		JSONArray returnIitems = (JSONArray)jsonObject.get("items");
		for(int i=0;i<returnIitems.size();i++){
			JSONObject returnSubject = (JSONObject) returnIitems.get(i);
			System.out.println("link : "+returnSubject.get("link"));
			System.out.println();
			System.out.println("title : "+returnSubject.get("title"));
			System.out.println();
			System.out.println("description : "+returnSubject.get("description"));
			System.out.println();
			System.out.println("pubDate : "+returnSubject.get("pubDate"));
			System.out.println("----------");
		}


		
	}
	
	public StringBuilder getNews(String field) {
		StringBuilder response = new StringBuilder();
		
		try {
			String text = URLEncoder.encode(field, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text; // json 결과
			//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return response;
		
	}
}
