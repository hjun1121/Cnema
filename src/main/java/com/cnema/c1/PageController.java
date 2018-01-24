package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.cnema.community.PageContentsDTO;
import com.cnema.community.PageDTO;
import com.cnema.community.PageMemberDTO;
import com.cnema.community.PageService;
import com.cnema.member.MemberDTO;

@Controller
@RequestMapping(value = "/community/*")
public class PageController {
	
	@Inject
	private PageService pageService;
	
	
	//페이지 가입하기
	@RequestMapping(value = "pageMemberJoin", method=RequestMethod.POST)
	public void pageMemberJoin() throws Exception {
		
	}
	
	
	//페이지 탈퇴하기
	@RequestMapping(value = "pageMemberDrop", method=RequestMethod.POST)
	public void pageMemberDrop() throws Exception {
		
	}
	

	//pageContentsWrite
	@RequestMapping(value = "pageContentsWrite", method=RequestMethod.POST)
	public void pageContentsWrite(PageContentsDTO pageContentsDTO)throws Exception {
		pageService.pageContentsWrite(pageContentsDTO);
	}


	//pageMain
	@RequestMapping(value = "pageMain", method=RequestMethod.POST)
	public void pageMain() {
		
	}

	//pageMain
	@RequestMapping(value = "pageMain", method=RequestMethod.GET)
	public ModelAndView pageMain(HttpSession session, int page_num) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = "";
		int memberCheck = 0;
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
			memberCheck = pageService.memberCheck(page_num, id);
			mv.addObject("memberCheck", memberCheck);
		} catch (Exception e) {
			// TODO: handle exception
		}
		PageDTO pageDTO = pageService.selectPageOne(page_num); //페이지 정보 가져오기
		List<PageMemberDTO> pageMember = pageService.selectPageMemberList(page_num);


		mv.addObject("page", pageDTO);
		mv.addObject("pageMember", pageMember);
		mv.setViewName("community/pageMain");

		return mv;
	}


	//pageInsert
	@RequestMapping(value = "pageInsert", method=RequestMethod.GET)
	public void pageInsert() {
		
	}
	
	//pageInsert
	@RequestMapping(value = "pageInsert", method=RequestMethod.POST)
	public ModelAndView pageInsert(PageDTO pageDTO, HttpSession session, RedirectAttributes rd) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = pageService.pageInsert(pageDTO, session);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		if(result > 0) {
			rd.addFlashAttribute("message", "페이지 만들기 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addFlashAttribute("message", "페이지 만들기 실패");
			mv.setViewName("redirect:../");
		}
		
		return mv;
	}
	
	

}
