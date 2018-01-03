package com.cnema.theater;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	@Inject
	private ScheduleDAO scheduleDAO;
	
	/*heeseong*/
<<<<<<< HEAD
	public ScheduleDTO scheduleInfo(int snum) throws Exception{
		return scheduleDAO.scheduleInfo(snum);
=======
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return scheduleDAO.scheduleInfo(sNum);
>>>>>>> 105dd440f72d8446f95b7f275a2e47eed6c35c5e
	}
}
