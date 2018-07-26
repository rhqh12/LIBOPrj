package com.libo.web.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class APIExamSearchAddress {

	public static void main(String[] args) {
		String clientId = "A96TZsmCG2zNO64FRctj";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "gAEW_YLfsS";// 애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode("우리유앤미아파트", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text; // json 결과
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			// response를 활용해 json객체를 만든다.
			System.out.println(response.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static StringBuilder getAddress(String address) {

		String clientId = "A96TZsmCG2zNO64FRctj";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "gAEW_YLfsS";// 애플리케이션 클라이언트 시크릿값";
		StringBuilder response = new StringBuilder();
		try {
			String text = URLEncoder.encode(address, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text + "&sort=random&display=100"; // json 결과
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;

	}

}
