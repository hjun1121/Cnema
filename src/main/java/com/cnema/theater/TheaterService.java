package com.cnema.theater;

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
public class TheaterService {
	
	@Inject
	private TheaterDAO theaterDAO;
	@Inject
	private DayDAO dayDAO;
	
	public String week(String day)throws Exception{
		return dayDAO.week(day);
	}
	
	public List<DayDTO> dayList() throws Exception{
		return dayDAO.dayList(); 
	}
	
	public TheaterDTO selectOne(int theater_num) throws Exception{
		return theaterDAO.selectOne(theater_num);
	}
	
	public List<TheaterDTO> locationList(String area) throws Exception{
		return theaterDAO.locationList(area);
	}
	public List<TheaterDTO> areaList() throws Exception{
		return theaterDAO.areaList();
	}	
	public List<TheaterDTO> qrAreaList() throws Exception{
		return theaterDAO.qrAreaList();
	}		
	/*heeseong*/
	/*public List<TheaterDTO> theatherAList() throws Exception{
		return theaterDAO.theatherAList();
	}*/
	/*heeseong*/
	public int totalCount(String kind, String search) throws Exception{
		return theaterDAO.totalCount(kind, search);
	}
	/*heeseong*/
	public ModelAndView theaterList(String kind,String search,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(theaterDAO.totalCount(kind,search));
		
		List<TheaterDTO> theaterList = theaterDAO.theaterList(kind, search, rowNum);
		mv.addObject("theaterList", theaterList);
		mv.addObject("pager",pager);
		return mv;
	}
	/*heeseong*/
	public TheaterDTO theaterInfo(int theater_num) throws Exception{
		return theaterDAO.theaterInfo(theater_num);
	}
	/*heeseong*/
	public int theaterRevision(TheaterDTO theaterDTO) throws Exception{
		return theaterDAO.theaterRevision(theaterDTO);
	}
	/*heeseong*/
	public int theaterRemove(int theater_num) throws Exception{
		return theaterDAO.theaterRemove(theater_num);
	}
	/*heeseong*/
	public int theaterInsert(TheaterDTO theaterDTO) throws Exception{
		return theaterDAO.theaterInsert(theaterDTO);
	}
	
}
