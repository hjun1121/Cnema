package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.cnema.community.PageContentsDTO;
import com.cnema.community.PageDTO;
import com.cnema.community.PageMemberDTO;
import com.cnema.community.PageService;
import com.cnema.member.MemberDTO;
import com.cnema.message.MessageDTO;
import com.cnema.util.ListData;

@Controller
@RequestMapping(value = "/community/*")
public class PageController {
	
	@Inject
	private PageService pageService;
	
	
	//발신쪽지보기
	@RequestMapping(value = "sendMailView", method = RequestMethod.GET)
	public ModelAndView sendMailView(int message_num) throws Exception {
		ModelAndView mv = new ModelAndView();
		MessageDTO messageDTO = pageService.sendMailView(message_num);
		
		mv.addObject("mail", messageDTO);
		return mv;
	}
	
	//발신함
	@RequestMapping(value = "sendBox", method=RequestMethod.POST)
	public ModelAndView sendBox(HttpSession session, @RequestParam(defaultValue = "1", required=false)int curPage, ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		try {
			String id = memberDTO.getId();
			mv = pageService.selectSendMail(id, listData);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		return mv;
	}
	@RequestMapping(value = "sendBox", method=RequestMethod.GET)
	public void sendBox() throws Exception {
		
	}
	
	//쪽지 읽기
	@RequestMapping(value="mailView", method=RequestMethod.GET)
	public ModelAndView mailView(int message_num) throws Exception {
		ModelAndView mv = new ModelAndView();
		MessageDTO messageDTO = pageService.selectMailOne(message_num);
		
		mv.addObject("mail", messageDTO);
		return mv;
	}
	
	//쪽지함
	@RequestMapping(value="receiveBox", method=RequestMethod.POST)
	public ModelAndView receiveBox(HttpSession session, ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv = pageService.mailReceive(session, listData);
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);

		return mv;
	}
	@RequestMapping(value="receiveBox", method=RequestMethod.GET)
	public void receiveBox() throws Exception {
		
	}
	
	//mailBox
	@RequestMapping(value="mailBox", method=RequestMethod.GET)
	public ModelAndView mailBox(HttpSession session, ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv = pageService.mailReceive(session, listData);
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);

		return mv;
	}
	
	@RequestMapping(value="mailBox", method=RequestMethod.POST)
	public void mailBox() throws Exception {
		
	}
	
	
	//쪽지 보내기
	@RequestMapping(value = "mailSend")
	public ModelAndView mailSend() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

	//페이지 가입하기
	@RequestMapping(value = "pageMemberJoin", method=RequestMethod.POST)
	public ModelAndView pageMemberJoin(int page_num, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = 0;
		try {
			String id = memberDTO.getId();
			PageDTO pageDTO = pageService.selectPageOne(page_num);
			result = pageService.memberInsert(pageDTO, id);
		} catch (Exception e) {
			// TODO: handle exception
		}

		String message = "가입 실패";
		if(result > 0) { //가입 성공
			message = "가입 성공";
		}

		mv.addObject("message", message);
		mv.addObject("path", "community/pageMain?page_num="+page_num);
		mv.setViewName("/common/messagePath");
		return mv ;
	}
	@RequestMapping(value = "pageMemberJoin", method=RequestMethod.GET)
	public void pageMemberJoin() throws Exception {
		
	}


	//페이지 탈퇴하기
	@RequestMapping(value = "pageMemberDrop", method=RequestMethod.POST)
	public ModelAndView pageMemberDrop(HttpSession session, int page_num) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = "";
		int result = 0;
		try {
			id = memberDTO.getId();
			result = pageService.memberDrop(page_num, id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		String message = "탈퇴 실패";
		if(result > 0) {
			message = "탈퇴 성공";
		}

		mv.addObject("message", message);
		mv.addObject("path", "community2/communityMain");
		mv.setViewName("/common/messagePath");
		return mv;
	}


	//pageContentsWrite
	@RequestMapping(value = "pageContentsWrite", method=RequestMethod.POST)
	public ModelAndView pageContentsWrite(PageContentsDTO pageContentsDTO)throws Exception {
		ModelAndView mv = new ModelAndView();
		int result=pageService.pageContentsWrite(pageContentsDTO);
		
		String message = "글쓰기 실패";
		if(result > 0) {
			message = "글쓰기 성공";
		}
		mv.addObject("message", message);
		return mv;
	}
	@RequestMapping(value = "pageContentsWrite")
	public void pageContentsWrite()throws Exception {
		
	}
	//pageinfiniteScrolling
	@RequestMapping(value = "scrolling",method=RequestMethod.POST)
	public ModelAndView pageContentsScrolling(int page)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PageContentsDTO> ar = null;
		ar=pageService.pageContentslist(page);
		mv.addObject("list", ar);
		mv.setViewName("community/scrolling");
		return mv;
	}
	
	
	//pageMain
	@RequestMapping(value = "pageMain", method=RequestMethod.POST)
	public void pageMain() throws Exception {

	}

	//pageMain
	@RequestMapping(value = "pageMain", method=RequestMethod.GET)
	public ModelAndView pageMain(HttpSession session, @RequestParam(defaultValue="0", required=false)int page_num) throws Exception {
		ModelAndView mv = new ModelAndView();
		int member_num = 0;
		int memberCheck = 0;
		int pageMemberCount = 0;
		int mailCount = 0;
		List<PageDTO> joinPage = null;
		List<PageDTO> recommendPage = pageService.recommendPageList();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		try {
			String id = memberDTO.getId();
			memberCheck = pageService.memberCheck(page_num, id);
			member_num = pageService.selectPageMemberOne(id, page_num).getMember_num();
			mailCount = pageService.mailCount(id);
			joinPage = pageService.joinPageList(id);
			List<PageMemberDTO> mc = pageService.selectPageMemberList(page_num);
			pageMemberCount = mc.size();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		PageDTO pageDTO = pageService.selectPageOne(page_num); //페이지 정보 가져오기
		List<PageMemberDTO> pageMember = pageService.selectPageMemberList(page_num);

		mv.addObject("pageMemberCount", pageMemberCount);
		mv.addObject("joinPage", joinPage);
		mv.addObject("recommendPage", recommendPage);
		mv.addObject("memberCheck", memberCheck);
		mv.addObject("mailCount", mailCount);
		mv.addObject("member_num", member_num);
		mv.addObject("page", pageDTO);
		mv.addObject("pageMember", pageMember);
		mv.setViewName("community/pageMain");

		return mv;
	}

	
	//pageMainTest - pageContents Test
		@RequestMapping(value = "pageMainTest", method=RequestMethod.GET)
		public ModelAndView pageMainTest(HttpSession session, @RequestParam(defaultValue="0", required=false)int page_num) throws Exception {
			ModelAndView mv = new ModelAndView();
			int member_num = 0;
			int memberCheck = 0;
			int pageMemberCount = 0;
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			try {
				String id = memberDTO.getId();
				memberCheck = pageService.memberCheck(page_num, id);
				member_num = pageService.selectPageMemberOne(id, page_num).getMember_num();
				List<PageMemberDTO> mc = pageService.selectPageMemberList(page_num);
				pageMemberCount = mc.size();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			PageDTO pageDTO = pageService.selectPageOne(page_num); //페이지 정보 가져오기
			List<PageMemberDTO> pageMember = pageService.selectPageMemberList(page_num);

			mv.addObject("pageMemberCount", pageMemberCount);
			mv.addObject("memberCheck", memberCheck);
			mv.addObject("member_num", member_num);
			mv.addObject("page", pageDTO);
			mv.addObject("pageMember", pageMember);
			mv.setViewName("community/pageMainTest");

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

		String message = "페이지 생성 실패";
		if(result > 0) {
			message = "페이지 생성 완료";
		}
		
		mv.addObject("message", message);
		mv.addObject("path", "community2/communityMain");
		mv.setViewName("/common/messagePath");

		return mv;
	}
	
	

}
