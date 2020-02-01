package com.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ItemVO {
	private int pid;
	private String cateid;
	private String sizeid;
	private String colorid;
	private String brandid;
	private String matid;
	
	private String pname;
	private int price;
	private int pstock;
	private Date pdate;
	
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	MultipartFile mf1;
	MultipartFile mf2;
	MultipartFile mf3;
	MultipartFile mf4;
	MultipartFile mf5;
	
	private String sortcon;
	private String sortorder; //ASC, DESC
	private String searchcon;
	private String searchkwd;
	
	//Default Constructor
	public ItemVO() {
		super();
		this.page = 1;
		this.perPageNum = 30;
	}
	
	public ItemVO(String cateid, String sizeid, String colorid, String brandid, String matid, String pname, int price,
			int pstock, String img1) {
		super();
		this.cateid = cateid;
		this.sizeid = sizeid;
		this.colorid = colorid;
		this.brandid = brandid;
		this.matid = matid;
		this.pname = pname;
		this.price = price;
		this.pstock = pstock;
		this.img1 = img1;
	}

	//Getters and Setters
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getCateid() {
		return cateid;
	}
	public void setCateid(String cateid) {
		this.cateid = cateid;
	}
	public String getSizeid() {
		return sizeid;
	}
	public void setSizeid(String sizeid) {
		this.sizeid = sizeid;
	}
	public String getColorid() {
		return colorid;
	}
	public void setColorid(String colorid) {
		this.colorid = colorid;
	}
	public String getBrandid() {
		return brandid;
	}
	public void setBrandid(String brandid) {
		this.brandid = brandid;
	}
	public String getMatid() {
		return matid;
	}
	public void setMatid(String matid) {
		this.matid = matid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public Date getDate() {
		return pdate;
	}
	public void setDate(Date pdate) {
		this.pdate = pdate;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	
	public MultipartFile getMf1() {
		return mf1;
	}

	public void setMf1(MultipartFile mf1) {
		this.mf1 = mf1;
	}

	public MultipartFile getMf2() {
		return mf2;
	}

	public void setMf2(MultipartFile mf2) {
		this.mf2 = mf2;
	}

	public MultipartFile getMf3() {
		return mf3;
	}

	public void setMf3(MultipartFile mf3) {
		this.mf3 = mf3;
	}

	public MultipartFile getMf4() {
		return mf4;
	}

	public void setMf4(MultipartFile mf4) {
		this.mf4 = mf4;
	}

	public MultipartFile getMf5() {
		return mf5;
	}

	public void setMf5(MultipartFile mf5) {
		this.mf5 = mf5;
	}
	
	public String getSortcon() {
		return sortcon;
	}

	public void setSortcon(String sortcon) {
		this.sortcon = sortcon;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}

	public String getSearchcon() {
		return searchcon;
	}

	public void setSearchcon(String searchcon) {
		this.searchcon = searchcon;
	}

	public String getSearchkwd() {
		return searchkwd;
	}

	public void setSearchkwd(String searchkwd) {
		this.searchkwd = searchkwd;
	}


	
	private int page;
	private int perPageNum;
	
	public void setPage(int page) {
		if(page<=0 ) {
			this.page =1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <=0 || perPageNum > 100) {
			this.perPageNum =10;
			return;
		}
		
		this.perPageNum= perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	// method for MyBatis SQL Mapper -
	public int getPageStart() {		
		return ( (this.page -1) * perPageNum);
	}
	
	public int getPageEnd() {
		return (this.page * perPageNum + 1 );
	}
	
	
	// method for MyBatis SQL Mapper
	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "ItemVO [pid=" + pid + ", cateid=" + cateid + ", sizeid=" + sizeid + ", colorid=" + colorid
				+ ", brandid=" + brandid + ", matid=" + matid + ", pname=" + pname + ", price=" + price + ", pstock="
				+ pstock + ", pdate=" + pdate + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4="
				+ img4 + ", img5=" + img5 + ", sortcon=" + sortcon + ", sortorder=" + sortorder + ", searchcon="
				+ searchcon + ", searchkwd=" + searchkwd + ", page=" + page + ", perPageNum=" + perPageNum + "]";
	}

	
	
}
