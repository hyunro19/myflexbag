package com.app;

import java.util.List;

public class SqlGen {
	public static void generate(List<String> imageUrls) {
		String cateid;
		String sizeid;
		String colorid;
		String brandid;
		String matid;
		String pname;
		int price;
		int pstock;
		String[] imgs = new String[5];
		String sql;
		
		// 제품 테이블에서 이미지 외 다른 속성들은 랜덤으로 추출
		String[] cateids = new String[]{"shoulder","tote","backpack","messenger","clutch","wallet","etc"};
		String[] sizeids = new String[]{"free","small","medium","large"};
		String[] colorids = new String[]{"balck","blue","red","green","yellow","orange","pink","navy","grey", "etc"};
		String[] brandids = new String[]{"louisvuiton","chanel","ysl","prada","gucci","fendi","botegaveneta","givency","tumi", "cartier", "hermes"};
		String[] matids = new String[]{"calfskin","lambskin","aligator","artificialleather","cotton","knit","nylon"};
						
		cateid = cateids[ (int)(Math.random()*cateids.length) ];
		sizeid = sizeids[ (int)(Math.random()*sizeids.length) ];
		colorid = colorids[ (int)(Math.random()*colorids.length) ];
		brandid = brandids[ (int)(Math.random()*brandids.length) ];
		matid = matids[ (int)(Math.random()*matids.length) ];
		pname = brandid+"_"+(int)(Math.random()*1000);
		price = (int)(Math.random()*100)*10000;
		pstock = (int)(Math.random()*20);

		for (int i=0; i<Math.min( 5, imageUrls.size() ); i++) {
			if ( imageUrls.get(i)!=null ) imgs[i] = imageUrls.get(i);
		}
		
		sql = "INSERT INTO Lproduct VALUES(Lproduct_seq.nextval, "
				+"'"+cateid+"', '"+sizeid+"', '"+colorid+"', '"+brandid+"', '"+matid+"', '"+pname+"', '"+price+"', '"+pstock+"', sysdate, '"+imgs[0]+"', '"+imgs[1]+"', '"+imgs[2]+"', '"+imgs[3]+"', '"+imgs[4] +"'); \n";
				
		TxtWriter.write("sqls", sql);
	}
}
