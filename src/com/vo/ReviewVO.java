package com.vo;

public class ReviewVO {
	int rvno;
	int pid;
	String pname;
	String userid;
	String rvdate;
	String rvtitle;
	String rvcon;
	public int getRvno() {
		return rvno;
	}
	public void setRvno(int rvno) {
		this.rvno = rvno;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRvdate() {
		return rvdate;
	}
	public void setRvdate(String rvdate) {
		this.rvdate = rvdate;
	}
	public String getRvtitle() {
		return rvtitle;
	}
	public void setRvtitle(String rvtitle) {
		this.rvtitle = rvtitle;
	}
	public String getRvcon() {
		return rvcon;
	}
	public void setRvcon(String rvcon) {
		this.rvcon = rvcon;
	}
	@Override
	public String toString() {
		return "ReviewVO [rvno=" + rvno + ", pid=" + pid + ", pname=" + pname + ", userid=" + userid + ", rvdate="
				+ rvdate + ", rvtitle=" + rvtitle + ", rvcon=" + rvcon + "]";
	}
	

	
}
