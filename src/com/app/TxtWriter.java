package com.app;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

public class TxtWriter {
    public static void write(String filename, List<String> content) {
		BufferedOutputStream bs = null;
			try {
				bs = new BufferedOutputStream(new FileOutputStream("./"+filename+".txt", true));
				for (String str : content) {
					str += "\n";
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
				bs = new BufferedOutputStream(new FileOutputStream("./"+filename+".txt", true));
				bs.write( content.getBytes() ); 			
				bs.close();
			} catch (Exception e) {
					e.printStackTrace();
			} 
    }
}
