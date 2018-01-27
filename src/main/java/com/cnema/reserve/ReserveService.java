package com.cnema.reserve;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.movie.MovieDAO;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.ReviewDAO;
import com.cnema.movie.ReviewDTO;
import com.cnema.theater.ScheduleDAO;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScreenDTO;
import com.cnema.theater.TheaterDAO;
import com.cnema.theater.TheaterDTO;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
@Transactional
public class ReserveService {
	@Inject
	private ReserveDAO reserveDAO;
	private ScheduleDAO scheduleDAO;
	private TicketPriceDAO ticketPriceDAO;
	private MovieDAO movieDAO;
	private TheaterDAO theaterDAO;
	private ReviewDAO reviewDAO;
	
	public List<Integer> seatCheck(int screen_num, int schedule_num) throws Exception{
		return reserveDAO.seatCheck(screen_num,schedule_num);
	}
	
	public int reserveInsert(ReserveDTO reserveDTO) throws Exception{
		return reserveDAO.reserveInsert(reserveDTO);
	}
	
	/*heeseong*/
	public int rTotalCount(String id, String kind) throws Exception{
		return reserveDAO.rTotalCount(id,kind);
	}
	/*heeseong*/
	public ModelAndView reserveList(String id,String kind,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(reserveDAO.rTotalCount(id,kind));
		
		List<ReserveDTO> rList = reserveDAO.reserveList(id,kind, rowNum);
		System.out.println("ls"+rList.size());
		ScheduleDTO scheduleDTO = null;
		TicketPriceDTO ticketPriceDTO = null;
		MovieDTO movieDTO = null;
		ReserveDTO reserveDTO2 = null;
		TheaterDTO theaterDTO = null;
		ScreenDTO screenDTO = null;
		ReviewDTO reviewDTO = null;
		int reviewCount = 0;
		for(ReserveDTO reserveDTO : rList){
			reserveDTO2 = reserveDAO.reserveBList(id, reserveDTO.getTp_num());
			/*reserveDTO2 = reserveService.reserveBList(memberDTO.getId(), reserveDTO.getTp_num());*/
			System.out.println("rs"+reserveDTO2.getSchedule_num());
			scheduleDTO = scheduleDAO.scheduleInfo(reserveDTO2.getSchedule_num());
			/*scheduleDTO = scheduleService.scheduleInfo(reserveDTO2.getSchedule_num());*/
			reserveDTO.setScheduleDTO(scheduleDTO);
			
			
			ticketPriceDTO = ticketPriceDAO.ticketPInfo(reserveDTO2.getTp_num());
			/*ticketPriceDTO = ticketPriceService.ticketPInfo(reserveDTO2.getTp_num());*/
			reserveDTO.setTicketPriceDTO(ticketPriceDTO);
			
			movieDTO = movieDAO.movieInfo(reserveDTO2.getMovie_num());
			/*movieDTO = movieService.movieInfo(reserveDTO2.getMovie_num());*/
			reserveDTO.setMovieDTO(movieDTO);
			
			theaterDTO= theaterDAO.theaterInfo(reserveDTO2.getTheater_num());
			/*theaterDTO = theaterService.theaterInfo(reserveDTO2.getTheater_num());*/
			reserveDTO.setTheaterDTO(theaterDTO);
			
			screenDTO = scheduleDAO.screenOne(reserveDTO2.getScreen_num());
			/*screenDTO = scheduleService.screenOne(reserveDTO2.getScreen_num());*/
			reserveDTO.setScreenDTO(screenDTO);
			
			reviewCount = reviewDAO.reviewCount(reserveDTO2.getMovie_num(), id); 
			/*reviewCount = reviewService.reviewCount(reserveDTO2.getMovie_num(),memberDTO.getId());*/
			reserveDTO.setCount(reviewCount);
			
			reviewDTO = reviewDAO.reviewInfo(reserveDTO2.getMovie_num(), id);
			/*reviewDTO = reviewService.reviewInfo(reserveDTO2.getMovie_num(), memberDTO.getId());*/
			reserveDTO.setReviewDTO(reviewDTO);
		}
		mv.addObject("rList", rList);
		mv.addObject("pager",pager);
		return mv;
		/*return reserveDAO.reserveList(id,kind);*/
	}
	/*heeseong*/
	public List<ReserveDTO> reserveAList(String id) throws Exception{
		return reserveDAO.reserveAList(id);
	}
	/*heeseong*/
	public ReserveDTO reserveBList(String id,int tp_num) throws Exception{
		return reserveDAO.reserveBList(id,tp_num);
	}
	/*heeseong*/
	public int reserveDel(int tp_num) throws Exception{
		return reserveDAO.reserveDel(tp_num);
	}
	/*heeseong*/
	public List<ReserveDTO> selectList(String id) throws Exception{
		return reserveDAO.selectList(id);
	}
}
