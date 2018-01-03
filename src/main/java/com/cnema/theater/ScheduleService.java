package com.cnema.theater;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	@Inject
	private ScheduleDAO scheduleDAO;
	
	/*heeseong*/
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return scheduleDAO.scheduleInfo(sNum);
	}
}
