package com.app;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;

public class TxtReader {
    public static void read(String filename) {
	   
	     try{
	            //���� ��ü ����
	            File file = new File("C:/Users/DU Kang/mygithubprojects/myflexbag/src/com/app/"+filename+".txt");
	            //�Է� ��Ʈ�� ����
	            FileReader filereader = new FileReader(file);
	            //�Է� ���� ����
	            BufferedReader bufReader = new BufferedReader(filereader);
	            String line = "";
	            int i = 0;
	            while((line = bufReader.readLine()) != null){
	            	i++;
	            	if(i<1800) continue;

	            	CrawlingItem.crawling(line);
	            	if (i % 50 == 0) System.out.println(i+"��° �� �д� ��...");
	            	if (i % 100 == 0) {
	            		Thread.sleep(5000);	            		
	            	}; //��� ����                              
	            }
	            //.readLine()�� ���� ���๮�ڸ� ���� �ʴ´�.            
	            bufReader.close();
	        } catch (Exception e){
	        	e.printStackTrace();
	        }

    }
    
}
