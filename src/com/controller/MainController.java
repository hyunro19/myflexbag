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
import com.vo.UserVO;

@Controller
public class MainController {

	@Resource(name="uservice")
	Service<String, UserVO> service;
	
	@RequestMapping("/main.mc")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
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
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value = "/login.mc", method = RequestMethod.POST)
	public ModelAndView loginimpl(UserVO dbuser, ModelAndView mv,HttpServletRequest request,HttpServletResponse response, HttpSession session, String userid, String pwd)
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





