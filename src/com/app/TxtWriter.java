package com.app;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

public class TxtWriter {
    public static void write(String filename, List<String> content) {
    	
	BufferedOutputStream bs = null;
		try {
			bs = new BufferedOutputStream(new FileOutputStream("C:/Users/DU Kang/mygithubprojects/myflexbag/src/com/app/"+filename+".txt", true));
			for (String str : content) {
				str += "\n";
				//Byte형으로만 넣을 수 있음
				bs.write( str.getBytes() ); 			
			}
			bs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
    }
    
    public static void write(String filename, String content) {
    	
	BufferedOutputStream bs = null;
		try {
			bs = new BufferedOutputStream(new FileOutputStream("C:/Users/DU Kang/mygithubprojects/myflexbag/src/com/app/"+filename+".txt", true));
			
				//Byte형으로만 넣을 수 있음
				bs.write( content.getBytes() ); 			
			bs.close();
		} catch (Exception e) {
                e.printStackTrace();
		} 
    }
}
