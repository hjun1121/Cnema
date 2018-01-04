package com.cnema.theater;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TheaterService {
	
	@Inject
	private TheaterDAO theaterDAO;
	
	public TheaterDTO selectOne(int theater_num) throws Exception{
		return theaterDAO.selectOne(theater_num);
	}
	
	public List<TheaterDTO> locationList(String area) throws Exception{
		return theaterDAO.locationList(area);
	}
}
