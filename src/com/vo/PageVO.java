package com.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageVO {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10; //화면 하단 1~10, 11~20 같이 10개씩
	
	private int page=1;
	private int perPageNum=30;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public void calcData(int page, int perPageNum) {
		this.page = page;
		endPage = (int) (Math.ceil( page / (double) displayPageNum) *displayPageNum );
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) perPageNum ));
		
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage ==1 ? false : true;
		next = endPage * perPageNum >= totalCount ? false : true;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	@Override
	public String toString() {
		return "PageVO [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + "]";
	}
	
	private String cateid;
	private String sizeid;
	private String colorid;
	private String brandid;
	private String matid;
	
	private String sortcon;
	private String sortorder; //ASC, DESC
	private String searchcon;
	private String searchkwd;

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
	
	public String getListLink() {
		UriComponentsBuilder builder= UriComponentsBuilder
				.fromPath("")
//				.queryParam("page", this.getPage())
				.queryParam("perPageNum", this.getPerPageNum());
				if (this.getCateid() != null && this.getCateid() !="") builder = builder.queryParam("cateid", this.getCateid());
				if (this.getBrandid() != null && this.getBrandid() !="") builder = builder.queryParam("brandid", this.getBrandid());
				if (this.getMatid() != null && this.getMatid() !="") builder = builder.queryParam("matid", this.getMatid());
				if (this.getSortcon() != null && this.getSortcon() !="") builder = builder.queryParam("sortcon", this.getSortcon());
//				.queryParam("page", this.getPage())
		return builder.build().toString();
	}
	
}
