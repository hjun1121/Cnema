package com.cnema.c1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.event.EventDTO;
import com.cnema.event.EventService;
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
		public String insert(EventDTO eventDTO,HttpSession session,RedirectAttributes rd) throws Exception{
			
			int result=0;
			result =eventService.insert(eventDTO, session);
				
			String message = "fail";
			if(result>0){
				message = "success";
			}
			rd.addFlashAttribute("message", message);
			
			return "redirect:./eventList";
		}
	
		
		
		
		
		
}//end
