package com.cnema.c1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.util.ListData;
import com.cnema.board.BoardDTO;
import com.cnema.notice.NoticeDTO;
import com.cnema.notice.NoticeService;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	//selectList
	@RequestMapping(value="noticeList")
	public ModelAndView selectList(ModelAndView mv, ListData listData) throws Exception{
		
			mv = noticeService.selectList(listData);
			
		return mv;
	}
	
	//View페이지
		@RequestMapping(value="noticeView")
		public ModelAndView selectOne(ModelAndView mv, @RequestParam(defaultValue="0", required=false)int num, RedirectAttributes rd) throws Exception{
			BoardDTO noticeDTO = null;
			noticeDTO = noticeService.selectOne(num);
			if(noticeDTO != null){
				mv.addObject("view", noticeDTO);
				mv.setViewName("notice/noticeView");
			}else{
				rd.addFlashAttribute("message","존재하지 않는 글입니다.");
				mv.setViewName("redirect:./noticeList");
			}
			
			return mv;
		}
		
		
		@RequestMapping(value="noticeWrite",method=RequestMethod.GET)
		public String insert(Model model) throws Exception{
			
			return "notice/noticeWrite";
		}
		
		//insert->DB
		@RequestMapping(value="noticeWrite",method=RequestMethod.POST)
		public String insert(RedirectAttributes rd, NoticeDTO boardDTO, HttpSession session) throws Exception{
			int result = 0;
				result = noticeService.insert(boardDTO, session);
			String message = "fail";
			if(result>0){
				message = "success";
			}
			rd.addFlashAttribute("message", message);
			
			return "redirect:./noticeList";
		}
		
		//update --> form 
		@RequestMapping(value="noticeUpdate",method=RequestMethod.GET)
		public ModelAndView update(@RequestParam(defaultValue="0", required=false)int num, RedirectAttributes rd) throws Exception{
			ModelAndView mv = new ModelAndView();
			BoardDTO boardDTO = null;
			try {
				boardDTO = noticeService.selectOne(num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(boardDTO != null){
				mv.addObject("view", boardDTO);
				mv.setViewName("notice/noticeUpdate");
			}else{
				rd.addFlashAttribute("message","존재하지 않는 글입니다.");
				mv.setViewName("redirect:./noticeList");
			}
			
			return mv;
		}
		
		//update --> DB 
		@RequestMapping(value="noticeUpdate",method=RequestMethod.POST)
		public String update(BoardDTO boardDTO, RedirectAttributes rd) throws Exception{
			int result = 0;
			
				result = noticeService.update(boardDTO);
			
			String message = "fail";
			if(result>0){
				message = "success";
			}
			rd.addFlashAttribute("message", message);
			
			return "redirect:./noticeList";
		}
		
		//delete
		@RequestMapping(value="noticeDelete")
		public String delete(int num, RedirectAttributes rd)throws Exception{
			int result = 0;
			
			result = noticeService.delete(num);
			
			String message = "fail";
			if(result>0){
				message = "success";
			}
			rd.addFlashAttribute("message", message);
			
			return "redirect:./noticeList";
		}
		
		
}