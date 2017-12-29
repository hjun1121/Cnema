package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.movie.MovieService;
import com.cnema.util.ListData;

@Controller
@RequestMapping(value = "/movie/*")
public class MovieController {

	@Inject
	private MovieService movieService;
	
	
	//selectList
	@RequestMapping(value = "movieList")
	public ModelAndView selectList(ModelAndView mv) throws Exception {
		mv = movieService.selectList();
		
		return mv;
	}
	
//	//selectOne
//	@RequestMapping(value="noticeView")
//	public ModelAndView selectOne(ModelAndView mv, int num, RedirectAttributes rd) throws Exception{
//		BoardDTO boardDTO = null;
//		
//			boardDTO = noticeService.selectOne(num);
//		
//		
//		if(boardDTO != null){
//			mv.addObject("view", boardDTO);
//			mv.setViewName("board/boardView");
//		}else{
//			rd.addFlashAttribute("message","해당 번호의 게시물이 존재하지 않습니다.");
//			mv.setViewName("redirect:./noticeList");
//		}
//		mv.addObject("board", "notice");
//		
//		return mv;
//	}
	
	//insert
	
	//delete
	
	//update

	
}
