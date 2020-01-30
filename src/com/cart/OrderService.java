package com.cart;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.frame.Dao;
import com.frame.DaoO;
import com.frame.ServiceO;
import com.vo.CartVO;
import com.vo.ItemVO;
import com.vo.OrderDetailVO;
import com.vo.OrderVO;
@org.springframework.stereotype.Service("oservice")
public class OrderService implements ServiceO<String, OrderVO> {

	@Resource(name="odao")
	DaoO<String,OrderVO> odao;
	
	@Resource(name="oddao")
	Dao<String,OrderDetailVO> oddao;
	
	@Resource(name="cdao")
	Dao<String,CartVO> cdao;
	
	@Resource(name="idao")
	Dao<String,ItemVO> idao;
	
	@Override
	public int register(OrderVO v) throws Exception {
		
		ArrayList<CartVO> cartList = v.getCartList();
		
		// Transaction 처리
		//order 삽입
		odao.insert(v);
		int seq = v.getOrderno();
		for(int i=0; i<cartList.size(); i++) {
			CartVO cv = cartList.get(i);
			
			//orderdetail : order 하나와 매칭되는 orderdetail 처리
			OrderDetailVO odt = new OrderDetailVO();
			odt.setOrderno(Integer.toString(seq));
			odt.setPid(cv.getPid());
			odt.setUnitprice(cv.getPrice());
			odt.setQuantity(cv.getPnum());
			odt.setMprice( cv.getPrice() * cv.getPnum() );
			oddao.insert(odt);	
			
			//itemVO 주문량 만큼 재고 감소
			ItemVO iv = idao.select(Integer.toString(cv.getPid()));
			int tempstock = iv.getPstock();
			tempstock -= cv.getPnum();
			iv.setPstock(tempstock);
			idao.update(iv);
			
			//cartVO 카트 비우기
			int cartno = cv.getCartno();
			cdao.delete(Integer.toString(cartno));
		}
		return seq;
	}

//	@Override
//	public void remove(String k) throws Exception {
//		odao.delete(k);
//	}
//
//	@Override
//	public void modify(OrderVO v) throws Exception {
//		odao.update(v);
//	}
//
	@Override
	public OrderVO get(String k) throws Exception {
		return odao.select(k);
	}

	@Override
	public ArrayList<OrderVO> getall(OrderVO v) throws Exception {
		return odao.selectall(v);
	}

}
