package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vo.CartVO;
import com.vo.OrderDetailVO;
import com.vo.OrderVO;
import com.vo.UserVO;
import com.frame.Service;
import com.frame.ServiceO;

@Controller
public class CartController {

	@Resource(name = "cservice")
	Service<String, CartVO> service;
//하림--------------------------
	@Resource(name="oservice")
	ServiceO<String, OrderVO> oservice;
	
	@Resource(name="uservice")
	Service<String, UserVO> uservice;
	
	@Resource(name="odservice")
	Service<String, OrderDetailVO> odservice;
	//하림--------------------------
	
	@ResponseBody
	@RequestMapping(value = "/cadd.mc", method = RequestMethod.POST)
	public int addCart(HttpSession session, CartVO vo) throws Exception {
		
		int result = 0;
		int pid = vo.getPid();
		if(session.getAttribute("loginid") != null) {
			vo.setUserid((String)session.getAttribute("loginid"));
			ArrayList<CartVO> clist = service.getall(vo);

			//동욱
			boolean flag = false;
			for (CartVO cvo : clist) {
				flag = false;
				if (cvo.getPid() == pid) {
					vo.setPnum( vo.getPnum()+cvo.getPnum() );
					service.modify(vo);
					break;
				}
				else {
					flag = true;
				}
			}
			if(flag || clist.size()==0 ) service.register(vo);
			result = 1;
		}
		
		return result;
	}
	
	@RequestMapping("/clist.mc")
	public ModelAndView list(HttpSession session, ModelAndView mv, CartVO vo) {
		ArrayList<CartVO> list = null;
		if(session.getAttribute("loginid") == null) {
			mv.addObject("center", "login");
			mv.setViewName("main");
			return mv;
		}
		try {
			vo.setUserid((String)session.getAttribute("loginid"));
			list = service.getall(vo);
			mv.addObject("clist", list);
			mv.addObject("center", "cart/list");
			mv.setViewName("main");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	// 선택 삭제 만들기
	@ResponseBody
	@RequestMapping(value = "/deleteCart.mc", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO vo)
			throws Exception {
		int result = 0;
		if(session.getAttribute("loginid") == null) {
			return  result;
			// 로그인 안된채로 삭제하려고 하면 안되도록 조치 코드를 여기에 넣자
		};
		
		String cartNum;
		//chbox[] = ["653", "172"] 같은 carno(Lcart table의 seq)가 들어간 String 배열

		for (String i : chArr) { // 에이젝스에서 받은 chArr의 갯수만큼 반복
			cartNum = i; // i번째 데이터를 cartNum에 저장
			service.remove(cartNum);
		}
		result = 1;
		return result;
	}

	@RequestMapping("/cupdate.mc")
	public String updateCart(@RequestParam int amount, @RequestParam int productId, @RequestParam String userId) {
//		String userId=(String) session.getAttribute("loginid");
	
			CartVO vo = null;
			String pnum = String.valueOf(productId);
			try {
				vo = service.get(pnum);
				vo.setPid(productId);
				vo.setUserid(userId);
				vo.setPnum(amount);
				
				service.modify(vo);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		return "redirect:/clist.mc";
	}
	
	
	//주문화면으로 넘어가기
	@RequestMapping("/orderCart.mc")
	public ModelAndView orderCart(HttpSession session, ModelAndView mv, 
			@RequestParam(value="amount", defaultValue="0", required=false) int amount, CartVO vo, UserVO user) {
		
		ArrayList<CartVO> list = null;
		
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		try {
			list = service.getall(vo);
			user = uservice.get(userid);
			mv.addObject("amount", amount);
			mv.addObject("olist", list);
			mv.addObject("ouser", user);
			mv.addObject("center", "cart/order");
			mv.setViewName("main");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
	
	//order table이랑 order detail table에 정보 넣기, order detail화면으로 넘어가기 
	@RequestMapping("/order.mc")
	public ModelAndView order(HttpServletRequest request, ModelAndView mv, CartVO cv, UserVO uv, 
			@RequestParam(value="amount", defaultValue="0", required=false) int amountSum, 
			HttpSession session, OrderVO od, OrderDetailVO odt) {
//			String userAddr1, String userAddr2, String userAddr3, 
		
		//pricesum은 amount
		//quantitysum(sum)은 cart table의 pnum을 for문으로 더하기
		ArrayList<CartVO> cartList = null;
		ArrayList<OrderDetailVO> orderDetailList = null;
		
		int quantitySum = 0;
		try {
			String userid = (String)session.getAttribute("loginid");
			cv.setUserid(userid); //sesstion에서 가져온 id 갖고 cartvo에 set
			cartList = service.getall(cv); //cartvo를 arraylist 형태로 cartList에 넣기
			od.setCartList(cartList);
			
			uv = uservice.get(userid); //uservo에서 cartvo의 userid 일치하는 애를 가져와서 uv에 넣기
			String gender = uv.getGender(); //gender 호출
			
			//quantitySum 계산
			for(int i=0; i<cartList.size(); i++) {
				CartVO cartItem = cartList.get(i); 
				quantitySum += cartItem.getPnum();	//cartList에서 호출
			}
			
			//주문페이지에서 입력받은 내용 호출
//			String payid = request.getParameter("payid");
//			String receiver = request.getParameter("receiver");
//			String address1 = request.getParameter("userAddr1");
//			String address2 = request.getParameter("userAddr2");
//			String address3 = request.getParameter("userAddr3");
//			String address = userAddr1 + " "+ userAddr2 +" "+ userAddr3;
			//입력받은 주소 호출하여 이어붙이기
			
			//배송현황 은 배송중으로 sql에 박아버림
//			od.setPayid(payid);
//			od.setReceiver(receiver);
			
			//order 테이블에 값 입력
//			od.setAddress(address);
			od.setUserid(userid);
			od.setQuantitysum(quantitySum);
			od.setPricesum(amountSum);	//getParam  사용	
			od.setGender(gender);
			
			int orderno = oservice.register(od);
			od.setOrderno(orderno);
			odt.setOrderno(Integer.toString(orderno));
			orderDetailList = odservice.getall(odt);

			mv.addObject("ordervo", od);
			mv.addObject("odlist", orderDetailList);
			mv.addObject("center","cart/orderdetail");
			mv.setViewName("main");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
	
	  //주문배송조회
	   @RequestMapping("/ordercheck.mc")
	   public ModelAndView orderCheck(HttpSession session, ModelAndView mv, OrderVO od) {
	      ArrayList<OrderVO> orderList = null;
	      
	      String userid = (String)session.getAttribute("loginid");
	      try {
	         od.setUserid(userid);
	         orderList = oservice.getall(od);
	         mv.addObject("odlist", orderList);
	         mv.addObject("center", "cart/ordercheck");
	         mv.setViewName("main");
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      return mv;
	   }
	   


	//주문배송조회의 상세내역 
	@RequestMapping("/ordercheckview.mc")
	public ModelAndView orderCheckView(HttpSession session, ModelAndView mv, OrderDetailVO odt) {
	   ArrayList<OrderDetailVO> ordercheckview = null;
	   try {
	      ordercheckview = odservice.getall(odt);
	      mv.addObject("orderCheckView", ordercheckview);
	      mv.addObject("center", "cart/ordercheckview");
	      mv.setViewName("main");
	   } catch (Exception e) {
	      e.printStackTrace();
	   }

	   return mv;
	}
	
}