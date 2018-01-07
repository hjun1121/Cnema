package com.cnema.theater;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	@Inject
	private ScheduleDAO scheduleDAO;
	
	public List<ScheduleDTO> scheduleList(int screen_num, Date day_num)throws Exception{
		return scheduleDAO.scheduleList(screen_num, day_num);
	}
	
	public List<ScreenDTO> screenList(int theater_num)throws Exception{
		return scheduleDAO.screenList(theater_num);
	}
	
	/*heeseong*/
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return scheduleDAO.scheduleInfo(sNum);
	}
}
