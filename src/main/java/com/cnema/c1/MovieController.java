package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.member.MemberDTO;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.util.ListData;

@Controller
@RequestMapping(value="/movie/**")
public class MovieController {

	@Inject
	private MovieService movieService;
	
	//selectOne
	@RequestMapping(value="noticeView")
	public ModelAndView selectOne(String id,ModelAndView mv,RedirectAttributes rd) throws Exception {
		MovieDTO movieDTO = null;
		
		
		MemberDTO memberDTO = null;
		id="hseong";
		try {
			//memberDTO = memberService.selectOne(id);
			System.out.println(memberDTO.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(memberDTO != null){
			mv.addObject("myInfo",memberDTO);
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../home");
		}
		return mv;
	}
	
	//insert
	
	//delete
	
	//update

	
}
