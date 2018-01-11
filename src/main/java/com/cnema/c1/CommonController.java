package com.cnema.c1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/common/**")
public class CommonController {

	@RequestMapping(value="resultClose", method=RequestMethod.GET)
	public void resultClose(String message, Model model){
		model.addAttribute("message", message);
	}
}
