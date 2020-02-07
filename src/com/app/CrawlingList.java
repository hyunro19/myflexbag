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
			links = doc.body().select("li[class=pdtItem] a");

		} catch (IOException e) {
			e.printStackTrace();
		}
		List<String> itemUrls = new ArrayList<>();
		
		for (Element item : links) {
			String temp;
			if (item.attr("href") == "" || item.attr("href") == null) continue;
			else temp = item.attr("href"); 
			temp = "http://balaan.co.kr"+temp;
			itemUrls.add(temp);
		}
		
		return itemUrls;		
	}
}