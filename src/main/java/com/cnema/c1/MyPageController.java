package com.cnema.c1;

/*heeseong 코드*/
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.movie.WishDTO;
import com.cnema.movie.WishService;
import com.cnema.reserve.ReserveDTO;
import com.cnema.reserve.ReserveService;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.reserve.TicketPriceService;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;

@Controller
@RequestMapping(value="myPage/**")
public class MyPageController {
	@Inject
	private ReserveService reserveService;
	@Inject
	private ScheduleService scheduleService;
	@Inject
	private TicketPriceService ticketPriceService;
	@Inject
	private MovieService movieService;
	@Inject
	private WishService wishService;
	
	@RequestMapping(value="movieHistory",method=RequestMethod.GET)
	public ModelAndView movieHistory(String id, RedirectAttributes rd,String kind){
		/*if(kind == null) {
			kind = "2018";
		}*/
		ModelAndView mv = new ModelAndView();
		ScheduleDTO scheduleDTO = null;
		TicketPriceDTO ticketPriceDTO = null;
		MovieDTO movieDTO = null;
		
		List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		List<ScheduleDTO> schList = new ArrayList<ScheduleDTO>();
		List<TicketPriceDTO> tpList = new ArrayList<TicketPriceDTO>();
		List<MovieDTO> mrList = new ArrayList<MovieDTO>();
		try {
			/*rList = reserveService.reserveList(id,kind);*/
			rList = reserveService.reserveList(id);
			for(int size=0;size<rList.size();size++){
				scheduleDTO = scheduleService.scheduleInfo(rList.get(size).getSchedule_num());
				ticketPriceDTO = ticketPriceService.ticketPInfo(rList.get(size).getTp_num());
				movieDTO = movieService.movieInfo(rList.get(size).getMovie_num());
				schList.add(scheduleDTO);
				tpList.add(ticketPriceDTO);
				mrList.add(movieDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int num = 0;num<rList.size();num++){
			try {
				scheduleDTO = scheduleService.scheduleInfo(rList.get(num).getSchedule_num());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(id!=null){
			List<Object> reserveList = new ArrayList<>();
			reserveList.add(rList);
			reserveList.add(schList);
			reserveList.add(tpList);
			reserveList.add(mrList);
			mv.addObject("allList", reserveList);
			
			mv.setViewName("myPage/movieHistory");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="movieHistory",method=RequestMethod.POST)
	public ModelAndView movieHistory(int reserve_num, RedirectAttributes rd){
		int result = 0;
		try {
			result = reserveService.reserveDel(reserve_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		if(result>0){
			rd.addFlashAttribute("message", "예매 내역 삭제 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addFlashAttribute("message", "예매 내역 삭제 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="wishList",method=RequestMethod.GET)
	public ModelAndView wishList(String id,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		List<WishDTO> wList = new ArrayList<WishDTO>();
		List<MovieDTO> mwList = new ArrayList<MovieDTO>();
		try {
			wList = wishService.wishList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int size=0;size<wList.size();size++){
			try {
				movieDTO = movieService.movieInfo(wList.get(size).getMovie_num());
				mwList.add(movieDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mv.addObject("mwList", mwList);
		mv.setViewName("myPage/wishList");
		return mv;
	}
}
