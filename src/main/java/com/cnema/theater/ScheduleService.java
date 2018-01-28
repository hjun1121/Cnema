package com.cnema.theater;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
@Transactional
public class ScheduleService {
	@Inject
	private ScheduleDAO scheduleDAO;
	@Inject
	private TheaterDAO theaterDAO;
	
	public List<Integer> screenNumList(int theater_num, String day, int movie_num) throws Exception{
		return scheduleDAO.screenNumList(theater_num, day, movie_num);
	}
	
	public List<Integer> movieNumList(int theater_num, String day) throws Exception{
		return scheduleDAO.movieNumList(theater_num, day);
	}
	
	public List<ScheduleDTO> scheduleList(int screen_num, Date day_num, int movie_num)throws Exception{
		Calendar ca = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM-dd");
		String a =sd.format(day_num);
		String b = sd.format(ca.getTime());
		
		List<ScheduleDTO> ar = null;
		if(a.equals(b)){
			ar = scheduleDAO.scheduleList(screen_num, day_num, movie_num);
		}else{
			ar = scheduleDAO.scheduleListNext(screen_num, day_num, movie_num);
		}
		
		return ar;
	}
	
	public List<ScheduleDTO> movieSchedule(int theater_num, String day , int movie_num, int screen_num) throws Exception{
		Calendar ca = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM-dd");
		String b = sd.format(ca.getTime());
		List<ScheduleDTO> ar = null;
		if(b.equals(day)){
			ar =scheduleDAO.movieSchedule(theater_num, day, movie_num, screen_num);
		}else{
			ar = scheduleDAO.movieScheduleNext(theater_num, day, movie_num, screen_num);
		}
		
		return ar;
	}
	
	public List<ScreenDTO> screenList(int theater_num)throws Exception{
		return scheduleDAO.screenList(theater_num);
	}
	
	public ScheduleDTO scheduleOne(int schedule_num) throws Exception{
		return scheduleDAO.scheduleOne(schedule_num);
	}
	
	public int screenInsert(ScreenDTO screenDTO) throws Exception{
		return scheduleDAO.screenInsert(screenDTO);
	}
	
	public ScreenDTO screenOne(int screen_num) throws Exception{
		return scheduleDAO.screenOne(screen_num);
	}
	/*heeseong*/
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return scheduleDAO.scheduleInfo(sNum);
	}
	/*heeseong*/
	public int sTotalCount() throws Exception{
		return scheduleDAO.sTotalCount();
	}
	/*heeseong*/
	public ModelAndView scheduleAList(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(scheduleDAO.sTotalCount());
		
		List<ScheduleDTO> sList = scheduleDAO.scheduleAList(rowNum);
		mv.addObject("sList", sList);
		mv.addObject("pager",pager);
		return mv;
	}
	/*heeseong*/
	public int scheduleRevision(ScheduleDTO scheduleDTO) throws Exception{
		return scheduleDAO.scheduleRevision(scheduleDTO);
	}
	/*heeseong*/
	public int scheduleRemove(int schedule_num) throws Exception{
		return scheduleDAO.scheduleRemove(schedule_num);
	}
	/*heeseong*/
	public int scheduleInsert(ScheduleDTO scheduleDTO) throws Exception{
		return scheduleDAO.scheduleInsert(scheduleDTO);
	}
	/*heeseong*/
	public ModelAndView screenAList(ListData listData,int theater_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(scheduleDAO.totalCount());
		
		List<ScreenDTO> screenList = scheduleDAO.screenAList(rowNum,theater_num);
		for(ScreenDTO screenDTO : screenList){
			TheaterDTO theaterDTO = theaterDAO.selectOne(screenDTO.getTheater_num());
			screenDTO.setTheaterDTO(theaterDTO);
		}
		mv.addObject("sList", screenList);
		mv.addObject("pager",pager);
		return mv;
	}
	/*heeseong*/
	public int screenRevision(ScreenDTO screenDTO) throws Exception{
		return scheduleDAO.screenRevision(screenDTO);
	}
	/*heeseong*/
	public int screenRemove(int screen_num) throws Exception{
		return scheduleDAO.screenRemove(screen_num);
	}
	/*heeseong*/
	public ScreenDTO screenInfo(int theater_num) throws Exception{
		return scheduleDAO.screenInfo(theater_num);
	}
	/*heeseong*/
	public int totalCount() throws Exception{
		return scheduleDAO.totalCount();
	}
}
