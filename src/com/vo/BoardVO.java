package com.vo;

public class BoardVO {
	
	int bno;
	String userid;
	String bkind;
	String bdate;
	String btitle;
	String bcon;
	int viewcnt;
	
	public BoardVO() {
		super();
		this.page = 1;
		this.perPageNum = 10;		
	}

	public BoardVO(int bno, String userid, String bkind, String bdate, String btitle, String bcon, int viewcnt) {
		super();
		this.bno = bno;
		this.userid = userid;
		this.bkind = bkind;
		this.bdate = bdate;
		this.btitle = btitle;
		this.bcon = bcon;
		this.viewcnt = viewcnt;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getBkind() {
		return bkind;
	}

	public void setBkind(String bkind) {
		this.bkind = bkind;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String title) {
		this.btitle = title;
	}

	public String getBcon() {
		return bcon;
	}

	public void setBcon(String bcon) {
		this.bcon = bcon;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", userid=" + userid + ", bkind=" + bkind + ", bdate=" + bdate + ", btitle="
				+ btitle + ", bcon=" + bcon + ", viewcnt=" + viewcnt + "]";
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
	
	
	
}
