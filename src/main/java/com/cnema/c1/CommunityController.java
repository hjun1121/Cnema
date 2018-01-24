package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.community.CommunityService;
import com.cnema.community.PageDTO;
import com.cnema.member.MemberDTO;

@Controller
@RequestMapping(value = "/community2/*")
public class CommunityController {
	@Inject
	private CommunityService communityService;
	
	//communityMain
	@RequestMapping(value="communityMain", method=RequestMethod.GET)
	public ModelAndView communityMain(HttpSession session,String search) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PageDTO> pageList = null;
		List<PageDTO> recommendPage = null;
		if(search==null){
			search="";
		}
		recommendPage = communityService.recommendPageList(search);
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				pageList = communityService.selectPageList(memberDTO.getId());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("recommendPage", recommendPage);
		mv.addObject("pageList", pageList);
		mv.setViewName("community2/communityMain");
		return mv;
	}
	@RequestMapping(value="recommnedPageList",method=RequestMethod.GET)
	public ModelAndView recommendPageList() throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
