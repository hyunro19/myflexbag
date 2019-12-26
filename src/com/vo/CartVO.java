package com.vo;

import java.util.Date;

public class CartVO {
   int cartno;
   String userid;
   int pid;
   int pnum;
   Date date;
   int num;
   String pname;
   int price;
   String img;
   
   public int getCartno() {
      return cartno;
   }
   public void setCartno(int cartno) {
      this.cartno = cartno;
   }
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   public int getPid() {
      return pid;
   }
   public void setPid(int pid) {
      this.pid = pid;
   }
   public int getPnum() {
      return pnum;
   }
   public void setPnum(int pnum) {
      this.pnum = pnum;
   }
   public Date getDate() {
      return date;
   }
   public void setDate(Date date) {
      this.date = date;
   }
   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
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
   public String getImg() {
      return img;
   }
   public void setImg(String img) {
      this.img = img;
   }
}