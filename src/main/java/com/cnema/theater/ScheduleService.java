package com.cnema.theater;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	@Inject
	private ScheduleDAO scheduleDAO;
	
	public List<Integer> movieNumList(int theater_num, String day) throws Exception{
		return scheduleDAO.movieNumList(theater_num, day);
	}
	
	public List<ScheduleDTO> scheduleList(int screen_num, Date day_num, int movie_num)throws Exception{
		return scheduleDAO.scheduleList(screen_num, day_num, movie_num);
	}
	
	public List<ScreenDTO> screenList(int theater_num)throws Exception{
		return scheduleDAO.screenList(theater_num);
	}
	
	public ScheduleDTO scheduleOne(int schedule_num) throws Exception{
		return scheduleDAO.scheduleOne(schedule_num);
	}
	
	public ScreenDTO screenOne(int screen_num) throws Exception{
		return scheduleDAO.screenOne(screen_num);
	}
	/*heeseong*/
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return scheduleDAO.scheduleInfo(sNum);
	}
	/*heeseong*/
	public List<ScheduleDTO> scheduleAList() {
		return scheduleDAO.scheduleAList();
	}
	/*heeseong*/
	public int scheduleRevision(ScheduleDTO scheduleDTO) {
		return scheduleDAO.scheduleRevision(scheduleDTO);
	}
	/*heeseong*/
	public int scheduleRemove(int schedule_num) {
		return scheduleDAO.scheduleRemove(schedule_num);
	}
	/*heeseong*/
	public int scheduleInsert(ScheduleDTO scheduleDTO) {
		return scheduleDAO.scheduleInsert(scheduleDTO);
	}
}
