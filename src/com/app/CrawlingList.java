package com.app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CrawlingList {

	public static List<String> crawling(String url) {

		Document doc;
		Elements links = null;

		try {
			doc = Jsoup.connect(url).timeout(100000).get();
			// lz-lazyload 클래스를 가진 a 태그들 추출
			links = doc.body().select("li[class=pdtItem] a");
//			TxtWriter.write("temp", doc.toString());
//			System.out.println(links);

		} catch (IOException e) {
			e.printStackTrace();
		}
		// 이미지 주소를 담을 리스트 생성
		List<String> itemUrls = new ArrayList<>();
		
		for (Element item : links) {
			String temp;
			// 주소가 null이거나 ""인 경우는 리스트에 넣지 않고 패스
			if (item.attr("href") == "" || item.attr("href") == null) continue;
			else temp = item.attr("href"); 
			temp = "http://balaan.co.kr"+temp;
			itemUrls.add(temp);
		}
		
		return itemUrls;		
	}
}