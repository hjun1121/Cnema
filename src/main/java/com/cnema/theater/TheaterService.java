package com.cnema.theater;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TheaterService {
	
	@Inject
	private TheaterDAO theaterDAO;
	@Inject
	private DayDAO dayDAO;
	
	public List<DayDTO> dayList() throws Exception{
		return dayDAO.dayList(); 
	}
	
	public TheaterDTO selectOne(int theater_num) throws Exception{
		return theaterDAO.selectOne(theater_num);
	}
	
	public List<TheaterDTO> locationList(String area) throws Exception{
		return theaterDAO.locationList(area);
	}
	
	/*heeseong*/
	public List<TheaterDTO> theatherAList() throws Exception{
		return theaterDAO.theatherAList();
	}
	/*heeseong*/
	public List<TheaterDTO> thLocationList(String search) throws Exception{
		return theaterDAO.thLocationList(search);
	}
	/*heeseong*/
	public List<TheaterDTO> thAreaList(String search) throws Exception{
		return theaterDAO.thAreaList(search);
	}
	/*heeseong*/
	public TheaterDTO theaterInfo(int theater_num) {
		return theaterDAO.theaterInfo(theater_num);
	}
	/*heeseong*/
	public int theaterRevision(TheaterDTO theaterDTO) {
		return theaterDAO.theaterRevision(theaterDTO);
	}
	/*heeseong*/
	public int theaterRemove(int theater_num) {
		return theaterDAO.theaterRemove(theater_num);
	}
	/*heeseong*/
	public int theaterInsert(TheaterDTO theaterDTO) {
		return theaterDAO.theaterInsert(theaterDTO);
	}
	
}