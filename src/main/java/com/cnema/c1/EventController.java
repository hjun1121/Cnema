package com.cnema.c1;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.board.BoardDTO;
import com.cnema.event.EventDTO;
import com.cnema.event.EventJoinDTO;
import com.cnema.event.EventService;
import com.cnema.member.MemberDTO;
import com.cnema.util.ListData;

@Controller
@RequestMapping(value="/event/*")
public class EventController {

	@Inject
	private EventService eventService;
	
	//selectList
		@RequestMapping(value="eventList")
		public ModelAndView selectList(ListData listData, ModelAndView mv) throws Exception{
			mv = eventService.selectList(listData);
			return mv;
		}
	
	//insert
		@RequestMapping(value="eventWrite",method=RequestMethod.GET )
		public void insert() throws Exception{
				
		
		}
	//insert
		@RequestMapping(value="eventWrite",method=RequestMethod.POST )
		public ModelAndView insert(EventDTO eventDTO,HttpSession session,RedirectAttributes rd) throws Exception{
			ModelAndView mv =new ModelAndView();
			int result=0;
			result =eventService.insert(eventDTO, session);
				
			String message = "이벤트 작성 실패하였습니다.";
			if(result>0){
				message = "이벤트 작성 성공하였습니다.";
			}
			mv.addObject("message", message);
			mv.addObject("path", "./event/eventList");
			mv.setViewName("common/messagePath");
			return mv;
		}
		
		//View페이지
		@RequestMapping(value="eventView")
		public ModelAndView selectOne(ModelAndView mv,int num,HttpSession session, RedirectAttributes rd) throws Exception{
			EventDTO eventDTO = null;
			String id=" ";
			MemberDTO memberDTO= (MemberDTO) session.getAttribute("member");
			
			if(memberDTO !=null){
			id=memberDTO.getId();
			}
			EventJoinDTO eventJoinDTO =new EventJoinDTO();
			eventJoinDTO.setId(id);
			eventJoinDTO.setNum(num);
			
			eventDTO = (EventDTO)eventService.selectOne(num);
			 Calendar ca = Calendar.getInstance();
			 long now = ca.getTimeInMillis();
			 ca.setTime(eventDTO.getE_date());
			 long end = ca.getTimeInMillis();
			 
			 int endCheck= 0;
			 if(now>end){
				 endCheck=1;
			 }else{
			 }
			int check=eventService.eventJoinCheck(eventJoinDTO);
			
			
			if(eventDTO != null){
				mv.addObject("view", eventDTO);
				mv.addObject("check", check);
				mv.setViewName("event/eventView");
				mv.addObject("endCheck", endCheck);
			}else{
				rd.addFlashAttribute("message","업습니다.");
				mv.setViewName("redirect:./eventList");
			}
			
			return mv;
		}
		
		@RequestMapping(value="eventView2")
		public ModelAndView selectOne(ModelAndView mv,int num, RedirectAttributes rd) throws Exception{
			BoardDTO eventDTO = null;
			
			eventDTO = eventService.selectOne(num);
			
			if(eventDTO != null){
				mv.addObject("view", eventDTO);
				mv.setViewName("event/eventView2");
			}else{
				rd.addFlashAttribute("message","업습니다.");
				mv.setViewName("redirect:./eventList");
			}
			
			return mv;
		}
		
		//delete
		@RequestMapping(value="eventDelete")
		public String delete(int num, RedirectAttributes rd)throws Exception{
		int result = 0;
					
		result = eventService.delete(num);
					
		String message = "fail";
		if(result>0){
			message = "success";
		}
		rd.addFlashAttribute("message", message);
					
		return "redirect:./eventList";
		}
		
		//Update Form 들어가기
		@RequestMapping(value="eventUpdate",method=RequestMethod.GET)
		public String update(Model model, int num) throws Exception{
			BoardDTO boardDTO = null;
			try {
				boardDTO = eventService.selectOne(num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("view", boardDTO);
			return "event/eventUpdate";
		}
		
		//update --> DB 
		@RequestMapping(value="eventUpdate",method=RequestMethod.POST)
		public String update(EventDTO eventDTO,HttpSession session ,RedirectAttributes rd) throws Exception{
			
			int result = 0;
			result = eventService.update(eventDTO,session);
			
			String message = "fail";
			if(result>0){
				message = "success";
			}
			rd.addFlashAttribute("message", message);
			
			return "redirect:./eventList";
		}
		
		
}//end
