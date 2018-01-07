package com.cnema.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class PointService {
	@Inject
	private PointDAO pointDAO;
	
	public List<PointDTO> pointList(String id,String testDatepicker1,String testDatepicker2) throws Exception{
		return pointDAO.pointList(id,testDatepicker1,testDatepicker2);
	}
}
