package com.cnema.c1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.qna.QnaService;
import com.cnema.util.ListData;
import com.cnema.qna.QnaDTO;

@Controller
@RequestMapping(value="/qna/*")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	
	@RequestMapping(value="qnaList")
	public ModelAndView selectList(ListData listData, ModelAndView mv){
		try {
			mv = qnaService.selectList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public void insert(){
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	public String insert(QnaDTO qnaDTO, RedirectAttributes rd, HttpSession session){
		int result = 0;
		try {
			result = qnaService.insert(qnaDTO, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "등록 실패";
		if(result>0){
			message = "등록 성공";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:../home/park";
	}
}
