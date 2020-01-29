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
			// lz-lazyload 클래스를 가진 img들 추출
			imgs = doc.select("div[class=content] > div[class=images] > img"); 

		} catch (IOException e) {
			e.printStackTrace();
		}
		// 이미지 주소를 담을 리스트 생성
		List<String> imageUrls = new ArrayList<>();
		
		for (Element img : imgs) {
			String temp;
			// 이미지주소가 null이거나 ""인 경우는 리스트에 넣지 않고 패스
			if (img.attr("abs:src") == "" || img.attr("abs:src") == null) continue;
			else temp = img.attr("abs:src");
			imageUrls.add(temp);
		}
		
		SqlGen.generate(imageUrls);
		return imageUrls;		
	}
}