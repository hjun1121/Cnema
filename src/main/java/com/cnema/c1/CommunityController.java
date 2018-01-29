package com.cnema.c1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.community.CommunityService;
import com.cnema.community.PageDTO;
import com.cnema.member.MemberDTO;
import com.cnema.util.ListData;

@Controller
@RequestMapping(value = "/community2/*")
public class CommunityController {
	@Inject
	private CommunityService communityService;
	
	@RequestMapping(value="communityMain", method=RequestMethod.GET)
	public ModelAndView communityMain(HttpSession session,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<Integer> pageNumList = new ArrayList<>();
		List<String> pageIdList = new ArrayList<>();
		List<Integer> newPageNumList = new ArrayList<>();
		List<Integer> newRecomPageList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		List<PageDTO> pageList = new ArrayList<>();
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				mv = communityService.myPageList(memberDTO.getId(), "", listData);
				pageList = communityService.myPageAList(memberDTO.getId());
				pageNumList = communityService.pageNumList(memberDTO.getId());
				for (int num : pageNumList) {
					pageIdList = communityService.pageIdList(num);
					for (String id : pageIdList) {
						newPageNumList = communityService.recommendPageList(id);
					}
				}
				
				newRecomPageList = communityService.pageList();
				newPageNumList.addAll(newRecomPageList);
				
				HashSet<Integer> hs = new HashSet<>(newPageNumList);
				Iterator<Integer> it = hs.iterator();
				PageDTO pageDTO = null;
				
				for (int p_num : hs) {
					pageDTO = communityService.pageSelect("", p_num);
					recomPageList.add(pageDTO);
				}
				
				Collections.reverse(recomPageList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pageList", pageList);
		mv.addObject("recommendPage", recomPageList);
		mv.setViewName("community2/communityMain");
		return mv;
	}
	
	@RequestMapping(value="pageRecomList",method=RequestMethod.GET)
	public ModelAndView pageRecomList(HttpSession session,String search,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) throws Exception{
		if(search==null){
			search="";
		}
		ModelAndView mv = new ModelAndView();
		
		List<Integer> pageNumList = new ArrayList<>();
		List<String> pageIdList = new ArrayList<>();
		List<Integer> newPageNumList = new ArrayList<>();
		List<Integer> newRecomPageList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		List<PageDTO> recomPageSearchList = new ArrayList<>();
		List<PageDTO> pageList = new ArrayList<>();
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				mv = communityService.myPageList(memberDTO.getId(), search, listData);
				pageList = communityService.myPageAList(memberDTO.getId());
				pageNumList = communityService.pageNumList(memberDTO.getId());
				for (int num : pageNumList) {
					pageIdList = communityService.pageIdList(num);
					for (String id : pageIdList) {
						newPageNumList = communityService.recommendPageList(id);
					}
				}
				
				newRecomPageList = communityService.pageList();
				newPageNumList.addAll(newRecomPageList);
				
				HashSet<Integer> hs = new HashSet<>(newPageNumList);
				Iterator<Integer> it = hs.iterator();
				PageDTO pageDTO = null;
				
				for (int p_num : hs) {
					pageDTO = communityService.pageSelect("", p_num);
					int count = communityService.pageMemberNum(p_num);
					pageDTO.setCount(count);
					recomPageList.add(pageDTO);
				}
				
				for (int p_num : hs) {
					pageDTO = communityService.pageSelect(search, p_num);
					int count = communityService.pageMemberNum(p_num);
					pageDTO.setCount(count);
					if(pageDTO!=null){
						recomPageSearchList.add(pageDTO);
					}
				}
				
				Collections.reverse(recomPageList);
				Collections.reverse(recomPageSearchList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pageList", pageList);
		mv.addObject("search", search);
		mv.addObject("recommendPage", recomPageList);
		mv.addObject("recomPageSearchList", recomPageSearchList);
		mv.setViewName("community2/pageRecomList");
		return mv;
	}
	
	@RequestMapping(value="pageInsertList",method=RequestMethod.GET)
	public ModelAndView pageInsertList(HttpSession session,String search,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) throws Exception{
		if(search==null){ search=""; }
		ModelAndView mv = new ModelAndView();
		
		List<Integer> pageNumList = new ArrayList<>();
		List<String> pageIdList = new ArrayList<>();
		List<Integer> newPageNumList = new ArrayList<>();
		List<Integer> newRecomPageList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		List<PageDTO> pageList = new ArrayList<>();
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				listData.setPerPage(8);
				mv = communityService.myPageList(memberDTO.getId(), search, listData);
				pageList = communityService.myPageAList(memberDTO.getId());
				pageNumList = communityService.pageNumList(memberDTO.getId());
				for (int num : pageNumList) {
					pageIdList = communityService.pageIdList(num);
					for (String id : pageIdList) {
						newPageNumList = communityService.recommendPageList(id);
					}
				}
				
				newRecomPageList = communityService.pageList();
				newPageNumList.addAll(newRecomPageList);
				
				HashSet<Integer> hs = new HashSet<>(newPageNumList);
				Iterator<Integer> it = hs.iterator();
				PageDTO pageDTO = null;
				
				for (int p_num : hs) {
					pageDTO = communityService.pageSelect("", p_num);
					recomPageList.add(pageDTO);
				}
				
				Collections.reverse(recomPageList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		mv.addObject("pageList", pageList);
		mv.addObject("search", search);
		mv.addObject("recommendPage", recomPageList);
		mv.setViewName("community2/pageInsertList");
		return mv;
		
	}
}
