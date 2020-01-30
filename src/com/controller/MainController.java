package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Service;
import com.vo.ItemVO;
import com.vo.UserVO;

@Controller
public class MainController {

	@Resource(name="uservice")
	Service<String, UserVO> service;
	
	@Resource(name="iservice")
	Service<String, ItemVO> iservice;
	
	@RequestMapping("/main.mc")
	public ModelAndView main() {
		ItemVO bestVO = new ItemVO();
		ItemVO latestVO = new ItemVO();
		
		ArrayList<ItemVO> bestList = null;
		ArrayList<ItemVO> latestList = null;
		
		bestVO.setPage(1);
		bestVO.setPerPageNum(3);
		bestVO.setSortcon("popularity");
		latestVO.setPage(1);
		latestVO.setPerPageNum(3);
		latestVO.setSortcon("pdate");

		try {
			bestList = iservice.getall(bestVO);
			latestList = iservice.getall(latestVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("best", bestList);
		mv.addObject("latest", latestList);
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "/login.mc", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("center", "login");
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/logout.mc")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session != null) {
			session.invalidate();
		}
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value = "/login.mc", method = RequestMethod.POST)
	public ModelAndView loginimpl(UserVO dbuser, ModelAndView mv, HttpServletResponse response, HttpSession session, String userid, String pwd)
			throws Exception {
		dbuser = service.get(userid);
		try {
			if ( dbuser.getPwd().equals(pwd)) {

			session.setAttribute("loginid", userid);
			session.setAttribute("uname", dbuser.getUname());
			
			} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('비밀번호가 틀렸습니다.'); location.href='login.mc'</script>");
			out.flush();
			}
		} catch(Exception e) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script>alert('존재하지 않는 아이디입니다.'); location.href='login.mc'</script>");
			out.flush();
		} catch (IOException e1) {
			//e1.printStackTrace();
		}	
		//e.printStackTrace();
		}
		mv.addObject("center","center");
		mv.setViewName("main");
		return mv;
		

	}
}





