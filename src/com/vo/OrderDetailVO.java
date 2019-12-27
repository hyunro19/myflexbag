package com.vo;

public class OrderDetailVO {
	int orderdetailno;
	String orderno;
	int pid;
	int unitprice;
	int quantity;
	
	int mprice;

	public int getOrderdetailno() {
		return orderdetailno;
	}

	public void setOrderdetailno(int orderdetailno) {
		this.orderdetailno = orderdetailno;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getMprice() {
		return mprice;
	}

	public void setMprice(int mprice) {
		this.mprice = mprice;
	}

	@Override
	public String toString() {
		return "OrderDetailVO [orderdetailno=" + orderdetailno + ", orderno=" + orderno + ", pid=" + pid
				+ ", unitprice=" + unitprice + ", quantity=" + quantity + ", mprice=" + mprice + "]";
	}
	
}