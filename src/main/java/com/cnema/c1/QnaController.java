package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.qna.QnaService;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;
import com.cnema.util.ListData;
import com.cnema.qna.QnaDTO;

@Controller
@RequestMapping(value="/qna/*")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	@Inject
	private TheaterService theaterService;
	
	@RequestMapping(value="locationList", method=RequestMethod.POST)
	public ModelAndView locationList(String area,ModelAndView mv)throws Exception{
		List<TheaterDTO> ar=theaterService.locationList(area);
		
		mv.addObject("location_list", ar);
		mv.setViewName("board/locationList");
		
		return mv;
		
	}
	
	
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
	
	@RequestMapping(value="qnaMyList", method=RequestMethod.POST)
	public ModelAndView selectMyList(String id, ModelAndView mv){
		try {
			mv = qnaService.selectMyList(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv){
		
		 List<TheaterDTO> ar= theaterService.areaList();
		 mv.addObject("area_list", ar);
		mv.setViewName("qna/qnaWrite");
		
		return mv;
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
		
		return "redirect:../board/park";
	}
	
	@RequestMapping(value="qnaView")
	public String selectOne(Model model, QnaDTO qnaDTO) {
		QnaDTO boardDTO = null;
		try {
			 boardDTO = qnaService.selectOne(qnaDTO.getNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", boardDTO);
		return "qna/qnaView";
	}
	
	@RequestMapping(value="qnaDelete")
	public String delete(int num, RedirectAttributes rd){
		int result = 0;
		try {
			result = qnaService.delete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "삭제 실패";
		if(result>0){
			message = "삭제 성공";
		}
		rd.addAttribute("message", message);
		return "redirect:./qnaList";
	}
	
	//Qna 답글 부분 함수들
	@RequestMapping(value="qnaUpdate", method=RequestMethod.POST)
	public String update(QnaDTO qnaDTO, RedirectAttributes rd){
		int result = 0;
		try {
			result = qnaService.update(qnaDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "답변 실패";
		if(result>0){
			message = "답변 성공";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:./qnaView?num="+qnaDTO.getNum();
	}
}
