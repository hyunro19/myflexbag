package com.app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CrawlingItem {

	public static List<String> crawling(String url) {
		Document doc;
		Elements imgs = null;

		try {
			doc = Jsoup.connect(url).timeout(1000000).get();
			// 추출할 이미지 url만 해당되는 태그, 속성을 기준으로 셀렉터 설정
			imgs = doc.select("div[class=content] > div[class=images] > img"); 

		} catch (IOException e) {
			e.printStackTrace();
		}
		List<String> imageUrls = new ArrayList<>();
		
		for (Element img : imgs) {
			String temp;
			if (img.attr("abs:src") == "" || img.attr("abs:src") == null) continue;
			else temp = img.attr("abs:src");
			imageUrls.add(temp);
		}
		
		SqlGen.generate(imageUrls);
		return imageUrls;		
	}
}