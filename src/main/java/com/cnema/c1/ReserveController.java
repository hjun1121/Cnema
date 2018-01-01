package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.reserve.ReserveDTO;
import com.cnema.reserve.ReserveService;

@Controller
@RequestMapping(value="/reserve/**")
public class ReserveController {
	@Inject
	private ReserveService reserveService;
	
	/*heeseong*/
	@RequestMapping(value="reserveList", method=RequestMethod.GET)
	public void reserveList(String id, ModelAndView mv, RedirectAttributes rd){
		/*List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		
		try {
			rList = reserveService.reserveList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(rList != null){
			mv.addObject("rList",rList);
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../");
		}
		return mv;*/
	}
}
