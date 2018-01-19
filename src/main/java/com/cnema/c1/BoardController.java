package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.board.BoardTotalService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {

	@Inject
	private BoardTotalService boardTotalService;
	
	//selectList
	@RequestMapping(value="park")
	public ModelAndView selectList(ModelAndView mv) throws Exception{
		
			mv = boardTotalService.selectTotalList();
			
		return mv;
	}

		
		
}