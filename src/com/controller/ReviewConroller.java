package com.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Service;
import com.vo.ReviewVO;

@Controller
public class ReviewConroller {

	@Resource(name = "rservice")
	Service<String, ReviewVO> service;

	@RequestMapping("/review.mc")
	public ModelAndView qnaboard(ModelAndView mv, ArrayList<ReviewVO> list, ReviewVO vo) throws Exception {
		list = service.getall(vo);
		
		mv.addObject("rlist", list);
		mv.addObject("center", "review/review_index");
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value = "/review_write.mc", method = RequestMethod.GET)
	public ModelAndView getwrite(ModelAndView mv, String pid) {
		mv.addObject("pid", pid);
		mv.addObject("center", "review/review_write");
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value = "/review_write.mc", method = RequestMethod.POST)
	public String postwrite(ReviewVO vo) {
		try {
			service.register(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:review.mc";
	}
	
	@RequestMapping(value = "/review_detail.mc", method = RequestMethod.GET)
	public ModelAndView reviewdetailview(@RequestParam("rvno") String rvno, ModelAndView mv) throws Exception {
		ReviewVO vo = service.get(rvno);
		mv.addObject("rvdetail", vo);
		mv.addObject("center", "review/review_detail");
		mv.setViewName("main");
	return mv;
	}
	
	@RequestMapping(value = "/review_del.mc", method = RequestMethod.POST)
	public String delete(String rvno) {
		try {
			service.remove(rvno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:review_index.mc";
	}
	
	@RequestMapping("/review_update.mc")
	public ModelAndView reviewupdate(ModelAndView mv,String rvno,ReviewVO review) {
			try {
				review = service.get(rvno);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("ureview", review);
			mv.addObject("center", "review/review_update");
			mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value="/review_updateimpl.mc",method=RequestMethod.POST)
	public String updateimpl(ReviewVO review) throws Exception {

		service.modify(review);
		String rvno = ""+review.getRvno();
		return "redirect:review_detail.mc?rvno="+rvno;
	}
	
	
	

}
