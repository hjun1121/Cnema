package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.util.ListData;
import com.cnema.board.BoardDTO;
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
		public ModelAndView selectOne(ModelAndView mv, int num, RedirectAttributes rd) throws Exception{
			BoardDTO noticeDTO = null;
			
				noticeDTO = noticeService.selectOne(num);
			
			
			if(noticeDTO != null){
				mv.addObject("view", noticeDTO);
				mv.setViewName("notice/noticeView");
			}else{
				rd.addFlashAttribute("message","업습니다.");
				mv.setViewName("redirect:./noticeList");
			}
			
			return mv;
		}
		
		
}