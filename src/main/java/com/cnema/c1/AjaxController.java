package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;

@Controller
@RequestMapping(value="/ajax/*")
public class AjaxController {

	@Inject
	private MemberService memberService;
	@Inject
	private TheaterService theaterSerice;
	
	
	@RequestMapping(value="locationList", method=RequestMethod.POST)
	public ModelAndView locationList(String area){
		List<TheaterDTO> ar = null;;
		try {
			ar = theaterSerice.locationList(area);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("location", ar);
		mv.setViewName("ajax/locationList");
		
		return mv;
	}
	
	@RequestMapping(value="emailCheck", method=RequestMethod.POST)
	public String emailCheck(){
		return "ajax/emailCheck";
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public ModelAndView idCheck(String id){
		MemberDTO memberDTO =null;
		try {
			memberDTO = memberService.memberInfo(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		if(memberDTO == null){
			mv.addObject("result", "ok");
		}else{
			mv.addObject("result", "no");
		}
		mv.setViewName("ajax/idCheck");
		
		return mv;
	}
	
}
