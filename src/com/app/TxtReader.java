package com.app;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;

public class TxtReader {
    public static void read(String filename) {
	   
	     try{
	            //파일 객체 생성
	            File file = new File("C:/Users/DU Kang/mygithubprojects/myflexbag/src/com/app/"+filename+".txt");
	            //입력 스트림 생성
	            FileReader filereader = new FileReader(file);
	            //입력 버퍼 생성
	            BufferedReader bufReader = new BufferedReader(filereader);
	            String line = "";
	            int i = 0;
	            while((line = bufReader.readLine()) != null){
	            	i++;
	            	if(i<1800) continue;

	            	CrawlingItem.crawling(line);
	            	if (i % 50 == 0) System.out.println(i+"번째 줄 읽는 중...");
	            	if (i % 100 == 0) {
	            		Thread.sleep(5000);	            		
	            	}; //잠깐 쉬자                              
	            }
	            //.readLine()은 끝에 개행문자를 읽지 않는다.            
	            bufReader.close();
	        } catch (Exception e){
	        	e.printStackTrace();
	        }

    }
    
}
