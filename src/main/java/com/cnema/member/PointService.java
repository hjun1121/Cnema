package com.cnema.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
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
	
	/*HeeSeong*/
	public List<PointDTO> pointList(String id,String testDatepicker1,String testDatepicker2) throws Exception{
		return pointDAO.pointList(id,testDatepicker1,testDatepicker2);
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
