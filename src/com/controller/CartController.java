package com.controller;

import java.util.ArrayList;
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

import com.frame.Service;
import com.frame.ServiceO;
import com.vo.CartVO;
import com.vo.OrderDetailVO;
import com.vo.OrderVO;
import com.vo.PageVO;
import com.vo.UserVO;

@Controller
public class CartController {
	@Resource(name = "cservice")
	Service<String, CartVO> service;

	@Resource(name="oservice")
	ServiceO<String, OrderVO> oservice;
	
	@Resource(name="uservice")
	Service<String, UserVO> uservice;
	
	@Resource(name="odservice")
	Service<String, OrderDetailVO> odservice;
	
	@Resource(name="pservice")
	Service<String, PageVO> pservice;
	
	@ResponseBody
	@RequestMapping(value = "/cadd.mc", method = RequestMethod.POST)
	public int addCart(HttpSession session, CartVO vo) throws Exception {
		int result = 2;
		int pid = vo.getPid();
		if(session.getAttribute("loginid") != null) {
			vo.setUserid( (String)session.getAttribute("loginid") );
			ArrayList<CartVO> clist;			
			clist = service.getall(vo);
			if(clist.size()==0) {
				service.register(vo);
				return 1;
			}
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
			if(flag) {
				service.register(vo);
			}
			result = 1;
		}		
		return result;
	}
	
	@RequestMapping("/clist.mc")
	public ModelAndView clist(HttpSession session, ModelAndView mv, CartVO vo) {
		if(session.getAttribute("loginid") != null) {
			ArrayList<CartVO> list = null;		
			try {
				vo.setUserid( (String)session.getAttribute("loginid") );
				list = service.getall(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("clist", list);
			mv.addObject("center", "cart/list");
			mv.setViewName("main");
			return mv;			
		} else if(session.getAttribute("loginid") == null) {
				mv.addObject("center", "login");
				mv.setViewName("main");
				return mv;
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteCart.mc", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO vo)
			throws Exception {
		int result = 0;
		if(session.getAttribute("loginid") == null) {
			return  result;
		};
	
		String cartNum;
		for (String i : chArr) { 
			cartNum = i; 
			service.remove(cartNum);
		}
		result = 1;
		return result;
	}

	@RequestMapping("/cupdate.mc")
	public String updateCart(int amount, int productId, String userId) {
			CartVO vo = null;
			String pnum = String.valueOf(productId);
			try {
				vo = service.get(pnum);
				vo.setPid(productId);
				vo.setUserid(userId);
				vo.setPnum(amount);				
				service.modify(vo);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		return "redirect:/clist.mc";
	}
	
	@RequestMapping("/orderCart.mc")
	public ModelAndView orderCart(HttpSession session, ModelAndView mv, 
			@RequestParam(value="amount", defaultValue="0", required=false) int amount, CartVO vo, UserVO user) throws Exception {
		
		ArrayList<CartVO> list = null;
		String userid = (String)session.getAttribute("loginid");
		vo.setUserid(userid);
		list = service.getall(vo);
		user = uservice.get(userid);
		mv.addObject("amount", amount);
		mv.addObject("olist", list);
		mv.addObject("ouser", user);
		mv.addObject("center", "cart/order");
		mv.setViewName("main");

		return mv;
	}
	
	@RequestMapping("/order.mc")
	public ModelAndView order(HttpServletRequest request, ModelAndView mv, CartVO cv, UserVO uv, 
			@RequestParam(value="amount", defaultValue="0", required=false) int amountSum, 
			HttpSession session, OrderVO od, OrderDetailVO odt) {
		ArrayList<CartVO> cartList = null;
		ArrayList<OrderDetailVO> orderDetailList = null;
		
		int quantitySum = 0;
		try {
			String userid = (String)session.getAttribute("loginid");
			cv.setUserid(userid); 
			cartList = service.getall(cv);
			od.setCartList(cartList);
			
			uv = uservice.get(userid); 
			String gender = uv.getGender(); 
			

			for(int i=0; i<cartList.size(); i++) {
				CartVO cartItem = cartList.get(i); 
				quantitySum += cartItem.getPnum();	
			}
			
			od.setUserid(userid);
			od.setQuantitysum(quantitySum);
			od.setPricesum(amountSum);
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
	
	   @RequestMapping("/ordercheck.mc")
	   public ModelAndView orderCheck(HttpSession session, ModelAndView mv, OrderVO od, PageVO pageprev) {
	      ArrayList<OrderVO> orderList = null;
	      ArrayList<PageVO> plist = null;
	      
	      String userid = (String)session.getAttribute("loginid");
	      try {
	    	mv.addObject("pageprev",pageprev);
			pageprev.setTablename("Lorder");
	        od.setUserid(userid);
	        orderList = oservice.getall(od);
	        plist = pservice.getall(pageprev);
	        
			PageVO pagenext = plist.get(0);
			pagenext.setPage(pageprev.getPage());
			pagenext.calcData(pagenext.getPage(), pagenext.getPerPageNum());

			mv.addObject("pagenext", pagenext);	
	        mv.addObject("odlist", orderList);
	        mv.addObject("center", "cart/ordercheck");
	        mv.setViewName("main");
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return mv;
	   }
	   
	@RequestMapping("/ordercheckview.mc")
	public ModelAndView orderCheckView(HttpSession session, ModelAndView mv, OrderDetailVO odt, PageVO pagevo) {
	   ArrayList<OrderDetailVO> ordercheckview = null;
	   try {
		   ordercheckview = odservice.getall(odt);
		   mv.addObject("pagevo",pagevo);
		   mv.addObject("pagelink",pagevo.getListLink());

	      mv.addObject("orderCheckView", ordercheckview);
	      mv.addObject("center", "cart/ordercheckview");
	      mv.setViewName("main");
	   } catch (Exception e) {
	      e.printStackTrace();
	   }

	   return mv;
	}
}
