package com.cnema.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.theater.TheaterDTO;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;


@Service
@Transactional
public class PointService {
	@Inject
	private PointDAO pointDAO;
	
	public int getPoint(String id, String contents, int point) throws Exception{
		PointDTO pointDTO = new PointDTO();
		pointDTO.setId(id);
		pointDTO.setContents(contents);
		pointDTO.setPoint_price(point);
		
		return pointDAO.getPoint(pointDTO);
	}
	
	public int usePoint(String id, String contents, int point) throws Exception{
		PointDTO pointDTO = new PointDTO();
		pointDTO.setId(id);
		pointDTO.setContents(contents);
		pointDTO.setPoint_price(point);
		
		return pointDAO.usePoint(pointDTO);
	}
	
	/*heeseong*/
	public int pTotalCount(String id,String testDatepicker1,String testDatepicker2) throws Exception{
		return pointDAO.pTotalCount(id,testDatepicker1,testDatepicker2);
	}
	/*HeeSeong*/
	public ModelAndView pointList(String id,String testDatepicker1,String testDatepicker2,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		
		Pager pager = listData.makePage(pointDAO.pTotalCount(id,testDatepicker1,testDatepicker2));
		System.out.println("service in"+testDatepicker1);
		List<PointDTO> pList = pointDAO.pointList(id,testDatepicker1,testDatepicker2,rowNum);
		mv.addObject("pList", pList);
		mv.addObject("pager",pager);
		return mv;
		/*return pointDAO.pointList(id,testDatepicker1,testDatepicker2);*/
	}
	/*HeeSeong*/
	public List<PointDTO> pointAList(String id) throws Exception{
		return pointDAO.pointAList(id);
	}
	/*HeeSeong*/
	public int pointInsert(int price, String id) throws Exception{
		return pointDAO.pointInsert(price,id);
	}
	/*HeeSeong*/
	public int withdrawal(String id) throws Exception{
		return pointDAO.withdrawal(id);
	}
}
