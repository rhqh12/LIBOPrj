package com.libo.web.util;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.libo.web.entity.Artical;
import com.libo.web.entity.Keyword;
import com.libo.web.service.member.ArticalService;
public class Test{
    public static void main(String[] args) throws Exception{
    	ArticalService service = new ArticalService();
    	String url = "https://news.naver.com/"; 
    	Document doc;
    	Elements ele;
    	String str;
    	
    	//1. 카테고리 추가
    	doc = Jsoup.connect(url+"main/ranking/popularDay.nhn").get();
    	ele = doc.select("li.ranking_category_item");
    	str = ele.html();
    	
    	//sectionId=100&
    	Pattern ptn = Pattern.compile("sectionId=([0-9a-z-A-Z]*)"); 
    	Matcher matcher;
    	
    	List<Map<String, String>> articleList = new ArrayList<>();
    	for(Element el : ele) {
    		Keyword key;
    		String sectionId;
    		String href = el.select("a").attr("href");
    		String keyword = el.select("a").text().replaceAll("선택됨", "");
    		matcher = ptn.matcher(href); 
    		
    		if(service.getArticalKeyword(keyword) == null) {
    			key = new Keyword();
    			key.setName(keyword);
    			service.insertArticalKeyword(key);
    		}
    		
    		key = service.getArticalKeyword(keyword);
    		
    		if(matcher.find()) {
    			sectionId = matcher.group(1);
        		doc = Jsoup.connect(url+href).get();
        		Elements ele2 = doc.select("ol.ranking_list li.ranking_item");
        		
        		for(Element el2 : ele2) {
        			Map<String, String> article = new HashMap<>();
        			
        			article.put("keyword", String.valueOf(key.getId()));
        			article.put("secId", sectionId);
        			article.put("link", url+el2.select("a").attr("href"));
        			article.put("subject", el2.select("div.ranking_headline").text());
        			article.put("conent", el2.select("div.ranking_lede").text());
        			article.put("img", el2.select("div.ranking_thumb img").attr("src"));
        			articleList.add(article);
        		}
    		}
    	}
    	
    	for(Map<String, String> arr : articleList) {
    		Artical art = new Artical();
    		
        	art.setKeywordId(Integer.parseInt(arr.get("keyword")));
        	art.setLink(arr.get("link"));
        	art.setSubject(arr.get("subject"));
        	art.setContent(arr.get("conent"));
        	art.setImgSrc("");
        	if(!arr.get("img").equals("")) {
        		art.setImgSrc(arr.get("img"));
        	}
        	//service.insertArtical(art);
    	}
        
    }
}