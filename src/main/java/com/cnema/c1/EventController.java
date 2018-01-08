package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		@RequestMapping(value="eventWrite")
		public void insert() throws Exception{
				
		
		}
	
		
		
		
		
		
}//end
