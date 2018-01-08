package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cnema.event.EventService;

@Controller
@RequestMapping(value="/event/*")
public class EventController {

	@Inject
	private EventService eventService;
	
}
