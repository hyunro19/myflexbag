package com.app;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;

public class TxtReader {
    public static void read(String filename) {
	   
	     try{
			File file = new File("./"+filename+".txt");
			FileReader filereader = new FileReader(file);
			BufferedReader bufReader = new BufferedReader(filereader);
			String line = "";
			int i = 0;
			while((line = bufReader.readLine()) != null){
				i++;
				if(i<1800) continue;

				CrawlingItem.crawling(line);
				if (i % 50 == 0) System.out.println(i+"번째 상품을 진행하고 있습니다...");
				if (i % 100 == 0) {
					Thread.sleep(5000);	            		
				};
			}
			bufReader.close();
		} catch (Exception e){
			e.printStackTrace();
		}

    }
    
}
