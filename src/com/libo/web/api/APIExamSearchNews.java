package com.libo.web.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class APIExamSearchNews {
	String clientId = "";
	String clientSecret = "";
	public APIExamSearchNews() {
        clientId = "A96TZsmCG2zNO64FRctj";//애플리케이션 클라이언트 아이디값";
        clientSecret = "gAEW_YLfsS";//애플리케이션 클라이언트 시크릿값";		
	}
	
	public StringBuffer getNews(String field) {
		StringBuffer response = new StringBuffer();
		
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
				System.out.println(inputLine);
				System.out.println("\n\n");
				response.append(inputLine);
			}
			br.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return response;
		
	}
}
