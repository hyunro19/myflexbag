package com.app;

import java.util.List;

public class Main {

	public static void main(String[] args) {

		// "www.balaan.co.kr"에서 이미지 가져오기
		// CrawlingList → TxtWriter 순으로 실행
		String url;
		for (int i=1; i<=20; i++) {
			url = "http://myflexbag.com/list.mc?page="+i;
			List<String> list = CrawlingList.crawling(url);
			TxtWriter.write("list", list);
		}

		// TextReader → CrawlingItem → SqlGen 순으로 실행 (비동기 문제로 콜백 방식으로 구현)
		TxtReader.read("list");

	}

}
