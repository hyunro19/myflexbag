package com.controller;

import java.io.FileOutputStream;
import org.springframework.web.multipart.MultipartFile;

public class Util {
	public static void saveFile(MultipartFile mf) {
		String dir = "C:\\Users\\DU Kang\\Videos\\workspace_eclipse\\mc.iot.05semi1\\web\\view\\img\\";
		byte [] data;
		String imgname = mf.getOriginalFilename();
		try {
			data = mf.getBytes();
			FileOutputStream fo = new FileOutputStream(dir+imgname);
			fo.write(data);
			fo.close();
		}catch(Exception e) {
			
		}
		
	}
	
}




