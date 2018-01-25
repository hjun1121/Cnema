package com.cnema.c1;

import java.util.ArrayList;
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
	public ModelAndView communityMain(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PageDTO> pageList = new ArrayList<>();
		List<PageDTO> myPageList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		
		List<Integer> pageNumList = new ArrayList<>();
		List<String> pageIdList = new ArrayList<>();
		PageDTO pageDTO = null;
		
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				myPageList = communityService.myPageList(memberDTO.getId(),"");
				pageList = communityService.myPageList(memberDTO.getId(),"");
				
				myPageList = communityService.myPageList(memberDTO.getId(),"");
				
				pageNumList = communityService.pageNumList(memberDTO.getId());
				for (int num : pageNumList) {//257,386
					pageIdList = communityService.pageIdList(num);
					for (String id : pageIdList) {
						List<Integer> page_num = new ArrayList<>();
						page_num = communityService.recommendPageList(id);
						
						for (int p_num : page_num) {
							pageDTO = communityService.pageSelect("", p_num);
							recomPageList.add(pageDTO);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("pageList", pageList);
		mv.addObject("recommendPage", recomPageList);
		mv.addObject("myPageList", myPageList);
		mv.setViewName("community2/communityMain");
		return mv;
	}
	
	@RequestMapping(value="pageRecomList",method=RequestMethod.GET)
	public ModelAndView pageRecomList(HttpSession session,String search) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(search==null){
			search="";
		}
		
		List<PageDTO> pageList = new ArrayList<>();
		List<PageDTO> myPageList = new ArrayList<>();
		List<Integer> pageNumList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				myPageList = communityService.myPageList(memberDTO.getId(),"");
				pageList = communityService.myPageList(memberDTO.getId(),"");
				
				pageNumList = communityService.pageNumList(memberDTO.getId());
				for (int num : pageNumList) {
					/*recomPageList = communityService.recommendPageList(search,num);*/
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("pageList", pageList);
		mv.addObject("search", search);
		mv.addObject("recommendPage", recomPageList);
		mv.addObject("myPageList", myPageList);
		mv.setViewName("community2/pageRecomList");
		return mv;
	}
	
	@RequestMapping(value="pageInsertList",method=RequestMethod.GET)
	public ModelAndView pageInsertList(HttpSession session,String search) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(search==null){
			search="";
		}
		
		List<PageDTO> pageList = new ArrayList<>();
		List<PageDTO> myPageList = new ArrayList<>();
		List<Integer> pageNumList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				myPageList = communityService.myPageList(memberDTO.getId(),search);
			
				pageList = communityService.myPageList(memberDTO.getId(),"");
				pageNumList = communityService.pageNumList(memberDTO.getId());
				for (int num : pageNumList) {
					/*recomPageList = communityService.recommendPageList(search,num);*/
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("search", search);
		mv.addObject("recommendPage", recomPageList);
		mv.addObject("myPageList", myPageList);
		mv.addObject("pageList", pageList);
		mv.setViewName("community2/pageInsertList");
		return mv;
	}
}
